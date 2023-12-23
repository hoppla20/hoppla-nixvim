{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
  inherit (nixpkgs) lib;

  loader = haumeaInputs: path: let
    configuration =
      cell.lib.passInputsToFunctionArgs
      haumeaInputs
      (lib.toFunction (import path));
  in
    moduleInputs @ {config, ...}: let
      configurationBody =
        if lib.isFunction configuration
        then configuration moduleInputs
        else configuration;
    in
      lib.throwIf
      (lib.hasAttr "options" configurationBody)
      "Configurations are not allowed to have options."
      {
        imports =
          (cell.lib.attrValuesRecursive cell.nixvimModules)
          ++ (configurationBody.imports or []);

        config =
          configurationBody.config or (builtins.removeAttrs ["imports"] configuration);
      };
in
  inputs.haumea.lib.load {
    src = ./nixvimConfigurations;
    inputs = removeAttrs inputs ["self"] // {inherit cell;};
    inherit loader;
  }

{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
  inherit (nixpkgs) lib;

  loader = haumeaInputs: path: let
    rootModulePath = ["hoppla"];
    modulePath = lib.drop 6 (
      lib.splitString
      "/" (lib.removeSuffix ".nix" (toString path))
    );
    hopplaModulePath = rootModulePath ++ modulePath;
    superModulePath = lib.take ((builtins.length hopplaModulePath) - 1) hopplaModulePath;

    moduleFilePath =
      "${inputs.self.outPath}/nix/hoppla/nixvimModules/"
      + (lib.concatStringsSep "/" modulePath)
      + ".nix";

    module =
      cell.lib.passInputsToFunctionArgs
      haumeaInputs
      (lib.toFunction (import path));
  in
    moduleInputs @ {config, ...}: let
      moduleBody =
        if lib.isFunction module
        then
          module (moduleInputs
            // {
              cfg = {
                self = lib.getAttrFromPath hopplaModulePath config;
                super = lib.getAttrFromPath superModulePath config;
                root = lib.getAttrFromPath rootModulePath config;
              };
            })
        else module;
    in {
      _file = moduleFilePath;
      imports =
        moduleBody.imports or [];
      options =
        if moduleBody ? options
        then lib.setAttrByPath hopplaModulePath moduleBody.options
        else {};
      config =
        moduleBody.config or (builtins.removeAttrs moduleBody ["imports" "options"]);
    };
in
  inputs.haumea.lib.load {
    src = ./nixvimModules;
    inputs = removeAttrs inputs ["self"] // {inherit cell;};
    inherit loader;
  }

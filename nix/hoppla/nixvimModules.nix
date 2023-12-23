{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
  inherit (nixpkgs) lib;

  loader = haumeaInputs: path: let
    rootModulePath = ["hoppla"];
    modulePath =
      rootModulePath
      ++ lib.drop 6 (
        lib.splitString
        "/" (lib.removeSuffix ".nix" (toString path))
      );
    superModulePath = lib.take ((builtins.length modulePath) - 1) modulePath;

    module =
      cell.lib.passInputsToFunctionArgs
      haumeaInputs
      (lib.toFunction (import path));
  in
    moduleInputs @ {
      options,
      config,
      ...
    }: let
      moduleBody = module (moduleInputs
        // {
          cfg = {
            self = lib.getAttrFromPath modulePath config;
            super = lib.getAttrFromPath superModulePath config;
            root = lib.getAttrFromPath rootModulePath config;
          };
        });
    in {
      imports =
        moduleBody.imports or [];
      options =
        if moduleBody ? options
        then lib.setAttrByPath modulePath moduleBody.options
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

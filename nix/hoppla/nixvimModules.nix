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

    module = let
      moduleFunction = lib.toFunction (import path);
    in
      lib.pipe moduleFunction [
        lib.functionArgs
        (lib.mapAttrs (name: _: haumeaInputs.${name}))
        moduleFunction
      ];
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
        moduleBody.config or (lib.removeAttrs ["imports" "options"] moduleBody);
    };
in
  inputs.haumea.lib.load {
    src = ./nixvimModules;
    inputs = removeAttrs inputs ["self"] // {inherit cell;};
    inherit loader;
  }

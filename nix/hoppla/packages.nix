{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs nixvim;
  inherit (nixpkgs) lib;
  inherit (cell) nixvimModules;

  nixvimPackages =
    lib.mapAttrs'
    (name: module:
      lib.nameValuePair "nixvim-${name}"
      (nixvim.legacyPackages.${nixpkgs.system}.makeNixvimWithModule {
        pkgs = nixpkgs;
        module = {
          imports = builtins.attrValues cell.nixvimModules;
        };
      }))
    nixvimModules;
in
  nixvimPackages
  // {
    default = nixvimPackages.nixvim-default;
  }

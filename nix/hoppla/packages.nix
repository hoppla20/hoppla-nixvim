{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs nixvim;
  inherit (nixpkgs) lib;

  nixvimPackages =
    lib.mapAttrs'
    (name: module:
      lib.nameValuePair "nixvim-${name}"
      (nixvim.legacyPackages.${nixpkgs.system}.makeNixvimWithModule {
        pkgs = nixpkgs;
        module = {
          imports = [cell.nixvimConfigurations.${name}];
        };
      }))
    (lib.filterAttrs (_: builtins.isFunction) cell.nixvimConfigurations);
in
  nixvimPackages
  // {
    default = nixvimPackages.nixvim-default;
  }

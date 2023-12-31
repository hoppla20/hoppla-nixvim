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
        pkgs = cell.pkgs.nixpkgs-with-neovim-nightly;
        module = {
          imports = [cell.nixvimConfigurations.${name}];
        };
      }))
    cell.nixvimConfigurations;
in
  nixvimPackages
  // {
    default = nixvimPackages.nixvim-default;
  }

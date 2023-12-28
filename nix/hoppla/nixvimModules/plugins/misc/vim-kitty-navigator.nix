{nixpkgs}: {
  lib,
  cfg,
  ...
}: let
  inherit
    (lib)
    mkOption
    mkEnableOption
    mkIf
    types
    ;
in {
  options = {
    enable = mkEnableOption "vim-kitty-navigator";
  };

  config = mkIf cfg.self.enable {
    extraPlugins = [nixpkgs.vimPlugins.vim-kitty-navigator];
  };
}

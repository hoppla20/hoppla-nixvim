{
  nixpkgs,
  nixvim,
}: {
  lib,
  cfg,
  helpers,
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
    enable = mkEnableOption "vim-vinegar";

    package = helpers.mkPackageOption "vim-vinegar" nixpkgs.vimPlugins.vim-vinegar;
  };

  config = mkIf cfg.self.enable {
    extraPlugins = [cfg.self.package];
  };
}

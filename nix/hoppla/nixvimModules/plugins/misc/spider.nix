# https://nix-community.github.io/nixvim/plugins/spider
# https://github.com/chrisgrieser/nvim-spider
_: {
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
    enable = mkEnableOption "spider";
  };

  config = mkIf cfg.self.enable {
    plugins.spider = {
      enable = true;
      keymaps = {
        silent = true;
        motions = {
          b = "b";
          e = "e";
          ge = "ge";
          w = "w";
        };
      };
    };
  };
}

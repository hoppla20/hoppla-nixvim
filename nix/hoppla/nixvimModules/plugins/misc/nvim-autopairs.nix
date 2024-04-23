# https://nix-community.github.io/nixvim/plugins/nvim-autopairs
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
    enable = mkEnableOption "nvim-autopairs";
  };

  config = mkIf cfg.self.enable {
    plugins.nvim-autopairs = {
      enable = true;
      settings.check_ts = cfg.root.plugins.languageSupport.treesitter.enable;
    };
  };
}

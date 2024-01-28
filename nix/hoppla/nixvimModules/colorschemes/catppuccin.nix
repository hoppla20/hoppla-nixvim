# https://nix-community.github.io/nixvim/colorschemes/catppuccin
_: {
  lib,
  config,
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
    enable = mkEnableOption "catppuccin";

    darkTheme =
      mkEnableOption "dark theme" // {default = true;};

    flavours = {
      dark = mkOption {
        type = types.str;
        default = "macchiato";
      };
      light = mkOption {
        type = types.str;
        default = "latte";
      };
    };
  };

  config = mkIf cfg.self.enable {
    colorscheme = "catppuccin";
    colorschemes.catppuccin = {
      enable = true;
      flavour =
        if cfg.self.darkTheme
        then cfg.self.flavours.dark
        else cfg.sefl.flavours.light;
      background = {
        inherit (cfg.self.flavours) dark;
        inherit (cfg.self.flavours) light;
      };
      integrations = {
        cmp = true;
        native_lsp.enabled = true;
        neotree = true;
        noice = true;
        notify = true;
        telescope.enabled = true;
        treesitter = true;
        treesitter_context = true;
        indent_blankline = {
          enabled = true;
          scope_color = "lavender";
        };
      };
    };
  };
}

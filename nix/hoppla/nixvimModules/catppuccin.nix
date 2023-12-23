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
    types
    ;
in {
  options = {
    darkTheme =
      mkEnableOption "Dark Theme" // {default = true;};

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

  config = {
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
      dimInactive = {
        enabled = true;
        percentage = 0.15;
      };
    };
  };
}

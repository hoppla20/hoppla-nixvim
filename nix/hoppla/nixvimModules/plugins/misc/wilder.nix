# https://nix-community.github.io/nixvim/plugins/wilder
# https://github.com/gelguy/wilder.nvim
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
    mkMerge
    types
    ;
in {
  options = {
    enable = mkEnableOption "oil";
  };

  config = mkIf cfg.self.enable {
    plugins.wilder = {
      enable = true;
      modes = [":" "/" "?"];
      prevKey = "<C-p>";
      nextKey = "<C-n>";
      acceptKey = "<Down>";
      rejectKey = "<Up>";
      renderer = ''
        wilder.popupmenu_renderer(
          wilder.popupmenu_border_theme({
            highlights = {
              border = 'Normal',
            },
            border = 'rounded',
            left = {' ', wilder.popupmenu_devicons()},
            right = {' ', wilder.popupmenu_scrollbar()},
          })
        )
      '';
    };
  };
}

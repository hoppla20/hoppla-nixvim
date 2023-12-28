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

    globals.kitty_navigator_no_mappings = 1;
    keymaps = [
      {
        key = "<M-j>";
        action = ":KittyNavigateDown<cr>";
        options.silent = true;
      }
      {
        key = "<M-k>";
        action = ":KittyNavigateUp<cr>";
        options.silent = true;
      }
      {
        key = "<M-h>";
        action = ":KittyNavigateLeft<cr>";
        options.silent = true;
      }
      {
        key = "<M-l>";
        action = ":KittyNavigateRight<cr>";
        options.silent = true;
      }
    ];
  };
}

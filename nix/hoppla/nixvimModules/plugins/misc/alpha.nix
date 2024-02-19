_: {
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
    enable = mkEnableOption "alpha";
  };

  config = mkIf cfg.self.enable {
    plugins.alpha = {
      enable = true;
      layout = [
        {
          type = "padding";
          val = 2;
        }
        {
          type = "text";
          opts = {
            hl = "Type";
            position = "center";
          };
          val = [
            "███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
            "████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
            "██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
            "██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
            "██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
            "╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
          ];
        }
        {
          type = "padding";
          val = 2;
        }
        {
          type = "group";
          val = let
            buttonOpts = {
              position = "center";
              cursor = 3;
              width = 50;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          in [
            {
              type = "button";
              val = "󰈞  Find file";
              on_press = helpers.mkRaw "function() vim.cmd[[Telescope find_files]] end";
              opts = buttonOpts // {shortcut = "󱁐 f f";};
            }
            {
              type = "button";
              val = "  Recent files";
              on_press = helpers.mkRaw "function() vim.cmd[[Telescope oldfiles]] end";
              opts = buttonOpts // {shortcut = "󱁐 f r";};
            }
            {
              type = "button";
              val = "  Open project";
              on_press = helpers.mkRaw "function() vim.cmd[[Telescope projects]] end";
              opts = buttonOpts // {shortcut = "󱁐 T p";};
            }
            {
              type = "button";
              val = "󰈔  New file";
              on_press = helpers.mkRaw "function() vim.cmd[[ene]] end";
              opts = buttonOpts // {shortcut = ":ene ";};
            }
            {
              type = "button";
              val = "󰗼  Quit Neovim";
              on_press = helpers.mkRaw "function() vim.cmd[[qa]] end";
              opts = buttonOpts // {shortcut = ":qa ";};
            }
          ];
        }
      ];
    };

    keymaps = [
      {
        key = "<leader><enter>";
        action = ":tabnew | Alpha<cr>";
        options.silent = true;
      }
    ];
  };
}

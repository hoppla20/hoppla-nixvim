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
            "  ███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗  "
            "  ████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║  "
            "  ██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║  "
            "  ██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║  "
            "  ██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║  "
            "  ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝  "
          ];
        }
        {
          type = "padding";
          val = 2;
        }
        {
          type = "group";
          val = [
            {
              desc = "󰈔  New file";
              command = ":ene<cr>";
              shortcut = "e";
            }
            {
              desc = "󰈞  Find file";
              command = ":Telescope find_files<cr>";
              shortcut = "f";
            }
            {
              desc = "  Recent files";
              command = ":Telescope oldfiles<cr>";
              shortcut = "r";
            }
            {
              desc = "  Open project";
              command = ":Telescope projects<cr>";
              shortcut = "p";
            }
            {
              desc = "󰗼  Quit Neovim";
              command = ":qa<cr>";
              shortcut = "q";
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

# https://nix-community.github.io/nixvim/plugins/lsp
# language servers are configured in `hoppla.languages.*`
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
    enable = mkEnableOption "lsp";
  };

  config = mkIf cfg.self.enable {
    plugins = {
      lsp = {
        enable = true;

        keymaps = {
          # disable default lsp diagnostic keymaps
          # use lspsaga
          diagnostic = {};
          lspBuf = {
            "gD" = "references";
            "gd" = "definition";
            "gi" = "implementation";
            "gt" = "type_definition";
            "<leader>lf" = "format";
          };
        };
      };

      # https://nvimdev.github.io/lspsaga/
      lspsaga = {
        enable = true;
        definition = {
          width = 0.618;
          height = 0.618;
        };
        lightbulb = {
          sign = false;
        };
      };

      lsp-lines.enable = true;

      lsp-format = {
        enable = true;
        lspServersToEnable = "all";
      };
    };

    keymaps = let
      prefix = "<leader>l";
    in [
      {
        key = "K";
        action = ":Lspsaga hover_doc<cr>";
      }
      {
        key = "<leader>j";
        action = ":Lspsaga diagnostic_jump_next<cr>";
      }
      {
        key = "<leader>k";
        action = ":Lspsaga diagnostic_jump_prev<cr>";
      }
      {
        key = "${prefix}a";
        action = ":Lspsaga code_action<cr>";
      }
      {
        key = "${prefix}f";
        action = ":Lspsaga finder<cr>";
      }
      {
        key = "${prefix}d";
        action = ":Lspsaga peek_definition<cr>";
      }
      {
        key = "${prefix}t";
        action = ":Lspsaga peek_type_definition<cr>";
      }
      {
        key = "${prefix}r";
        action = ":Lspsaga rename<cr>";
      }
      {
        key = "${prefix}o";
        action = ":Lspsaga outline<cr>";
      }
      {
        key = "${prefix}h";
        action = ":Lspsaga incoming_calls<cr>";
      }
      {
        key = "${prefix}H";
        action = ":Lspsaga outgoing_calls<cr>";
      }
    ];
  };
}

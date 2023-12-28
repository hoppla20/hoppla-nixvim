# https://nix-community.github.io/nixvim/plugins/lsp
# https://nix-community.github.io/nixvim/plugins/lsp-lines
# https://nix-community.github.io/nixvim/plugins/lsp-format
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
            "${cfg.root.leaderPrefixes.lsp}f" = "format";
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
      prefix = cfg.root.leaderPrefixes.lsp;
      actionWithDesc = key: action: {
        inherit key;
        action = ":Lspsaga ${action}<cr>";
        options.desc = "Lspsaga ${action}";
      };
    in [
      (actionWithDesc "K" "hover_doc")
      (actionWithDesc "<leader>j" "diagnostic_jump_next")
      (actionWithDesc "<leader>k" "diagnostic_jump_prev")
      (actionWithDesc "${prefix}a" "code_action")
      (actionWithDesc "${prefix}f" "finder")
      (actionWithDesc "${prefix}d" "peek_definition")
      (actionWithDesc "${prefix}t" "peek_type_definition")
      (actionWithDesc "${prefix}r" "rename")
      (actionWithDesc "${prefix}o" "outline")
      (actionWithDesc "${prefix}h" "incoming_calls")
      (actionWithDesc "${prefix}H" "outgoing_calls")
    ];
  };
}

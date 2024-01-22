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
          lspBuf = let
            prefix = cfg.root.leaderPrefixes.lsp;
          in {
            "K" = "hover";
            "gD" = "references";
            "gd" = "definition";
            "gi" = "implementation";
            "gt" = "type_definition";
            "${prefix}f" = "format";
            "${prefix}a" = "code_action";
            "${prefix}r" = "rename";
          };
        };
      };

      lsp-lines = {
        enable = true;
        currentLine = true;
      };

      lsp-format = {
        enable = true;
        lspServersToEnable = "all";
      };

      none-ls = {
        enable = true;
        enableLspFormat = true;
      };
    };
  };
}

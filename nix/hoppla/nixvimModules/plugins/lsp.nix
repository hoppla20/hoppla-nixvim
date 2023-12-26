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
          diagnostic = {
            "<leader>j" = "goto_next";
            "<leader>k" = "goto_prev";
          };
          lspBuf = {
            "K" = "hover";
            "gD" = "references";
            "gd" = "definition";
            "gi" = "implementation";
            "gt" = "type_definition";
            "<leader>lf" = "format";
            "<leader>la" = "code_action";
          };
        };
      };

      lsp-format = {
        enable = true;
        lspServersToEnable = "all";
      };
    };
  };
}

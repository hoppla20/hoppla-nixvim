# https://nix-community.github.io/nixvim/plugins/oil
# https://github.com/stevearc/oil.nvim
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

  config = mkIf cfg.self.enable (mkMerge [
    {
      plugins.oil = {
        enable = true;
        settings = {
          deleteToTrash = true;
          skip_confirm_for_simple_edits = true;
          keymaps = {
            "q" = "actions.close";
            "gr" = "actions.refresh";
          };
        };
      };

      keymaps = [
        {
          key = "-";
          action = ":Oil<cr>";
        }
      ];
    }
    (mkIf cfg.root.plugins.languageSupport.lsp.enable {
      plugins.oil.settings = {
        lsp_rename_autosave = "unmodified";
      };
    })
  ]);
}

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
        deleteToTrash = true;
        trashCommand = "trash put";
        skipConfirmForSimpleEdits = true;
      };

      keymaps = [
        {
          key = "-";
          action = ":Oil<cr>";
        }
      ];
    }
    (mkIf cfg.root.plugins.languageSupport.lsp.enable {
      plugins.oil.extraOptions = {
        lsp_rename_autosave = "unmodified";
      };
    })
  ]);
}

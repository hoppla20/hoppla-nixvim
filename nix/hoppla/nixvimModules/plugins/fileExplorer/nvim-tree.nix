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
    enable = mkEnableOption "nvim-tree";
  };

  config = mkIf cfg.self.enable {
    plugins.nvim-tree = {
      enable = true;
      autoClose = true;
      hijackCursor = true;
      hijackNetrw = false;
      reloadOnBufenter = true;
      syncRootWithCwd = true;
      respectBufCwd = true;
      updateFocusedFile = {
        enable = true;
        updateRoot = true;
      };
    };

    keymaps = [
      {
        key = "${cfg.root.leaderPrefixes.files}t";
        action = ":NvimTreeToggle<cr>";
        options = {
          silent = true;
          desc = "Toggle file tree";
        };
      }
    ];
  };
}

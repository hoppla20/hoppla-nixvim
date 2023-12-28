# https://nix-community.github.io/nixvim/plugins/bufferline
# https://nix-community.github.io/nixvim/plugins/lualine
_: {
  lib,
  config,
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
    enable = mkEnableOption "Lines";
  };

  config = mkIf cfg.self.enable {
    plugins = {
      barbar = {
        enable = true;
        autoHide = true;
        keymaps = {
          silent = true;
          close = "<M-q>";
          next = "<M-.>";
          previous = "<M-,>";
          moveNext = "<M-S-.>";
          movePrevious = "<M-S-,>";
          pick = "${cfg.root.leaderPrefixes.buffers}p";
          pin = "${cfg.root.leaderPrefixes.buffers}P";
          goTo1 = "<M-1>";
          goTo2 = "<M-2>";
          goTo3 = "<M-3>";
          goTo4 = "<M-4>";
          goTo5 = "<M-5>";
          goTo6 = "<M-6>";
          goTo7 = "<M-7>";
          goTo8 = "<M-8>";
          goTo9 = "<M-9>";
          orderByBufferNumber = "${cfg.root.leaderPrefixes.buffers}b";
          orderByDirectory = "${cfg.root.leaderPrefixes.buffers}d";
          orderByLanguage = "${cfg.root.leaderPrefixes.buffers}l";
          orderByWindowNumber = "${cfg.root.leaderPrefixes.buffers}w";
        };
      };

      lualine.enable = true;
    };

    keymaps = let
      barbarMap = key: cmd: {
        inherit key;
        action = ":${cmd}<cr>";
        options = {
          silent = true;
          desc = cmd;
        };
      };
    in [
      (barbarMap "<M-S-q>" "BufferClose!")
      (barbarMap "<M-S-q>" "BufferCloseAllButCurrentOrPinned")
      (barbarMap "${cfg.root.leaderPrefixes.buffers}r" "BufferRestore")
    ];
  };
}

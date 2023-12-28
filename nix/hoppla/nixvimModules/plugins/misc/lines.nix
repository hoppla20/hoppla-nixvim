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
      bufferline = {
        enable = true;
      };

      lualine = {
        enable = true;
      };
    };

    keymaps = [
      {
        key = "<M-,>";
        action = ":BufferLineCyclePrev<cr>";
        options = {
          silent = true;
          desc = "Switch to next buffer";
        };
      }
      {
        key = "<M-.>";
        action = ":BufferLineCycleNext<cr>";
        options = {
          silent = true;
          desc = "Switch to previous buffer";
        };
      }
      {
        key = "<M-S-,>";
        action = ":BufferLineMovePrev<cr>";
        options = {
          silent = true;
          desc = "Move current buffer to left";
        };
      }
      {
        key = "<M-S-.>";
        action = ":BufferLineMoveNext<cr>";
        options = {
          silent = true;
          desc = "Move current buffer to right";
        };
      }
      {
        key = "${cfg.root.leaderPrefixes.buffers}p";
        action = ":BufferLinePick<cr>";
        options = {
          silent = true;
          desc = "Pick buffer";
        };
      }
      {
        key = "<M-q>";
        action = ":bdelete<cr>";
        options = {
          silent = true;
          desc = "Delete current buffer";
        };
      }
    ];
  };
}

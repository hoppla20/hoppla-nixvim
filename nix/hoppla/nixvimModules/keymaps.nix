# https://nix-community.github.io/nixvim/keymaps
_: {cfg, ...}: {
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
      key = "<M-<>";
      action = ":BufferLineMovePrev<cr>";
      options = {
        silent = true;
        desc = "Move current buffer to left";
      };
    }
    {
      key = "<M->>";
      action = ":BufferLineMoveNext<cr>";
      options = {
        silent = true;
        desc = "Move current buffer to right";
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
    {
      key = "${cfg.root.leaderPrefixes.buffers}p";
      action = ":BufferLinePick<cr>";
      options = {
        silent = true;
        desc = "Pick buffer";
      };
    }
  ];
}

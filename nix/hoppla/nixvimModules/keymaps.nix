# https://nix-community.github.io/nixvim/keymaps
_: {
  keymaps = [
    {
      key = "<M-,>";
      action = ":BufferLineCyclePrev<cr>";
      options.silent = true;
    }
    {
      key = "<M-.>";
      action = ":BufferLineCycleNext<cr>";
      options.silent = true;
    }
    {
      key = "<M-<>";
      action = ":BufferLineMovePrev<cr>";
      options.silent = true;
    }
    {
      key = "<M->>";
      action = ":BufferLineMoveNext<cr>";
      options.silent = true;
    }
    {
      key = "<M-q>";
      action = ":bdelete<cr>";
      options.silent = true;
    }
    {
      key = "<leader>bp";
      action = ":BufferLinePick<cr>";
      options.silent = true;
    }
  ];
}

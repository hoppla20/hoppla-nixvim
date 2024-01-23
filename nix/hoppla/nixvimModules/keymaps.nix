# https://nix-community.github.io/nixvim/keymaps
_: {cfg, ...}: {
  keymaps = [
    {
      key = "<leader><esc>";
      action = ":nohlsearch<cr>";
      options = {
        silent = true;
        desc = "nohlsearch";
      };
    }
    {
      key = "<pageup>";
      action = "<C-u>";
      options.silent = true;
    }
    {
      key = "<pagedown>";
      action = "<C-d>";
      options.silent = true;
    }
    {
      key = "<home>";
      action = "^";
      options.silent = true;
    }
    {
      key = "<end>";
      action = "$";
      options.silent = true;
    }
    {
      key = "<M-q>";
      action = ":bdelete<cr>";
    }
    {
      key = "<M-S-q>";
      action = ":bdelete!<cr>";
    }
    {
      key = "${cfg.root.leaderPrefixes.buffers}q";
      action = ":bdelete<cr>";
    }
    {
      key = "${cfg.root.leaderPrefixes.buffers}Q";
      action = ":bdelete!<cr>";
    }
    {
      key = "<M-,>";
      action = ":bprevious<cr>";
    }
    {
      key = "<M-.>";
      action = ":bnext<cr>";
    }
    {
      key = "<C-M-q>";
      action = ":tabclose<cr>";
    }
    {
      key = "<C-M-,>";
      action = ":tabprevious<cr>";
    }
    {
      key = "<C-M-.>";
      action = ":tabnext<cr>";
    }
    {
      key = "<M-S-,>";
      action = ":-tabmove<cr>";
    }
    {
      key = "<M-S-.>";
      action = ":+tabmove<cr>";
    }
  ];
}

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
  ];
}

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
  ];
}

# Hoppla Nixvim

## Installation

- Single dependency: [nix](https://nixos.org/)
- Run:
  `nix run github:hoppla20/hoppla-nixvim -- $file`
- Install:
  `nix profile install github: hoppla20/hoppla-nixvim`

## Keymap convention

### Leader prefixes

| Prefix | Description |
| --- | --- |
| <leader>s | Search |
| <leader>t | Telescope |
| <leader>f | Files |
| <leader>b | Buffers |
| <leader>g | Git |
| <leader>l | LSP |
| <leader>T | ToDo |
| <leader>n | Neorg |

## Interesting

- [quickfix (vim)](https://neovim.io/doc/user/quickfix.html)

## Useful Keybindings

### Folding

| Map | Description |
| --- | --- |
| zc | Close fold |
| zo | Open fold |
| za | Toggle fold |
| zC / zO / zA | Operate on all folding levels
| zr | reduce global folding level |
| zm | increase global folding level |
| zR / zM | Close / Open all buffers |

## ToDos

- [ ] [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo)
- [ ] [nvim-surround](https://github.com/kylechui/nvim-surround)
- [ ] [treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)
- [ ] [trouble](https://github.com/folke/trouble.nvim)
- [ ] [yankey](https://github.com/gbprod/yanky.nvim)

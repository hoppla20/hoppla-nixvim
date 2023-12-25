# https://nix-community.github.io/nixvim/keymaps
_: {
  keymaps = let
    normal = key: action: args:
      args
      // {
        inherit key action;
        mode = "n";
      };
  in [
    (normal "<M-,>" ":BufferLineCyclePrev<cr>" {})
    (normal "<M-.>" ":BufferLineCycleNext<cr>" {})
    (normal "<M-<>" ":BufferLineMovePrev<cr>" {})
    (normal "<M->>" ":BufferLineMoveNext<cr>" {})
    (normal "<M-q>" ":bdelete<cr>" {})
    (normal "<leader>bp" ":BufferLinePick<cr>" {})
  ];
}

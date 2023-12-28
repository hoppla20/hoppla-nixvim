{cell}: {
  config = {
    globals = {
      mapleader = " ";
    };

    options = {
      number = true;
      relativenumber = true;
      wrap = false;
      foldenable = false; # enable folding by using 'zc'
    };

    clipboard.providers.wl-copy.enable = true;

    hoppla = {
      colorschemes.catppuccin.enable = true;

      languages = {
        nix.enable = true;
      };

      plugins = {
        languageSupport = {
          treesitter.enable = true;
          lsp.enable = true;
        };

        completion.nvim-cmp.enable = true;

        fileExplorer = {
          #vim-vinegar.enable = true;
          oil.enable = true;
        };

        utils = {
          git.enable = true;
          direnv.enable = true;
        };

        misc = {
          lines.enable = true;
          cursorline.enable = true;
          telescope.enable = true;
          nvim-autopairs.enable = true;
          rainbow-delimiters.enable = true;
          todo-comments.enable = true;
          which-key.enable = true;
          vim-kitty-navigator.enable = true;
          comment-nvim.enable = true;
          alpha.enable = true;
          undotree.enable = true;
        };
      };
    };

    # regex match groups
    #match = {};

    # extra options

    # extraConfigLuaPre = '''';
    # extraConfigLua = '''';
    # extraConfigLuaPost = '''';
    # extraConfigVim = '''';
    # extraFiles = {};
    # extraPackages = [];
    # extraLuaPackages = [];
    # extraPlugins = [];
  };
}

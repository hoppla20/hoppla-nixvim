{cell}: {
  config = {
    globals = {
      mapleader = " ";
      maplocalleader = "\\";
    };

    opts = {
      number = true;
      relativenumber = true;
      wrap = false;
      foldenable = true;
      foldlevel = 99;
      splitright = true;
      splitbelow = true;
      conceallevel = 2;
    };

    clipboard.providers.wl-copy.enable = true;

    hoppla = {
      colorschemes.catppuccin.enable = true;

      languages = {
        nix.enable = true;
        terraform.enable = true;
        shell.enable = true;
        dockerfile.enable = true;
        ruby.enable = true;
        yaml.enable = true;
        ansible.enable = true;
        python.enable = true;
        markdown.enable = true;
      };

      plugins = {
        languageSupport = {
          treesitter.enable = true;
          lsp.enable = true;
        };

        completion.nvim-cmp.enable = true;

        fileExplorer = {
          # vim-vinegar.enable = true;
          # nvim-tree.enable = true;
          oil.enable = true;
          ranger-nvim.enable = true;
        };

        utils = {
          git.enable = true;
          direnv.enable = true;
          # anki-nvim.enable = true;
          markdown-preview.enable = true;
          zoxide.enable = true;
          obsidian.enable = true;
        };

        ui = {
          rainbow-delimiters.enable = true;
          indent-blankline.enable = true;
          # wilder.enable = true;
          noice.enable = false;
          notify.enable = true;
        };

        misc = {
          lines.enable = true;
          telescope.enable = true;
          nvim-autopairs.enable = true;
          todo-comments.enable = true;
          which-key.enable = true;
          vim-kitty-navigator.enable = true;
          kitty-runner-nvim.enable = true;
          comment-nvim.enable = true;
          alpha.enable = true;
          undotree.enable = true;
          project-nvim.enable = true;
          spider.enable = true;
          # neorg.enable = true;
          clipboard-image-nvim.enable = true;
          # easymotion.enable = true;
          leap.enable = true;
          scope.enable = true;
        };
      };
    };

    # regex match groups
    # match = {};

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

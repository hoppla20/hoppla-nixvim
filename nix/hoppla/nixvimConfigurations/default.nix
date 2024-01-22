{cell}: {
  config = {
    globals = {
      mapleader = " ";
      maplocalleader = "\\";
    };

    options = {
      number = true;
      relativenumber = true;
      wrap = false;
      foldenable = true;
      foldlevel = 99;
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
      };

      plugins = {
        languageSupport = {
          treesitter.enable = true;
          lsp.enable = true;
        };

        completion.nvim-cmp.enable = true;

        fileExplorer = {
          # vim-vinegar.enable = true;
          oil.enable = true;
          nvim-tree.enable = true;
        };

        utils = {
          git.enable = true;
          direnv.enable = true;
          # anki-nvim.enable = true;
          markdown-preview.enable = true;
        };

        ui = {
          rainbow-delimiters.enable = true;
          # wilder.enable = true;
          noice.enable = true;
          notify.enable = true;
        };

        misc = {
          lines.enable = true;
          telescope.enable = true;
          nvim-autopairs.enable = true;
          todo-comments.enable = true;
          which-key.enable = true;
          vim-kitty-navigator.enable = true;
          comment-nvim.enable = true;
          alpha.enable = true;
          undotree.enable = true;
          project-nvim.enable = true;
          spider.enable = true;
          neorg.enable = true;
          clipboard-image-nvim.enable = true;
          # easymotion.enable = true;
          leap.enable = true;
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

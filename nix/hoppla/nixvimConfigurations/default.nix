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
        lines.enable = true;
        telescope.enable = true;
        vim-vinegar.enable = true;
        treesitter.enable = true;

        utils = {
          git.enable = true;
          direnv.enable = true;
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

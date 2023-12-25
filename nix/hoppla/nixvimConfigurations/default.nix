{cell}: {
  config = {
    globals = {
      mapleader = " ";
    };

    options = {
      number = true;
      relativenumber = true;
      wrap = false;
    };

    clipboard.providers.wl-copy.enable = true;

    hoppla = {
      colorschemes.catppuccin.enable = true;

      languages = {
        nix.enable = true;
      };

      plugins = {
        utils.direnv.enable = true;
        lines.enable = true;
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

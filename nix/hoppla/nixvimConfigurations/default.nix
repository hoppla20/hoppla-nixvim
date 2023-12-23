# only configure base neovim configs here
# outsource plugin and colorscheme configurations to a nixvimModule
#
# base neovim options:
# https://nix-community.github.io/nixvim/NeovimOptions/index.html
{cell}: {
  config = {
    # global variables
    globals = {
      mapleader = " ";
    };

    options = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
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

{
  nixpkgs,
  nixvim,
  cell,
}: {
  lib,
  cfg,
  ...
}: let
  inherit
    (lib)
    mkOption
    mkEnableOption
    mkIf
    types
    ;

  inherit (nixvim.lib) helpers;
in {
  options = {
    enable = mkEnableOption "clipboard-image-nvim";

    package = helpers.mkPackageOption "clipboard-image-nvim" cell.pkgs.default.vimPlugins.clipboard-image-nvim;
  };

  config = let
    setupOptions = {
      default = {
        img_dir = helpers.emptyTable;
        img_dir_txt = "";
      };
    };
  in
    mkIf cfg.self.enable {
      extraPlugins = [cfg.self.package];

      extraConfigLua = ''
        require('clipboard-image').setup(${helpers.toLuaObject setupOptions})
      '';

      keymaps = let
        leader = cfg.root.leaderPrefixes.images;
      in [
        {
          key = "${leader}p";
          action = ":PasteImg<cr>";
          options.desc = "Paste Image";
        }
      ];
    };
}

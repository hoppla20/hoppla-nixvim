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
    enable = mkEnableOption "anki-nvim";

    package = helpers.mkPackageOption "anki-nvim" cell.pkgs.default.vimPlugins.anki-nvim;
  };

  config = let
    setupOptions = {
      tex_support = true;
      linters = helpers.mkRaw "require('anki.linters').default_linters()";
      models = {
        Basic = "Default";
      };
    };
  in
    mkIf cfg.self.enable {
      extraPlugins = [cfg.self.package];

      extraConfigLua = ''
        require('anki').setup(${helpers.toLuaObject setupOptions})
      '';
    };
}

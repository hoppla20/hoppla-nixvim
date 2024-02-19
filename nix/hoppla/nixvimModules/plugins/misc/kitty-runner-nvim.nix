{
  nixpkgs,
  nixvim,
  cell,
}: {
  lib,
  cfg,
  helpers,
  ...
}: let
  inherit
    (lib)
    mkOption
    mkEnableOption
    mkIf
    types
    ;
in {
  options = {
    enable = mkEnableOption "kitty-runner-nvim";

    package = helpers.mkPackageOption "kitty-runner-nvim" cell.pkgs.default.vimPlugins.kitty-runner-nvim;
  };

  config = mkIf cfg.self.enable {
    extraPlugins = [cfg.self.package];

    extraConfigLua = helpers.wrapDo ''
      require("kitty-runner").setup()
    '';
  };
}

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

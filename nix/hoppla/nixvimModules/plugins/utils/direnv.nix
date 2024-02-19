{
  nixpkgs,
  nixvim,
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

  boolToInt = bool:
    if bool
    then 1
    else 0;
in {
  options = {
    enable = mkEnableOption "direnv";

    package = helpers.mkPackageOption "direnv" nixpkgs.vimPlugins.direnv-vim;

    auto = mkEnableOption "auto" // {default = true;};
    silentLoad = mkEnableOption "silent_load";
  };

  config = mkIf cfg.self.enable {
    extraPlugins = [cfg.self.package];
    globals = {
      direnv_auto = boolToInt cfg.self.auto;
      direnv_silent_load = boolToInt cfg.self.silentLoad;
    };
  };
}

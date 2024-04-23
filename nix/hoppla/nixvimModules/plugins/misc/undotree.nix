_: {
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
in {
  options = {
    enable = mkEnableOption "undotree";
  };

  config = mkIf cfg.self.enable {
    plugins.undotree = {
      enable = true;
      settings.FocusOnToggle = true;
    };

    keymaps = [
      {
        key = "<F5>";
        action = ":UndotreeToggle<cr>";
        options = {
          silent = true;
          desc = "Toggle undotree";
        };
      }
    ];
  };
}

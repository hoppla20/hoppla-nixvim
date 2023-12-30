{nixvim}: {
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
    enable = mkEnableOption "neorg";
  };

  config = mkIf cfg.self.enable {
    plugins.neorg = {
      enable = true;
      modules = {
        "core.defaults" = helpers.emptyTable;
        "core.concealer" = helpers.emptyTable;
        "core.dirman" = {
          config = {
            index = "index.norg";
            workspaces = {
              notes = "~/Workspace/neorg/notes";
            };
          };
        };
        "core.completion" = {
          config.engine = "nvim-cmp";
        };
      };
    };
  };
}

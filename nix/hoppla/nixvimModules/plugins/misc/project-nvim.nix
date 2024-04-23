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
    mkMerge
    types
    ;
in {
  options = {
    enable = mkEnableOption "project-nvim";
  };

  config = mkIf cfg.self.enable (mkMerge [
    {
      plugins.project-nvim = {
        enable = true;
        patterns = [".git" "flake.nix" "Makefile" ".project-root"];
        scopeChdir = "tab";
      };
    }
    (mkIf cfg.root.plugins.misc.telescope.enable {
      plugins.project-nvim.enableTelescope = true;
      keymaps = [
        {
          key = "${cfg.root.leaderPrefixes.telescope}p";
          action = ":Telescope projects<cr>";
          options = {
            silent = true;
            desc = "Telescope projects";
          };
        }
      ];
    })
  ]);
}

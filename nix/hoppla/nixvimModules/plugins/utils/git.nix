# https://nix-community.github.io/nixvim/plugins/neogit
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
    enable = mkEnableOption "neogit";
  };

  config = mkIf cfg.self.enable {
    plugins = {
      neogit = {
        enable = true;
        autoRefresh = true;
        integrations.diffview = true;
      };

      fugitive.enable = true;

      diffview.enable = true;
    };

    keymaps = [
      {
        key = "${cfg.root.leaderPrefixes.git}g";
        action = ":Neogit<cr>";
        options = {
          silent = true;
          desc = "Open neogit";
        };
      }
      {
        key = "${cfg.root.leaderPrefixes.git}G";
        action = ":Git<cr>";
        options = {
          silent = true;
          desc = "Open fugitive";
        };
      }
    ];
  };
}

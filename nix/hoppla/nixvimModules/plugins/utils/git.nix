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
      };

      fugitive.enable = true;

      diffview.enable = true;
    };

    keymaps = [
      {
        key = "${cfg.root.leaderPrefixes.git}g";
        mode = "n";
        action = ":Neogit<cr>";
      }
    ];
  };
}

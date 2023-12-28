# https://nix-community.github.io/nixvim/plugins/todo-comments
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
    enable = mkEnableOption "todo-comments";
  };

  config = mkIf cfg.self.enable {
    plugins.todo-comments = {
      enable = true;
      keymaps.todoTelescope.key = "${cfg.root.leaderPrefixes.telescope}t";
    };
  };
}

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

  keyPrefix = "<leader>t";
in {
  options = {
    enable = mkEnableOption "todo-comments";
  };

  config = mkIf cfg.self.enable {
    plugins.todo-comments = {
      enable = true;
      keymaps.todoTelescope.key = "<leader>tt";
    };
  };
}

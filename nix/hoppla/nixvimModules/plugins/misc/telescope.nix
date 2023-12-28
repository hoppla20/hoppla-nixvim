# https://nix-community.github.io/nixvim/plugins/telescope
# https://github.com/nvim-telescope/telescope.nvim
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
    enable = mkEnableOption "telescope";
  };

  config = mkIf cfg.self.enable {
    plugins.telescope = {
      enable = true;

      keymapsSilent = true;
      keymaps = let
        actionWithDesc = action: {
          inherit action;
          desc = "Telescope ${action}";
        };
      in {
        "<C-p>" = actionWithDesc "git_files";
        "${cfg.root.leaderPrefixes.files}f" = "git_files";
        "<M-p>" = actionWithDesc "find_files";
        "${cfg.root.leaderPrefixes.files}F" = "find_files";

        "${cfg.root.leaderPrefixes.search}r" = actionWithDesc "live_grep";
        "${cfg.root.leaderPrefixes.buffers}f" = actionWithDesc "buffers";
        "${cfg.root.leaderPrefixes.files}o" = actionWithDesc "oldfiles";
        "${cfg.root.leaderPrefixes.git}b" = actionWithDesc "git_branches";

        "${cfg.root.leaderPrefixes.telescope}c" = actionWithDesc "commands";
        "${cfg.root.leaderPrefixes.telescope}m" = actionWithDesc "marks";
        "${cfg.root.leaderPrefixes.telescope}M" = actionWithDesc "man_pages";
        "${cfg.root.leaderPrefixes.telescope}o" = actionWithDesc "vim_options";
        "${cfg.root.leaderPrefixes.telescope}a" = actionWithDesc "autocommands";
        "${cfg.root.leaderPrefixes.telescope}f" = actionWithDesc "current_buffer_fuzzy_find";
        "${cfg.root.leaderPrefixes.telescope}r" = actionWithDesc "resume";
        "${cfg.root.leaderPrefixes.telescope}P" = actionWithDesc "pickers";
        "${cfg.root.leaderPrefixes.telescope}k" = actionWithDesc "keymaps";
      };
    };
  };
}

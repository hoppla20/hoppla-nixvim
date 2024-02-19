# https://nix-community.github.io/nixvim/plugins/telescope
# https://github.com/nvim-telescope/telescope.nvim
{nixvim}: {
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
in {
  options = {
    enable = mkEnableOption "telescope";
  };

  config = mkIf cfg.self.enable {
    plugins.telescope = {
      enable = true;

      extensions.fzf-native.enable = true;

      extraOptions = {
        pickers.buffers = {
          mappings = {
            n = {
              "<C-q>" = helpers.mkRaw "require('telescope.actions').delete_buffer";
            };
            i = {
              "<C-q>" = helpers.mkRaw "require('telescope.actions').delete_buffer";
            };
          };
        };
      };

      keymapsSilent = true;
      keymaps = let
        actionWithDesc = action: {
          inherit action;
          desc = "Telescope ${action}";
        };
      in {
        "<C-p>" = actionWithDesc "find_files";
        "${cfg.root.leaderPrefixes.files}f" = actionWithDesc "find_files";
        "<M-p>" = actionWithDesc "git_files";
        "${cfg.root.leaderPrefixes.files}F" = actionWithDesc "git_files";

        "${cfg.root.leaderPrefixes.search}r" = actionWithDesc "live_grep";
        "${cfg.root.leaderPrefixes.search}f" = actionWithDesc "current_buffer_fuzzy_find";
        "${cfg.root.leaderPrefixes.buffers}b" = actionWithDesc "buffers";
        "${cfg.root.leaderPrefixes.files}r" = actionWithDesc "oldfiles";
        "${cfg.root.leaderPrefixes.git}b" = actionWithDesc "git_branches";

        "${cfg.root.leaderPrefixes.telescope}c" = actionWithDesc "commands";
        "${cfg.root.leaderPrefixes.telescope}m" = actionWithDesc "marks";
        "${cfg.root.leaderPrefixes.telescope}M" = actionWithDesc "man_pages";
        "${cfg.root.leaderPrefixes.telescope}o" = actionWithDesc "vim_options";
        "${cfg.root.leaderPrefixes.telescope}T" = actionWithDesc "resume";
        "${cfg.root.leaderPrefixes.telescope}k" = actionWithDesc "keymaps";
        "${cfg.root.leaderPrefixes.telescope}h" = actionWithDesc "help_tags";
      };
    };
  };
}

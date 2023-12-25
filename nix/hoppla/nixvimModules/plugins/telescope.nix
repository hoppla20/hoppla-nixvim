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
        "<M-p>" = actionWithDesc "find_files";

        "<leader>sr" = actionWithDesc "live_grep";
        "<leader>bf" = actionWithDesc "buffers";
        "<leader>fo" = actionWithDesc "oldfiles";
        "<leader>gb" = actionWithDesc "git_branches";

        "<leader>tc" = actionWithDesc "commands";
        "<leader>tm" = actionWithDesc "marks";
        "<leader>tM" = actionWithDesc "man_pages";
        "<leader>to" = actionWithDesc "vim_options";
        "<leader>ta" = actionWithDesc "autocommands";
        "<leader>tf" = actionWithDesc "current_buffer_fuzzy_find";
        "<leader>tr" = actionWithDesc "resume";
        "<leader>tp" = actionWithDesc "pickers";
        "<leader>tk" = actionWithDesc "keymaps";
      };
    };
  };
}

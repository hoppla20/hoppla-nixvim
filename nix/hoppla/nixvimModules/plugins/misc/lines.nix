# https://nix-community.github.io/nixvim/plugins/bufferline
# https://nix-community.github.io/nixvim/plugins/lualine
{
  nixpkgs,
  nixvim,
}: {
  lib,
  config,
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
    enable = mkEnableOption "Lines";
  };

  config = mkIf cfg.self.enable {
    plugins = {
      lualine = {
        enable = true;
        theme = "catppuccin";
      };
    };

    extraPlugins = [nixpkgs.vimPlugins.tabby-nvim];
    extraConfigLua = let
      tabbySetupOptions = {
        lualine_theme = "catppuccin";
      };
    in ''
      require('tabby.tabline').use_preset('active_wins_at_tail', ${helpers.toLuaObject tabbySetupOptions})
    '';
  };
}

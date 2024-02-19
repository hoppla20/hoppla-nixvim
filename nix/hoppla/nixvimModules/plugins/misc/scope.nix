{
  nixpkgs,
  nixvim,
}: {
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
    mkMerge
    types
    ;
in {
  options = {
    enable = mkEnableOption "scope";

    package = helpers.mkPackageOption "scope-nvim" nixpkgs.vimPlugins.scope-nvim;
  };

  config = mkIf cfg.self.enable {
    extraPlugins = [cfg.self.package];

    extraConfigLua = ''
      require('scope').setup({})
    '';

    plugins.telescope.enabledExtensions = ["scope"];

    keymaps = [
      {
        key = "${cfg.root.leaderPrefixes.buffers}B";
        action = ":Telescope scope buffers<cr>";
        options.desc = "Open tab-local buffer";
      }
      {
        key = "${cfg.root.leaderPrefixes.buffers}m1";
        action = ":ScopeMoveBuf 1";
        options.desc = "Move current buffer to tab 1";
      }
      {
        key = "${cfg.root.leaderPrefixes.buffers}m2";
        action = ":ScopeMoveBuf 2";
        options.desc = "Move current buffer to tab 2";
      }
      {
        key = "${cfg.root.leaderPrefixes.buffers}m3";
        action = ":ScopeMoveBuf 3";
        options.desc = "Move current buffer to tab 3";
      }
      {
        key = "${cfg.root.leaderPrefixes.buffers}m4";
        action = ":ScopeMoveBuf 4";
        options.desc = "Move current buffer to tab 4";
      }
      {
        key = "${cfg.root.leaderPrefixes.buffers}m5";
        action = ":ScopeMoveBuf 5";
        options.desc = "Move current buffer to tab 5";
      }
      {
        key = "${cfg.root.leaderPrefixes.buffers}m6";
        action = ":ScopeMoveBuf 6";
        options.desc = "Move current buffer to tab 6";
      }
      {
        key = "${cfg.root.leaderPrefixes.buffers}m7";
        action = ":ScopeMoveBuf 7";
        options.desc = "Move current buffer to tab 7";
      }
      {
        key = "${cfg.root.leaderPrefixes.buffers}m8";
        action = ":ScopeMoveBuf 8";
        options.desc = "Move current buffer to tab 8";
      }
      {
        key = "${cfg.root.leaderPrefixes.buffers}m9";
        action = ":ScopeMoveBuf 9";
        options.desc = "Move current buffer to tab 9";
      }
    ];
  };
}

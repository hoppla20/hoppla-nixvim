{
  nixpkgs,
  nixvim,
}: {
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

  inherit (nixvim.lib) helpers;
in {
  options = {
    enable = mkEnableOption "zoxide";

    package = helpers.mkPackageOption "telescope-zoxide" nixpkgs.vimPlugins.telescope-zoxide;
  };

  config = mkIf cfg.self.enable {
    extraPlugins = [cfg.self.package];

    plugins.telescope.enabledExtensions = ["zoxide"];

    keymaps = [
      {
        key = cfg.root.leaderPrefixes.zoxide;
        action = ":Telescope zoxide list<cr>";
        options.desc = "Zoxide";
      }
    ];
  };
}

{
  nixpkgs,
  nixvim,
  cell,
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
    types
    ;
in {
  options = {
    enable = mkEnableOption "ranger-nvim";

    package = helpers.mkPackageOption "ranger-nvim" cell.pkgs.default.vimPlugins.ranger-nvim;
  };

  config = mkIf cfg.self.enable {
    extraPlugins = [cfg.self.package];

    extraConfigLua = let
      setupOptions = {
        enable_cmds = true;
        ui = {
          border = "rounded";
          height = 0.62;
          width = 0.62;
        };
      };
    in ''
      require('ranger-nvim').setup(${helpers.toLuaObject setupOptions})
    '';

    keymaps = [
      {
        key = "${cfg.root.leaderPrefixes.files}t";
        action = "<cmd>Ranger<cr>";
        options = {
          silent = true;
          desc = "Toggle ranger";
        };
      }
    ];
  };
}

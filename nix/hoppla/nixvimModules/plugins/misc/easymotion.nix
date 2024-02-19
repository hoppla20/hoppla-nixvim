{
  nixpkgs,
  nixvim,
}: {
  config,
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
    enable = mkEnableOption "vim-easymotion";

    package = helpers.mkPackageOption "vim-easymotion" nixpkgs.vimPlugins.vim-easymotion;
  };

  config = mkIf cfg.self.enable {
    extraPlugins = [cfg.self.package];

    globals.EasyMotion_smartcase = 1;

    keymaps = [
      {
        key = "s";
        action = "<Plug>(easymotion-overwin-f2)";
        options.silent = true;
      }
      {
        key = "<leader>j";
        action = "<Plug>(easymotion-j)";
        options.silent = true;
      }
      {
        key = "<leader>k";
        action = "<Plug>(easymotion-k)";
        options.silent = true;
      }
    ];
  };
}

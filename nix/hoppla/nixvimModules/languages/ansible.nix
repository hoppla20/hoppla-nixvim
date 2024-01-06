{nixpkgs}: {
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
    enable = mkEnableOption "ansible";
  };

  config = mkIf cfg.self.enable {
    hoppla.languages.yaml.enable = true;

    plugins.lsp.servers.ansiblels.enable = true;

    extraPlugins = [nixpkgs.vimPlugins.ansible-vim];
  };
}

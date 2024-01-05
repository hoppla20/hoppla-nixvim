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
    enable = mkEnableOption "dockerfile";
  };

  config = mkIf cfg.self.enable {
    plugins.lsp.servers.dockerls.enable = true;
  };
}

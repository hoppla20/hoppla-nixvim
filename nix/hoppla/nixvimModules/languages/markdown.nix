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
    enable = mkEnableOption "markdown";
  };

  config = mkIf cfg.self.enable {
    plugins.lsp.servers.marksman.enable = true;
  };
}

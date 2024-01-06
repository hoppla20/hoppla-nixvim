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
    enable = mkEnableOption "yaml";
  };

  config = mkIf cfg.self.enable {
    plugins.lsp.servers.yamlls.enable = true;
  };
}

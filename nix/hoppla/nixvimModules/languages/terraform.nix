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
    enable = mkEnableOption "terraform";
  };

  config = mkIf cfg.self.enable {
    plugins.lsp.servers.terraformls.enable = true;
  };
}

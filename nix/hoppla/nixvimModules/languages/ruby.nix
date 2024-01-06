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
    enable = mkEnableOption "ruby";
  };

  config = mkIf cfg.self.enable {
    plugins.lsp.servers.solargraph.enable = true;
  };
}

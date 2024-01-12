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
    enable = mkEnableOption "nix";
  };

  config = mkIf cfg.self.enable {
    plugins.lsp.servers.pylsp.enable = true;
  };
}

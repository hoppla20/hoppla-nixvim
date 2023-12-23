_: {
  lib,
  cfg,
  ...
}: {
  options = {
    enable = lib.mkEnableOption "nix";
  };

  config = lib.mkIf cfg.self.enable {
    plugins.nix.enable = true;
  };
}

# https://nix-community.github.io/nixvim/plugins/nix
_: {
  lib,
  cfg,
  ...
}: {
  options = {
    enable = lib.mkEnableOption "nix";
  };

  config = lib.mkIf cfg.self.enable {
    plugins = {
      nix.enable = true;

      lsp.servers.nil_ls = {
        enable = true;
        settings = {
          diagnostics.ignored = ["unused_binding"];
          formatting.command = ["alejandra"];
        };
      };
    };
  };
}

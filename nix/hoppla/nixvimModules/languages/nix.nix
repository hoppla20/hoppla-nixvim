# https://nix-community.github.io/nixvim/plugins/nix
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

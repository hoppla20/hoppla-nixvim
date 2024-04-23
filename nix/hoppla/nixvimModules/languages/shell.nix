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
    enable = mkEnableOption "bash";
  };

  config = {
    plugins = {
      lsp.servers.bashls.enable = true;

      none-ls.sources = {
        formatting.shfmt.enable = true;
      };
    };
  };
}

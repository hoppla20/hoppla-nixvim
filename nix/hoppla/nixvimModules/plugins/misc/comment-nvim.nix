_: {
  config,
  lib,
  cfg,
  ...
}: let
  inherit
    (lib)
    mkOption
    mkEnableOption
    mkIf
    mkMerge
    types
    ;
in {
  options = {
    enable = mkEnableOption "comment-nvim";
  };

  config = mkIf cfg.self.enable (mkMerge [
    {
      plugins.comment-nvim = {
        enable = true;
      };
    }

    (mkIf config.plugins.ts-context-commentstring.enable {
      plugins = {
        comment-nvim.preHook = "require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()";
        ts-context-commentstring.extraOptions = {
          enable_autocmd = false;
        };
      };
    })
  ]);
}

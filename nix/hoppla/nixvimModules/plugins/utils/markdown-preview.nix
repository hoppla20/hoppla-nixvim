# https://nix-community.github.io/nixvim/plugins/markdown-preview
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
    enable = mkEnableOption "markdown-preview";
  };

  config = mkIf cfg.self.enable {
    extraConfigVim = ''
      function OpenMarkdownPreview (url)
        execute "silent ! xdg-open " . a:url
      endfunction
    '';

    plugins.markdown-preview = {
      enable = true;
      refreshSlow = true;
      browserFunc = "OpenMarkdownPreview";
    };
  };
}

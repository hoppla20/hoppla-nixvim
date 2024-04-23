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
    enable = mkEnableOption "obsidian";
  };

  config = let
    rootDir = "~/Obsidian/";
    workspace = name: {
      inherit name;
      path = "${rootDir}/${name}";
    };
    defaultWorkspace = "Personal";
  in
    mkIf cfg.self.enable {
      plugins.obsidian = {
        enable = true;

        settings = {
          workspaces = [
            (workspace defaultWorkspace)
          ];
          follow_url_func = ''
            function(url)
              vim.fn.jobstart({"xdg-open", url})
            end
          '';
          daily_notes.folder = "Journals";
        };
      };
    };
}

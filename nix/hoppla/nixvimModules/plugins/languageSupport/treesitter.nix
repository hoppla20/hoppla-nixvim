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
    enable = mkEnableOption "treesitter";
  };

  config = mkIf cfg.self.enable {
    plugins = {
      treesitter = {
        enable = true;
        indent = true;
        folding = true;
        nixGrammars = true;
        ensureInstalled = "all";

        incrementalSelection = {
          enable = true;
          keymaps = {
            initSelection = "<CR>";
            scopeIncremental = "<CR>";
            nodeIncremental = "<TAB>";
            nodeDecremental = "<S-TAB>";
          };
        };
      };

      treesitter-context = {
        enable = true;
        maxLines = 5;
        minWindowHeight = 20;
      };

      treesitter-refactor = {
        enable = true;
        highlightCurrentScope.enable = true;
        smartRename = {
          enable = true;
          keymaps.smartRename = "grr";
        };
      };
    };
  };
}

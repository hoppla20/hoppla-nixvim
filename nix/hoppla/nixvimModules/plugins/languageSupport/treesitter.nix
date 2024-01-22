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
            scopeIncremental = "<TAB>";
            nodeIncremental = "<CR>";
            nodeDecremental = "<S-CR>";
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
        smartRename = {
          enable = true;
          keymaps.smartRename = "grr";
        };
      };

      ts-context-commentstring.enable = true;
    };
  };
}

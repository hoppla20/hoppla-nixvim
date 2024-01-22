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
    enable = mkEnableOption "noice";
  };

  config = mkIf cfg.self.enable {
    plugins.noice = {
      enable = true;

      popupmenu.backend = "cmp";

      lsp.override = {
        "vim.lsp.util.convert_input_to_markdown_lines" = true;
        "vim.lsp.util.stylize_markdown" = true;
        "cmp.entry.get_documentation" = true;
      };

      presets = {
        command_palette = true;
        long_message_to_split = true;
        lsp_doc_border = true;
      };
    };

    keymaps = let
      prefix = cfg.root.leaderPrefixes.messages;
      noiceMap = key: action: {
        key = "${prefix}${key}";
        action = ":Noice ${action}<cr>";
        options.desc = "Noice ${action}";
      };
    in [
      (noiceMap "h" "history")
      (noiceMap "t" "telescope")
      (noiceMap "e" "errors")
      (noiceMap "d" "dismiss")
      (noiceMap "l" "last")
    ];
  };
}

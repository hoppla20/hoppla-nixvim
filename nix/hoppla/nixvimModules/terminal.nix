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
  autoCmd = [
    {
      event = ["TermOpen"];
      pattern = ["*"];
      command = "setlocal nonumber norelativenumber";
    }
  ];

  keymaps = [
    {
      mode = ["t"];
      key = "<esc>";
      action = "<C-\\><C-n>";
    }
  ];
}

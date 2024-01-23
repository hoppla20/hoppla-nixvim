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

  prefixDefaults = {
    search = "s";
    terminal = "t";
    telescope = "T";
    files = "f";
    buffers = "b";
    git = "g";
    lsp = "l";
    # neorg = "n";
    images = "i";
    messages = "m";
    zoxide = "z";
  };

  leaderPrefixOption = desc: key:
    lib.nameValuePair desc (mkOption {
      type = types.str;
      default = "<leader>${key}";
    });

  leaderKeymap = desc: key: lib.nameValuePair "<leader>${key}" desc;
in {
  options = lib.mapAttrs' leaderPrefixOption prefixDefaults;

  config = {
    plugins.which-key.registrations = lib.mapAttrs' (desc: key: lib.nameValuePair key desc) cfg.self;
  };
}

{
  nixpkgs,
  nixvim,
}: {
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

  inherit (nixvim.lib) helpers;

  localLeaderKeymap = desc: key: lib.nameValuePair "<localleader>${key}" desc;

  localLeaderPrefixes = {
    "insert" = "i";
    "lists" = "l";
    "mode" = "m";
    "notes" = "n";
    "todos" = "t";
  };
in {
  options = {
    enable = mkEnableOption "neorg";
  };

  config = mkIf cfg.self.enable {
    extraPlugins = [nixpkgs.vimPlugins.neorg-telescope];

    plugins = {
      neorg = {
        enable = true;
        modules = {
          "core.defaults" = helpers.emptyTable;
          "core.concealer" = helpers.emptyTable;
          "core.dirman" = {
            config = {
              index = "index.norg";
              workspaces = {
                notes = "~/Workspace/neorg/notes";
              };
              default_workspace = "notes";
            };
          };
          "core.completion" = {
            config.engine = "nvim-cmp";
          };
          "core.integrations.telescope" = helpers.emptyTable;
          "core.keybinds" = {
            config.hook = helpers.mkRaw ''
              function(keybinds)
                keybinds.map_event_to_mode("norg", {
                  n = {
                    { "<C-s>", "core.integrations.telescope.find_linkable" },
                  },
                  i = {
                    { "<C-l>", "core.integrations.telescope.insert_link" },
                  },
                }, {
                  silent = true,
                  noremap = true,
                })
              end
            '';
          };
        };
      };

      which-key.registrations = lib.mapAttrs' localLeaderKeymap localLeaderPrefixes;
    };
  };
}

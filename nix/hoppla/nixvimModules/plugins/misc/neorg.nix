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
    "looking glass" = "L";
    "mode" = "m";
    "notes" = "n";
    "summary" = "s";
    "todos" = "t";
    "toc" = "T";
    "update" = "u";
    "return" = "q";
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
                notes = "~/Sync/default/neorg/notes";
              };
              default_workspace = "notes";
            };
          };
          "core.completion" = {
            config.engine = "nvim-cmp";
          };
          "core.integrations.telescope" = helpers.emptyTable;
          "core.export" = helpers.emptyTable;
          "core.export.markdown" = helpers.emptyTable;
          "core.summary" = {
            config.strategy = "by_path";
          };
          "core.ui.calendar" = helpers.emptyTable;
          "core.keybinds" = {
            config.hook = helpers.mkRaw ''
              function(keybinds)
                local leader = keybinds.leader

                keybinds.map_event_to_mode("norg", {
                  n = {
                    { "<C-s>", "core.integrations.telescope.find_linkable" },
                    { leader .. "L", "core.looking-glass.magnify-code-block" }
                  },
                  i = {
                    { "<C-l>", "core.integrations.telescope.insert_link" },
                  },
                }, {
                  silent = true,
                  noremap = true,
                })

                keybinds.map_to_mode("all", {
                  n = {
                    { leader .. "q", ":Neorg return<cr>" },
                    { leader .. "T", ":Neorg toc<cr>" },
                    { leader .. "im", ":Neorg inject-metadata<cr>" },
                    { leader .. "um", ":Neorg update-metadata<cr>" },
                    { leader .. "sg", ":Neorg generate-workspace-summary<cr>" },
                  },
                })
              end
            '';
          };
        };
      };

      which-key.registrations = lib.mapAttrs' localLeaderKeymap localLeaderPrefixes;
    };

    keymaps = let
      leader = cfg.root.leaderPrefixes.neorg;
    in [
      {
        key = "${leader}i";
        action = ":Neorg index<cr>";
        options.desc = "Neorg index";
      }
      {
        key = "${cfg.root.leaderPrefixes.neorg}w";
        action = ":Neorg workspace ";
        options.desc = "Neorg workspace";
      }
    ];
  };
}

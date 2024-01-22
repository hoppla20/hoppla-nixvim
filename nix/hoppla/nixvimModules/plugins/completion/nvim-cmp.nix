# https://nix-community.github.io/nixvim/plugins/nvim-cmp
# https://github.com/hrsh7th/nvim-cmp
{
  nixpkgs,
  nixvim,
}: {
  options,
  lib,
  cfg,
  ...
}: let
  inherit
    (lib)
    mkOption
    mkEnableOption
    mkIf
    mkOrder
    types
    ;

  inherit (nixvim.lib) helpers;
in {
  options = {
    enable = mkEnableOption "nvim-cmp";
  };

  config = mkIf cfg.self.enable {
    plugins = {
      luasnip.enable = true;

      nvim-cmp = {
        enable = true;
        completion.keywordLength = 3;
        mappingPresets = [];
        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-j>" = "cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select })";
          "<C-k>" = "cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select })";
          "<C-n>" = "cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select })";
          "<C-e>" = "cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select })";
          "<C-h>" = "cmp.mapping.scroll_docs(-4)";
          "<C-l>" = "cmp.mapping.scroll_docs(4)";
          "<C-p>" = "cmp.mapping.scroll_docs(-4)";
          "<C-a>" = "cmp.mapping.scroll_docs(4)";
          "<C-g>" = "cmp.mapping.abort()";
          "<CR>" = "cmp.mapping.confirm()";
        };
        snippet.expand = "luasnip";
        sources = mkOrder 1000 [
          {
            name = "async_path";
            option.trailing_slash = true;
          }
          {name = "nvim_lsp";}
          {name = "luasnip";}
          {name = "buffer";}
        ];
        window = {
          completion = {
            border = "rounded";
          };
        };
      };
    };

    extraPlugins = builtins.attrValues {
      inherit
        (nixpkgs.vimPlugins)
        cmp-async-path
        cmp-cmdline
        cmp-conventionalcommits
        cmp-git
        ;
    };

    extraConfigLuaPost = helpers.wrapDo ''
      local cmp = require('cmp')

      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'git' },
          { name = 'conventionalcommits' }
        }, {
          { name = 'buffer' },
        })
      })

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        completion = {
          keyword_length = 1,
        },
        sources = cmp.config.sources({
          { name = 'buffer' }
        })
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        completion = {
          keyword_length = 1,
        },
        sources = cmp.config.sources({
          {
            name = 'async_path',
            option = {
              trailing_slash = false,
            },
          },
        }, {
          { name = 'cmdline' },
        })
      })
    '';
  };
}

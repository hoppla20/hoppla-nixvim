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

  inherit
    (nixvim.lib)
    helpers
    ;
in {
  options = {
    enable = mkEnableOption "nvim-cmp";
  };

  config = mkIf cfg.self.enable {
    plugins = {
      luasnip.enable = true;

      nvim-cmp = {
        enable = true;
        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-n>" = "cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select })";
          "<C-p>" = "cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select })";
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-g>" = "cmp.mapping.abort()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
        };
        snippet.expand = "luasnip";
        sources = mkOrder 1000 [
          {name = "nvim_lsp";}
          {name = "luasnip";}
          {name = "buffer";}
          {
            name = "async_path";
            option.trailing_slash = true;
          }
          {name = "conventionalcommits";}
        ];
      };
    };

    extraPlugins = [nixpkgs.vimPlugins.cmp-async-path];
  };
}

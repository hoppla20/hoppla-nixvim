{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
in rec {
  default = nixpkgs-with-neovim-nightly;

  nixpkgs-with-neovim-nightly = import inputs.nixpkgs {
    inherit (inputs.nixpkgs) system;
    overlays = [
      inputs.neovim-nightly-overlay.overlays.default
      inputs.neorg-overlay.overlays.default
      (self: super: {
        vimPlugins =
          super.vimPlugins
          // {
            anki-nvim = nixpkgs.vimUtils.buildVimPlugin {
              name = "anki-nvim";
              preInstall = ''
                rm -rf doc
              '';
              src = inputs.anki-nvim;
            };

            kitty-runner-nvim = nixpkgs.vimUtils.buildVimPlugin {
              name = "kitty-runner-nvim";
              src = inputs.kitty-runner-nvim;
            };

            ranger-nvim = nixpkgs.vimUtils.buildVimPlugin {
              name = "ranger-nvim";
              src = inputs.ranger-nvim;
            };
          };
      })
    ];
  };
}

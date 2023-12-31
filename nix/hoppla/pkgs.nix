{
  inputs,
  cell,
}: rec {
  default = nixpkgs-with-neovim-nightly;

  nixpkgs-with-neovim-nightly = import inputs.nixpkgs {
    inherit (inputs.nixpkgs) system;
    overlays = [
      inputs.neovim-nightly-overlay.overlays.default
      inputs.neorg-overlay.overlays.default
    ];
  };
}

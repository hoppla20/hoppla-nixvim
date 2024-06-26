{
  description = "Hoppla Nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    neorg-overlay.url = "github:nvim-neorg/nixpkgs-neorg-overlay";

    nixago = {
      url = "github:nix-community/nixago";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    std = {
      url = "github:divnix/std/v0.31.0";
      inputs = {
        # nixpkgs.follows = "nixpkgs";
        nixago.follows = "nixago";
        devshell.follows = "devshell";
      };
    };
    haumea.follows = "std/haumea";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    anki-nvim = {
      url = "github:rareitems/anki.nvim";
      flake = false;
    };

    kitty-runner-nvim = {
      url = "github:jghauser/kitty-runner.nvim";
      flake = false;
    };

    ranger-nvim = {
      url = "github:kelly-lin/ranger.nvim";
      flake = false;
    };
  };

  outputs = inputs @ {std, ...}:
    std.growOn {
      inherit inputs;
      cellsFrom = ./nix;
      cellBlocks = with std.blockTypes; [
        (nixago "configs")
        (devshells "shells")

        (pkgs "pkgs")
        (functions "lib")
        (runnables "packages")
        (functions "nixvimModules")
        (functions "nixvimConfigurations")
      ];
    }
    {
      devShells = std.harvest inputs.self ["repo" "shells"];
      packages = std.harvest inputs.self ["hoppla" "packages"];
    };
}

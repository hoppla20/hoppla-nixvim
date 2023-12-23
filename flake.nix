{
  description = "Hoppla Nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

    nixago = {
      url = "github:nix-community/nixago";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    std = {
      url = "github:divnix/std/v0.24.0-1";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        nixago.follows = "nixago";
        devshell.follows = "devshell";
      };
    };
    haumea.follows = "std/haumea";

    nixvim = {
      url = "github:nix-community/nixvim/nixos-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {std, ...}:
    std.growOn {
      inherit inputs;
      cellsFrom = ./nix;
      cellBlocks = with std.blockTypes; [
        (nixago "configs")
        (devshells "shells")

        (installables "packages")
        (functions "nixvimModules")
      ];
    }
    {
      devShells = std.harvest inputs.self ["repo" "shells"];
      packages = std.harvest inputs.self ["hoppla" "packages"];
    };
}

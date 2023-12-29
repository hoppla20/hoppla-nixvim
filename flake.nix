{
  description = "Hoppla Nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixago = {
      url = "github:nix-community/nixago";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    std = {
      url = "github:divnix/std";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        nixago.follows = "nixago";
        devshell.follows = "devshell";
      };
    };
    haumea.follows = "std/haumea";

    # TODO wait for https://github.com/nix-community/nixvim/pull/849
    #nixvim = {
    #  url = "github:nix-community/nixvim";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
    nixvim = {
      url = "/home/vincentcui/Workspace/neovim/nixvim";
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

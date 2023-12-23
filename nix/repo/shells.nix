{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
  inherit (nixpkgs) lib;
  stdLib = inputs.std.lib;
in {
  default = stdLib.dev.mkShell {
    name = "repo";

    nixago = [
      cell.configs.conform
      cell.configs.treefmt
      cell.configs.editorconfig
      cell.configs.lefthook
    ];

    commands = [
      {
        category = "std";
        package = inputs.std.std.cli.default;
      }
      {
        category = "tools";
        package = nixpkgs.alejandra;
      }
      {
        category = "tools";
        package = nixpkgs.statix;
      }
    ];
  };
}

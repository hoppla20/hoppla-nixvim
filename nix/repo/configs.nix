{
  inputs,
  cell,
}: let
  inherit (inputs.nixpkgs) lib;
  stdLib = inputs.std.lib;
in
  lib.mapAttrs (_: inputs.std.lib.dev.mkNixago) {
    # Tool Homepage: https://editorconfig.org/
    editorconfig =
      stdLib.cfg.editorconfig
      // {
        data = {
          root = true;

          "*" = {
            end_of_line = "lf";
            insert_final_newline = true;
            trim_trailing_whitespace = true;
            charset = "utf-8";
            indent_style = "space";
            indent_size = 2;
          };

          "*.{diff,patch}" = {
            end_of_line = "unset";
            insert_final_newline = "unset";
            trim_trailing_whitespace = "unset";
            indent_size = "unset";
          };

          #"*.md" = {
          #  max_line_length = "off";
          #  trim_trailing_whitespace = false;
          #};

          "{LICENSES/**,LICENSE}" = {
            end_of_line = "unset";
            insert_final_newline = "unset";
            trim_trailing_whitespace = "unset";
            charset = "unset";
            indent_style = "unset";
            indent_size = "unset";
          };
        };
      };

    # Tool Homepage: https://numtide.github.io/treefmt/
    treefmt =
      stdLib.cfg.treefmt
      // {
        packages = [
          inputs.nixpkgs.alejandra
          inputs.nixpkgs.shfmt
        ];
        data = {
          formatter = {
            nix = {
              command = "alejandra";
              includes = ["*.nix"];
            };
            shell = {
              command = "shfmt";
              options = ["-i" "2" "-s" "-w"];
              includes = ["*.sh"];
            };
          };
        };
      };

    # Tool  Homepage: https://github.com/siderolabs/conform
    # Std Doc: https://std.divnix.com/reference/lib.html#targets-conform
    # Conventional Commits: https://www.conventionalcommits.org/en/v1.0.0/
    conform =
      stdLib.cfg.conform
      // {
        data = {
          inherit (inputs) cells;
          commit = {
            header = {
              length = 89;
              imperative = false;
              case = "lower";
              invalidLastCharacters = ".";
            };
            body = {
              required = false;
            };
            conventional = {
              scopes = [];
              types = ["fix" "feat" "chore" "ci" "docs" "style" "refactor" "test" "revert"];
              descriptionLength = 72;
            };
          };
          # license = {};
        };
      };

    # Tool Homepage: https://github.com/evilmartians/lefthook
    lefthook =
      stdLib.cfg.lefthook
      // {
        data = {
          commit-msg = {
            commands = {
              conform = {
                # allow WIP, fixup!/squash! commits locally
                run = ''
                  [[ "$(head -n 1 {1})" =~ ^WIP(:.*)?$|^wip(:.*)?$|fixup\!.*|squash\!.* ]] ||
                  conform enforce --commit-msg-file {1}'';
                skip = ["merge" "rebase"];
              };
            };
          };
          pre-commit = {
            commands = {
              statix = {
                run = "statix fix";
              };
              treefmt = {
                run = "treefmt --fail-on-change {staged_files}";
              };
            };
          };
        };
      };
  }

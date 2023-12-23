{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
  inherit (nixpkgs) lib;
in rec {
  passInputsToFunctionArgs = functionInputs: function:
    lib.pipe function [
      lib.functionArgs
      (lib.mapAttrs (name: _: functionInputs.${name}))
      function
    ];

  attrValuesRecursive = attrs:
    lib.flatten (map
      (v:
        if builtins.isAttrs v
        then attrValuesRecursive v
        else v)
      (lib.attrValues attrs));
}

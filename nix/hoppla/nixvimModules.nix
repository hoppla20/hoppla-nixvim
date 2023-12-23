{
  inputs,
  cell,
}:
inputs.haumea.lib.load {
  src = ./nixvimModules;
  inputs = removeAttrs inputs ["self"] // {inherit cell;};
}

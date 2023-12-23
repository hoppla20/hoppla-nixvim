{
  inputs,
  cell,
}:
inputs.haumea.lib.load {
  src = ./nixvimConfigurations;
  inputs = removeAttrs inputs ["self"] // {inherit cell;};
}

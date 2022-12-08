{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs std self;
  inherit (inputs.cells-lab.common.lib) callFlake;
  l = nixpkgs.lib // builtins;

  __inputs__ = callFlake "${(std.incl self ["lock"])}/lock" {
    nixpkgs.locked = inputs.nixpkgs.sourceInfo;
  };
in {
  inherit __inputs__ l;
}

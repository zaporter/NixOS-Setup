nix-shell -p '
let
  pkgs = import <nixpkgs> {};
in
pkgs.callPackage ./default.nix {}
'

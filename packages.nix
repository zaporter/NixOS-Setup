{ pkgs, lib, ...}:

{
  home.extraOutputsToInstall = [ "doc" "info" "man" "devdoc" ];
  imports = [
    ./alacritty/config.nix
  ];

}

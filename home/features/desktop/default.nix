{pkgs, lib, ...}:{
  home.extraOutputsToInstall = [ "doc" "info" "man" "devdoc" ];
  imports = [
    ./sway
    ./alacritty
    ./i3status
    ./rofi
    ./xkb
  ];
  home.packages = with pkgs; [
    wdisplays
    firefox
    bitwarden
    wev
    acpi # to read battery
    pulseaudio
    playerctl
    shutter # screenshots
  ];
}

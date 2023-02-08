{ pkgs, lib, ...}:

{
  home.extraOutputsToInstall = [ "doc" "info" "man" "devdoc" ];
  imports = [
    ./rofi/config.nix
    ./zsh/config.nix
    ./alacritty/config.nix
    ./sway/config.nix
    ./nvim/config.nix
    ./i3status/config.nix
    ./xkb/config.nix
    ./moonlander/config.nix
  ];

  home.packages = with pkgs; [ 
    # core
    firefox
    openvpn
    bitwarden
    # utils
    wev
    # system
    acpi # to read battery %
    pythonFull 
    pulseaudio # pulse ctl
    playerctl
    # graphics
    zip
    
    unzip
    gnumake
    less
    jq
    fd # alternative to find
    exa # alternative to ls

    calc
    alacritty
    signal-desktop
 #   gdk-pixbuf
   # git
    git-crypt
    gnupg
  ];
}

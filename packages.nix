{ pkgs, lib, ...}:

{
  home.extraOutputsToInstall = [ "doc" "info" "man" "devdoc" ];
  imports = [
    ./alacritty/config.nix
    ./sway/config.nix
  ];

  home.packages = with pkgs; [ 
    # core
    firefox
    # utils
    wev
    # system
    acpi # to read battery %
    pythonFull 
    pulseaudio # pulse ctl
    # graphics
    i3status
    zip
    
    unzip
    gnumake
    less
    jq
    fd # alternative to find
    exa # alternative to ls

    pithos
    calc
    alacritty
    signal-desktop
 #   gdk-pixbuf
   # git
    git-crypt
    gnupg
  ];
}

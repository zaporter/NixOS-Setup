{config, pkgs, inputs,...}:

{
  imports = [
    ./nvim
    ./zsh
    ./ssh
  ];
  home.packages = with pkgs; [
    nix-index
    # core
    lshw
    zip
    unzip
    htop
    git
    git-crypt
    gnupg
    jq
    fd
    exa
    calc
    gnumake
    less
    tree
    # devel
    gitui
    
  ];


  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "zack";
  home.homeDirectory = "/home/zack";

  home.stateVersion = "22.11";
  programs.home-manager.enable = true;
}

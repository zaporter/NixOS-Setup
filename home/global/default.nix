{config, pkgs, inputs,...}:

{
  imports = [
    ./nvim
    ./zsh
  ];
  home.packages = with pkgs; [
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
    
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "zack";
  home.homeDirectory = "/home/zack";
  programs.git = {
    enable = true;      
    # Additional options for the git program
    #package = pkgs.gitAndTools.gitFull; # Install git wiith all the optional extras
    userName = "zaporter";
    userEmail = "opensource@zackporter.com";
    extraConfig = {
      # Use vim as our default git editor
      core.editor = "nvim";
      # Cache git credentials for 15 minutes
      credential.helper = "cache";
    };
  };

  home.stateVersion = "22.11";
  programs.home-manager.enable = true;
}

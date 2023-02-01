{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "zack";
  home.homeDirectory = "/home/zack";
  home.packages = with pkgs; [ 
 #   pithos
    alacritty
    signal-desktop
    gdk-pixbuf
   # git
    git-crypt
    gnupg
  ];
  programs.git = {
    enable = true;      
    # Additional options for the git program
    package = pkgs.gitAndTools.gitFull; # Install git wiith all the optional extras
    userName = "zaporter";
    userEmail = "opensource@zackporter.com";
    extraConfig = {
      # Use vim as our default git editor
      core.editor = "nvim";
      # Cache git credentials for 15 minutes
      credential.helper = "cache";
    };
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;
 #   defaultEditor = true;
  };
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

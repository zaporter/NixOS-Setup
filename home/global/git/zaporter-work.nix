{config, pkgs, inputs,...}:

{
  programs.git = {
    enable = true;      
    # Additional options for the git program
    #package = pkgs.gitAndTools.gitFull; # Install git with all the optional extras
    userName = "zaporter-work";
    userEmail = "work-github@zackporter.com";
    extraConfig = {
      # Use vim as our default git editor
      core.editor = "nvim";
      # Cache git credentials for 15 minutes
      credential.helper = "cache";
    };
  };

}

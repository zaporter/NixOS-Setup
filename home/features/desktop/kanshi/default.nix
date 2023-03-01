# outputs can be seen with swaymsg -t get_outputs
# https://manpages.ubuntu.com/manpages/focal/en/man5/kanshi.5.html
{pkgs, lib, config,  ...}:

  with lib; let 
    cfg = config.zp;
  in  
{
    home.packages = [
        pkgs.kanshi
    ];
    services.kanshi = {
        enable = true;
    };
    xdg.configFile.kanshi = {
        source = ./config;
        recursive = true;
    };
}

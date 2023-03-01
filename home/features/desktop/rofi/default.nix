{pkgs, lib, config,  ...}:

  with lib; let 
    cfg = config.zp;
  in  
{
  home.packages = (
    if (cfg.wayland.enable)
        then [pkgs.rofi-wayland] else [pkgs.rofi]
  );
  xdg.configFile.rofi = {
      source = ./config;
      recursive = true;
  };
}

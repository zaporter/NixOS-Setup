{config,pkgs, lib, types,  
...}:

  with lib; let 
    cfg = config.zp;
  in  
  {
  options = {
    zp.stress.enable = pkgs.lib.mkOption {
        description = "enable stress";
        type = with pkgs.lib.types; bool;
        default = false;
    };
    zp.wayland.enable = pkgs.lib.mkOption {
        description = "enable stress";
        type = with pkgs.lib.types; bool;
        default = false;
    };
  };
  imports = [
    ./sway
    ./alacritty
    ./i3status
    ./rofi
    ./xkb
  ];
  config = {
  home.extraOutputsToInstall = [ "doc" "info" "man" "devdoc" ];
  home.packages = with pkgs; [
    wdisplays
    firefox
    bitwarden
    wev
    acpi # to read battery
    pulseaudio
    playerctl
    shutter # screenshots
  ] ++ (
    if (cfg.stress.enable)
        then [stress] else []
  )
;
 # features.desktop.pavucontrol = lib.mkOption {
 #   type = lib.types.bool;
 #   description = "enable pavucontrol";
 # };
  };
}

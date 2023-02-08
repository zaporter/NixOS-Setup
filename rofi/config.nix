{pkgs, ...}:

{
  home.packages = [
    pkgs.rofi
  ];
  #xdg.configFile."alacritty/alacritty.yml".text = ''
  #  ${builtins.readFile ./alacritty.yml}
  #'';
}

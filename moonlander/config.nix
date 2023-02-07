{pkgs, ...}:

{
  home.packages = [
    pkgs.wally-cli
  ];
  #xdg.configFile."alacritty/alacritty.yml".text = ''
  #  ${builtins.readFile ./alacritty.yml}
  #'';
}

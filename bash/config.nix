{pkgs, ...}:

{
  home.packages = [
    pkgs.alacritty
  ];
  xdg.home.".bash_profile".text = ''
  zsh
  '';
}

{pkgs, ...}:

{
  home.packages = [
    pkgs.alacritty
  ];
  home.file.".bash_profile".text = ''
  source ~/.bashrc
  '';
  home.file.".bashrc".text = ''
  #export SHELL=`/usr/bin/env zsh`
  #[ -z "$ZSH_VERSION" ] && exec "$SHELL" -l 
  '';
}

{pkgs, ...}:

{
  home.packages = [
    pkgs.xorg.xmodmap
  ];
  xdg.configFile."i3/config".text = ''
    ${builtins.readFile ./i3.conf}
  '';
}

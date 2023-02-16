{pkgs, ...}:

{
  home.packages = [
    pkgs.xorg.xmodmap
    # for copy and paste
    pkgs.xclip
  ];
  xdg.configFile."i3/config".text = ''
    ${builtins.readFile ./i3.conf}
  '';
}

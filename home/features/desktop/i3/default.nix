{pkgs, ...}:

{
  xdg.configFile."i3/config".text = ''
    ${builtins.readFile ./i3.conf}
  '';
}

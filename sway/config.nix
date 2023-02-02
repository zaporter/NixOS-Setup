{pkgs, ...}:

{
  xdg.configFile."sway/config".text = ''
    ${builtins.readFile ./sway.conf}
  '';
}

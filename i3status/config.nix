{pkgs, ...}:

{
  home.packages = with pkgs; [
    i3status
  ];
  xdg.configFile."i3status/config".text = ''
    ${builtins.readFile ./i3status.conf}
  '';
}

{pkgs, ...}:

{
  home.packages = [
    pkgs.xorg.xkbcomp
  ];
  xdg.configFile."xkb/zord-qwerty".text = ''
    ${builtins.readFile ./zord-querty.conf}
  '';
}

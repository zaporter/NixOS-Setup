{pkgs, ...}:

{
  xdg.configFile."xkb/zord-qwerty".text = ''
    ${builtins.readFile ./zord-querty.conf}
  '';
}

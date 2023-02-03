{pkgs, ...}:

{
  home.packages = [
    #nvim is installed by configuration.nix
  ];
  xdg.configFile."nvim/init.lua".text = ''
    ${builtins.readFile ./init.lua}
  '';
}

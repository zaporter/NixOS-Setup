{config, pkgs, ...}:
{
xdg.configFile."zsh/env".text = ''
  ${builtins.readFile ./env}
'';
programs.zsh = {
  enable = true;
  shellAliases = {
  #  ll = "ls -l";
  #  update = "sudo nixos-rebuild switch";
    xkeymap = "~/setup/scripts/Xkeymap.sh";
    c = "cd";
    ls = "exa";
    update-home = "~/setup/scripts/Switch-home";
    update-nixos = "~/setup/scripts/Switch-nixos";
    replacebinbash = "~/setup/scripts/ReplaceBinBash.sh";
  };
  history = {
    size = 10000;
    path = "${config.xdg.dataHome}/zsh/history";
  };
  oh-my-zsh = {
    enable = true;
    plugins = [ "git" "z" "docker" ];
    theme = "robbyrussell";
  };
};
}


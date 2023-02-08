{config, pkgs, ...}:
{
programs.zsh = {
  enable = true;
  shellAliases = {
  #  ll = "ls -l";
  #  update = "sudo nixos-rebuild switch";
    ls = "exa";
    update-home = "~/setup/scripts/Switch-home";
    update-nixos = "~/setup/scripts/Switch-nixos";
  };
  history = {
    size = 10000;
    path = "${config.xdg.dataHome}/zsh/history";
  };
  oh-my-zsh = {
    enable = true;
    plugins = [ "git" "z" ];
    theme = "robbyrussell";
  };
};
}


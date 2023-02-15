{pkgs, config, lib, outputs, ...}:
let ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in 
{
  users.mutableUsers = true;
  users.users.zack = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "video"
      "audio"
    ] ++ ifTheyExist [
      "clamav"
      "network"
      "networkmanager"
      "libvirtd"
      "vboxusers"
      "i2c"
      "docker"
      "git"
    ];
    packages = [ pkgs.home-manager ];
  };
  #home-manager.users.zack = import home/${config.networking.hostName}.nix;
}

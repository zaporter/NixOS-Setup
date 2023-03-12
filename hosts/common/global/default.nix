{lib, config, pkgs, inputs, outputs, ...}:
{
  imports = [
    ./locale.nix
    ./nix.nix

  ] ++(builtins.attrValues outputs.nixosModules);

  programs.zsh.enable = true;

  # local device discovery
  services.avahi = {
    enable = true;
    publish = {
        enable = true;
        addresses = true;
        workstation = true;
    };
    nssmdns = true;
  };

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable Polkit for system-wide privileges
  security.polkit.enable = true;

  programs.ssh.startAgent = true;
  services.nscd.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  virtualisation.docker.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  environment.systemPackages = with pkgs; [
    git
    vim
    curl
    wget
    zsh
    home-manager
    os-prober
  ];
}

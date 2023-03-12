{config,pkgs, lib, inputs, ...}:

{
  imports = [
    ./hardware-configuration.nix
    ../common/global
    ../common/users/zack
    ../common/optional/nvidia.nix
    ../common/optional/gui.nix
    ../common/optional/wayland.nix
    ../common/optional/printing.nix
    ../common/optional/x11.nix
    ../common/optional/sound.nix
  ];
  #boot.loader.grub = {
  #  enable = true;
  #  version = 2;
  #  device = "/dev/nvme0n1";
  #  useOSProber = true;
  #};

  programs.steam.enable = true;

  virtualisation.virtualbox.host.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking.hostName = "trantor"; # Define your hostname.

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  services.udev.packages = [pkgs.zsa-udev-rules];
  environment.systemPackages = with pkgs; [
  ];

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 8000 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;



  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
  services.greetd.settings.default_session.user = "zack";
}

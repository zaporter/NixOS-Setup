{config,pkgs, lib, inputs, ...}:

# DRAWN FROM
# https://github.com/NixOS/nixpkgs/tree/master/nixos/modules/installer/cd-dvd/

{
  imports = [
    ../common/global
    ../common/users/zack
    ./all-hardware.nix
  ];
  #boot.loader.grub = {
  #  enable = true;
  #  version = 2;
  #  device = "/dev/nvme0n1";
  #  useOSProber = true;
  #};

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking.hostName = "iso"; # Define your hostname.

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  ];

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 8000 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # ISO naming.
  isoImage.isoName = "${config.isoImage.isoBaseName}-${config.system.nixos.label}-${pkgs.stdenv.hostPlatform.system}.iso";

  # EFI booting
  isoImage.makeEfiBootable = true;

  # USB booting
  isoImage.makeUsbBootable = true;

  # Add Memtest86+ to the CD.
  boot.loader.grub.memtest86.enable = true;

  # An installation media cannot tolerate a host config defined file
  # system layout on a fresh machine, before it has been formatted.
  #swapDevices = mkImageMediaOverride [ ];
  #fileSystems = mkImageMediaOverride config.lib.isoFileSystems;

  isoImage.edition = lib.mkForce "minimal";



  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
  services.greetd.settings.default_session.user = "zack";
}

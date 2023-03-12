{config,pkgs, lib, inputs, ...}:

{
  imports = [
    ./hardware-configuration.nix
    ../common/global
    ../common/users/zack
    ../common/optional/gui.nix
    ../common/optional/wayland.nix
    ../common/optional/printing.nix
    ../common/optional/x11.nix
    ../common/optional/sound.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_6_1;
  # nixos on framework 12th gen
  #boot.kernelParams = ["module_blacklist=hid_sensor_hub"];

  #systemd.targets.sleep.enable = false;
  #systemd.targets.suspend.enable = false;
  #systemd.targets.hibernate.enable = false;
  #systemd.targets.hybrid-sleep.enable = false;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking.hostName = "rama"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  services.xserver.desktopManager.xterm.enable = true;

  services.syncthing = {
        enable = true;
        user = "zack";
        dataDir = "/home/zack/Documents";    # Default folder for new synced folders
        configDir = "/home/zack/Documents/.config/syncthing";   # Folder for Syncthing's settings and keys
    };

  virtualisation.virtualbox.host.enable = true;

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



  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
  services.greetd.settings.default_session.user = "zack";
}

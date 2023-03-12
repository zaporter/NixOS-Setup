{pkgs, lib, ...}: {
    nixpkgs.config.allowUnfree = true;
    imports = [
    ];
    home.packages = with pkgs; [
      python3Full
      python310Packages.pip
      python310Packages.torch

      virtualenv

    ];

}

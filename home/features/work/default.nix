{pkgs, lib, ...}: {
    nixpkgs.config.allowUnfree = true;
    imports = [
    ];
    home.packages = with pkgs; [
      slack

    ];

}

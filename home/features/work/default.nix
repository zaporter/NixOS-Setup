{pkgs, lib, ...}: {
    nixpkgs.config.allowUnfree = true;
    imports = [
    ];
    home.packages = with pkgs; [
 #     steam-run
      act
      v4l-utils
      clamav
      dpkg

    ];

}

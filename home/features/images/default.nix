{pkgs, lib, ...}: {
    imports = [
    ];
    home.packages = with pkgs; [
      gimp

    ];

}

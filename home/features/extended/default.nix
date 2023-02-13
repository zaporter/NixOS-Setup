{pkgs, lib, ...}: {
    imports = [
        ./moonlander
    ];
    home.packages = with pkgs; [
        openvpn
        chromium
        bitwarden
        signal-desktop

    ];

}

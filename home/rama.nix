{config,inputs, pkgs, ...}: {
    nixpkgs.config.allowUnfree = true;
    imports = [
        ./global    
        ./global/git/zaporter-work.nix
        ./features/desktop
        ./features/desktop/i3
        ./features/extended
        ./features/lang
        ./features/work
        ./features/images
    ];

    #monitors = [
    #    {
    #      name = "DP-1";
    #      width = 1920;
    #      height = 1080;
    #      x = 0;
    #      workspace = "2";
    #    }
    #    {
    #      name = "DP-2";
    #      width = 3840;
    #      height = 2160;
    #      x = 1920;
    #      isPrimary = true;
    #      scale = "2.0";
    #      workspace = " 1";
    #    }
    #];
}

{config,inputs, pkgs, ...}: {
    imports = [
        ./global    
        ./features/desktop
        ./features/extended
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

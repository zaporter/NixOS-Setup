{config,inputs, pkgs, ...}: {
    imports = [
        ./global    
        ./features/desktop
        ./features/extended
    ];
}

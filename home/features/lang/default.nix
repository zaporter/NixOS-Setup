{pkgs, lib, ...}: {
    nixpkgs.config.allowUnfree = true;
    imports = [
      ./go
      ./rust
      ./python
    ];
    home.packages = with pkgs; [
    ];

}

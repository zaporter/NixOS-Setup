{pkgs, lib, ...}: {
    nixpkgs.config.allowUnfree = true;
    imports = [
      ./go
      ./rust
      ./python
      ./std
    ];
    home.packages = with pkgs; [
    ];

}

{ config, pkgs, lib, ... }:

{
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.cnijfilter2 ];
  nixpkgs.config.allowUnfreePredicate = (pkg: builtins.elem
    pkg.pname [
      "cnijfilter2"
    ]
  );
}

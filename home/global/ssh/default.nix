{inputs, config, pkgs, lib, ...}:

with lib; {
    home.file.".ssh/config" = {
      source = ./config;
    };

}

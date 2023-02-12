{config, pkgs, lib, ...}:

with lib; {
  config = {
    programs.neovim = {
      enable = true;
      #defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      extraConfig = ''
        :luafile ~/.config/nvim/custom/init.lua
      '';
      };

    xdg.configFile.nvim = {
      source = ./config;
      recursive = true;
    };
  };

}

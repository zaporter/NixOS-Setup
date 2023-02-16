{inputs, config, pkgs, lib, ...}:

with lib; {
  imports = [
    inputs.nixneovim.nixosModules.default # with Home Manager
  ];
  config = {

  home.packages = with pkgs; [
    nodejs
  ];
    programs.neovim = {
      enable = true;
      vimAlias = true;
      plugins = with pkgs; [
        vimPlugins.coc-nvim
        vimPlugins.coc-rust-analyzer
        vimPlugins.coc-go
        vimPlugins.nvim-tree-lua
        rust-analyzer
      ];
      #defaultEditor = true;
     # plugins = {
     #   lsp = {
     #     enable = true;
     #     servers.rust-analyzer.enable = true;
     #   };
     #   treesitter = {
     #     enable = true;
     #     indent = true;
     #   };
     #   mini = {
     #     enable = true;
     #     ai.enable = true;
     #     jump.enable = true;
     #   };
     # };
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

{
  description = "My nix config";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.11";
    home-manager.url = "github:nix-community/home-manager/release-22.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { nixpkgs, home-manager, ... }: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true; };
    };
    lib = nixpkgs.lib;
  in {
    homeManagerConfigurations = {
      zack = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [
          ./home.nix
          {
            home = {
              username = "zack";
              homeDirectory = "/home/zack";
              stateVersion = "22.11";
            };
          }
        ];
      };
    };
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
        ];
      };
    };
  };

  
}

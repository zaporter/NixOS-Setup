{
  description = "My nix config";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.11";
    home-manager.url = "github:nix-community/home-manager/release-22.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self,nixpkgs, home-manager, ... }@inputs: 
  let
    inherit (self) outputs;
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true; };
    };
    lib = nixpkgs.lib;
  in {
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;
    templates = import ./templates;
    
    overlays = import ./overlays { inherit inputs outputs; };
    packages = import ./pkgs {inherit pkgs;};
    devShells = import ./shell.nix {inherit pkgs;};
    formatter = pkgs.nixpkgs-fmt;

    homeManagerConfigurations = {
      "zack@trantor" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          ./home/trantor.nix
        ];
      };
    };
    nixosConfigurations = {
      trantor = lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./hosts/trantor
        ];
      };
    };
  };

  
}

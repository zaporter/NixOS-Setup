{lib, inputs, outputs, ...}:
{
  imports = [
    ./locale.nix
    ./nix.nix

  ] ++(builtins.attrValues outputs.nixosModules);
 # home-manager = {
 #   useUserPackages = true;
 #   extraSpecialArgs = { inherit inputs outputs; };
 # };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };
}

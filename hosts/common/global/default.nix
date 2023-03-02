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
  programs.ssh.startAgent = true;

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
}

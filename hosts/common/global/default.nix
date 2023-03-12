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
  services.nscd.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
}

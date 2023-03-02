# outputs can be seen with swaymsg -t get_outputs
# https://manpages.ubuntu.com/manpages/focal/en/man5/kanshi.5.html
{pkgs, lib, config,  ...}:

  with lib; let 
    cfg = config.zp;
  in  
{
    home.packages = [
        pkgs.firefox
    ];
#    programs.firefox = {
#        enable = true;
#        profiles = {
#           main = {
#               extensions = with pkgs.nur.repos.rycee.firefox-addons; [
#                    tree-style-tab
#                    bitwarden 
#               ];
#               bookmarks = [
#                {
#                    name = "Nix";
#                    bookmarks = [
#                        {
#                            name = "Search";
#                            url = "https://search.nixos.org";
#                        }
#                        {
#                            name = "Jordan Issacs";
#                            url = "https://github.com/jordanisaacs/dotfiles";
#                        }
#                        {
#                            name = "HomeManager Options";
#                            url = "https://mipmip.github.io/home-manager-option-search/";
#                        }
#                    ];
#                }
#               ];
#                
#               };
#            
#        };
#
#    };
}

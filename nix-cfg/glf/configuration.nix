{ config, ... }:
{
  # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  # NE TOUCHEZ A RIEN
  # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  boot.kernelParams = if config.boot.kernelModules == [ "kvm-amd" ] then [ "amd_pstate=active" ] else [ ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  system = {
    stateVersion = "24.05";
    autoUpgrade = { enable = true; dates = "weekly"; };
  };

  nixpkgs = { config = { allowUnfree = true; }; };

  nix = {

    optimise = {
      automatic = true;
      dates = [ "daily" ];
    };

    settings = {
      auto-optimise-store = true;

      substituters = [
        "https://nix-gaming.cachix.org"
        "https://nix-community.cachix.org"
      ];

      trusted-public-keys = [
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
  };
}

{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
	nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      # specialArgs = {inherit inputs;};
      modules = [
####  	{
####		nixpkgs.overlays = [
####			(final: prev: {
####				unstable = nixpkgs-unstable.legacyPackages.${prev.system};
####			})
####		];
####	}
	
		{
			nixpkgs = {
				overlays = [
					(final: prev: {
						unstable = import inputs.nixpkgs-unstable {
							system = "x86_64-linux";
						};
					})
				];
			};
		}

        ./configuration.nix
		./modules/hyprland.nix
		./modules/thunar.nix
		./modules/kitty.nix
		./modules/waybar.nix
        # inputs.home-manager.nixosModules.default
      ];
    };
  };
}


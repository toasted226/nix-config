{ pkgs, lib, ... }:

{
	options = {
		kitty.config = lib.mkOption {
			type = lib.types.path;
			default = ./config/kitty.conf;
			description = "Path to my Kitty config file";
		};
	};

	config = {
		environment.systemPackages = with pkgs; [
			kitty
		];

		environment.etc."xdg/kitty/kitty.conf".source = builtins.toPath ./../config/kitty/kitty.conf;
	};
}



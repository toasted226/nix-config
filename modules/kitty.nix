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
			starship
		];

		environment.etc."xdg/kitty/kitty.conf".source = builtins.toPath ./../config/kitty/kitty.conf;

		programs.starship = {
			enable = true;
			settings = {
				character = {
					success_symbol = "[❯](#cf5a1f bold) ";
					error_symbol = "[✗](bold red)";
				};
				hostname = {
					disabled = false;
					format = "[$ssh_symbol](yellow bold)[$hostname]($style) ";
					ssh_only = false;
					style = "#6f0eed bold";
					trim_at = ".";
				};
				directory = {
					disabled = false;
					style = "#cf5a1f bold";
				};
			};
		};
	};
}



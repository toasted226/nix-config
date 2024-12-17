{ pkgs, lib, ... }:

{
	options = {
		hyprland.config = lib.mkOption {
			type = lib.types.path;
			default = ./config/hypr/hyprland.conf;
			description = "Path to my Hyprland config file";
		};
	};

	config = {
		environment.systemPackages = with pkgs; [
			rofi-wayland
		];

		programs.hyprland = {
			enable = true;
			xwayland.enable = true;
		};
	};
}


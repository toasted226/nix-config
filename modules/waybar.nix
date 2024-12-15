{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		waybar
		dunst
		libnotify
		(waybar.overrideAttrs (oldAttrs: {
			mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
		  })
		)
		swww
		networkmanagerapplet
		brightnessctl
		pavucontrol
	];

	# Waybar setup
	programs.waybar.enable = true;

	environment.etc = {
		"xdg/waybar/config.jsonc".source = builtins.toPath ./../config/waybar/config.jsonc;
		"xdg/waybar/style.css".source = builtins.toPath ./../config/waybar/style.css;
	};

	environment.variables = {
		WAYBAR_CONFIG = "/etc/xdg/waybar/config.jsonc";
		WAYBAR_STYLE = "/etc/xdg/waybar/style.css";
	};
}


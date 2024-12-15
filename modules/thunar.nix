{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		arc-theme
	];

	# thunar config
	programs.thunar.enable = true;
	programs.xfconf.enable = true;
	services.gvfs.enable = true;
	services.tumbler.enable = true;

	programs.thunar.plugins = with pkgs.xfce; [ 
	thunar-archive-plugin 
	thunar-volman 
	];

	environment.variables.GTK_THEME = "Arc-Dark";
}


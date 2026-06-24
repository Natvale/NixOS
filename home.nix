{ config, pkgs, ...}:


{
	home.username = "emily";
	home.homeDirectory = "/home/emily";
	programs.git.enable = true;
	home.stateVersion = "26.05";
	programs.bash = {
		enable = true;
		shellAliases = {
			nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#Navi";
	};	
		initExtra = ''
		  export PS1='\[\e[38;5;27m\]\u\[\e[0m\] in \[\e[38;5;33m\]\w\[\e[0m\] \[\e[38;5;21m\]>\[\e[0m\] ' 
		'';
	};
	

	programs.alacritty = {
	  enable = true;
	  settings = {
	    window.opacity = 0.9;
	    };
	  };


	home.file.".config/foot".source = ./config/foot;
	home.file.".config/nvim".source = ./config/nvim;
	home.file.".config/mango".source = ./config/mango;

	home.packages = with pkgs; [
		neovim
		ripgrep
		nil
		nixpkgs-fmt
		nodejs
		gcc
	];
}	

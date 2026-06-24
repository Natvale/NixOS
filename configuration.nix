{ config, lib, pkgs, ... }:

{
imports =
  [ 
    ./hardware-configuration.nix
  ];

boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;

networking.hostName = "Navi"; 

networking.networkmanager.enable = true;

time.timeZone = "America/New_York";

services.displayManager.ly.enable = true;

#  services.xserver = {
#    enable = true;
#    autoRepeatDelay = 200;
#    autoRepeatInterval = 35;
#    windowManager.oxwm.enable = true;
#  };

programs.xwayland.enable = true;

programs.mango.enable = true;
  
services.picom = {
  enable = true;
  backend = "xrender";
  fade = true;
};

users.users.emily = {
  isNormalUser = true;
  extraGroups = [ "wheel" ]; 
  packages = with pkgs; [
    tree
  ];
};

nixpkgs.config.permittedInsecurePackages = [
  "librewolf-bin-151.0.1-2"
	"librewolf-bin-unwrapped-151.0.1-2"
];

hardware.graphics = {
  enable = true;
  enable32Bit = true;
};

services.xserver.videoDrivers = ["amdgpu"];

programs.steam.enable = true;

programs.steam.gamescopeSession.enable = true;

programs.gamemode.enable = true;
  
xdg.portal = {
  enable = true;
  extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
};

services.flatpak.enable = true;

nixpkgs.config.allowUnfree = true;

environment.systemPackages = with pkgs; [
  neovim 
  wget
  git
  alacritty
  htop
  fastfetch
  pcmanfm
  gnumake
  flameshot
  grim
  wlroots
  alsa-lib
  alsa-utils
  xwallpaper
  rofi
  librewolf-bin
  vesktop
  spotify
  gamescope
  mangohud
  gamemode
  prismlauncher
  flatpak
  kdePackages.ark
  yt-dlp
  vlc
  trash-cli
  davinci-resolve
  foot
  waybar
  ani-cli
];
  
fonts.packages = with pkgs; [
  nerd-fonts.jetbrains-mono
  dejavu_fonts
  freefont_ttf
  liberation_ttf
];

fonts.fontconfig.enable = true;
  
nix.settings.experimental-features = [ "nix-command" "flakes" ];

system.stateVersion = "26.05";

}


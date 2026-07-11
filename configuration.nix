{ config, lib, pkgs, ... }:

{
imports =
  [ 
    ./hardware-configuration.nix
  ];

boot.loader.grub = {
  enable = true;
  device = "nodev"; # for UEFI systems
  efiSupport = true;
};

boot.loader.efi.canTouchEfiVariables = true;

networking.hostName = "Navi"; 

networking.networkmanager.enable = true;

time.timeZone = "America/New_York";

services.displayManager.ly.enable = true;

programs.xwayland.enable = true;

programs.mango.enable = true;
  
users.users.emily = {
  isNormalUser = true;
  extraGroups = [ "wheel" ]; 
  packages = with pkgs; [
    tree
  ];
};

hardware.graphics = {
  enable = true;
  enable32Bit = true;
};

services.xserver.videoDrivers = ["amdgpu"];

programs.steam.enable = true;

programs.steam.gamescopeSession.enable = true;

programs.gamemode.enable = true;
  
nixpkgs.config.allowUnfree = true;

environment.systemPackages = with pkgs; [
  neovim 
  wget
  git
  htop
  fastfetch
  pcmanfm
  flameshot
  grim
  wlroots
  alsa-lib
  alsa-utils
  librewolf
  vesktop
  spotify
  gamescope
  mangohud
  gamemode
  prismlauncher
  kdePackages.ark
  yt-dlp
  mpv
  davinci-resolve
  foot
  xwayland
  wayland-utils
  thunderbird
  wlr-randr
  yazi
  swaylock
  waybar
  zsh
  fuzzel
  mpd
  rmpc
];
  
fonts.packages = with pkgs; [
  nerd-fonts.jetbrains-mono
];

fonts.fontconfig.enable = true;
  
nix.settings.experimental-features = [ "nix-command" "flakes" ];

system.stateVersion = "26.05";

}


{
	description = "super awsome flake";
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
    		};
    		mangowm = {
      			url = "github:mangowm/mango";
      			inputs.nixpkgs.follows = "nixpkgs";
    		};
  	};
	
	outputs = { self, nixpkgs, home-manager, mangowm, ...}@inputs: let
    		inherit (nixpkgs) lib;
	in {
		nixosConfigurations.Navi = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			specialArgs = { inherit inputs; };
			modules = [
				./configuration.nix
				inputs.mangowm.nixosModules.mango
				home-manager.nixosModules.home-manager
				{
					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						users.emily = import ./home.nix;
						backupFileExtension = "backup";
					};
				}
			];
		};
	};
}

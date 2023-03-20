{
  description = "wtfiscrq personal config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Uncomment when https://github.com/LnL7/nix-darwin/pull/595 is merged.
    # darwin.url = "github:lnl7/nix-darwin";
    darwin.url = "github:azuwis/nix-darwin/sketchybar";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    darwin,
    home-manager,
    nixpkgs,
  }: {
    formatter.aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.alejandra;

    darwinConfigurations.Joaos-MacBook-Pro = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      pkgs = import nixpkgs {system = "aarch64-darwin";};
      modules = [
        ./modules/darwin

        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.wtfiscrq.imports = [
              ./modules/home
            ];
          };
        }
      ];
    };
  };
}

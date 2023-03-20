.PHONY: build darwin

build:
	nix build .#darwinConfigurations.Joaos-MacBook-Pro.system

darwin: build
	darwin-rebuild switch --flake ~/code/wtfiscrq/wicnix
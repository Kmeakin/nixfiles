all: switch stow

switch:
	sudo nixos-rebuild switch --flake ".#`hostname`" --impure

stow:
	find config -type f -exec sh -c 'mkdir -p ~/.local/$$(dirname {}) && ln -sf $$(pwd)/{} ~/.local/{}' \;

gc:
	sudo nix-collect-garbage -d && nix-collect-garbage -d
	sudo nix store optimise && nix store optimise

update:
	sudo nix flake update


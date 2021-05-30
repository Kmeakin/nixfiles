all: switch stow

switch:
	sudo nixos-rebuild switch --flake ".#`hostname`" --impure

stow:
	find config -type f -exec sh -c 'mkdir -p ~/.local/$$(dirname {}) && ln -sf $$(pwd)/{} ~/.local/{}' \;

update:
	sudo nix flake update


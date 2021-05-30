install:
	stow --verbose=1 --target $(XDG_CONFIG_HOME)/ config/
	sudo nixos-rebuild switch --flake ".#`hostname`" --impure

update:
	sudo nix flake update

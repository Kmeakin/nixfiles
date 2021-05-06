install:
	stow --verbose=1 --target $(XDG_CONFIG_HOME)/ config/
	sudo nixos-rebuild switch --flake ".#`hostname`" --impure

update:
	stow --verbose=1 --target $(XDG_CONFIG_HOME)/ config/
	nix flake update
	sudo nixos-rebuild switch --flake ".#`hostname`" --impure

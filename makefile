install:
	stow --verbose=1 --target $(XDG_CONFIG_HOME)/ config/
	sudo nixos-rebuild switch --flake . --impure

update:
	rm -f flake.lock
	sudo nixos-rebuild switch --flake . --impure

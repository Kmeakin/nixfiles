install:
	stow --verbose=1 --target $(XDG_CONFIG_HOME)/ config/
	sudo nixos-rebuild switch --flake .

update:
	sudo nixos-rebuild switch --upgrade --flake .

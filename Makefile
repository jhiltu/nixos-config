switch:
	nixos-rebuild switch --use-remote-sudo --flake . -L

boot:
	nixos-rebuild boot --use-remote-sudo --flake . -L

test:
	nixos-rebuild test --use-remote-sudo --flake . -L

update:
	nix flake update

upgrade:
	make update && make switch

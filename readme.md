# NixOS Configuration

## Getting started

To install system-wide config:
`sudo nixos-rebuild switch --flake ".#$(hostname)"`

To install home-manager config:
`home-manager --flake . switch`

# Bibliography
https://github.com/sainnhe/sonokai
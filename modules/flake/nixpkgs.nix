# Set default nixpkgs version to unstable for rolling release
{
  flake-file.inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };
}

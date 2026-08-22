{ self, inputs, ... }: {
  flake-file.inputs.jannik-flake = {
    url = "github:jannik-zenker/dotfiles";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  perSystem = { pkgs, ... }: {
    packages.neovim = inputs.jannik-flake.lib.mkNeovim pkgs {
      theme = {
        name = "gruvbox";
        style = "dark";
        transparent = false;
      };
    };
  };

  den.aspects.neovim.homeManager = { pkgs, ... }: {
    home.packages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.neovim
    ];
  };
}

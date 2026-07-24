{ pkgs, ... }: {
  den.aspects.fabiPrograms = {
    nixos = {
      programs.steam.enable = true;

      environment.systemPackages = with pkgs; [
      ];
    };
  };
}
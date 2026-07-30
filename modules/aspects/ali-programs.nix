{ pkgs, ... }: {
  den.aspects.aliPrograms = {
    nixos = {
      programs.steam.enable = true;

      environment.systemPackages = with pkgs; [
        vscode
      ];
    };
  };
}

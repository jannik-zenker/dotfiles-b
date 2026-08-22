{ den, ... }: {
  den.aspects.fabian = {
    includes = with den; [
      # Include user-level modules
      aspects.bitwardenDesktop
      aspects.ghostty
      aspects.desktopTools
      aspects.fabiPrograms
      aspects.firefox
      aspects.fonts
      aspects.ghostty
      aspects.gtk
      aspects.modernCli
      aspects.nemo
      aspects.neovim
      aspects.niri
      aspects.noctalia
      aspects.starship
      aspects.vesktop
      aspects.zsh
      # Set primary shell and user groups
      den.batteries.primary-user
      (den.batteries.user-shell "zsh")
    ];
  };
}

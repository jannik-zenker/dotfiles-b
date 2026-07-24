{ den, ... }: {
  den.aspects.alibaba = {
    includes = with den; [
      # Include user-level modules
      aspects.aliPrograms
      aspects.bitwardenDesktop
      aspects.ghostty
      aspects.desktopTools
      aspects.firefox
      aspects.fonts
      aspects.ghostty
      aspects.gtk
      aspects.modernCli
      aspects.nemo
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

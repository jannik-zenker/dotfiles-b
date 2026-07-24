# Host and user declarations
{
  den.hosts.x86_64-linux.kek = {
    bootloader = "grub";
    gpu = "intel";
    profile = "laptop";

    users.fabian = {
      defaultBrowser = "firefox";
      defaultFileManager = "nemo";
      defaultTerminal = "ghostty";
      gitName = "Fab1anBecker";
      gitMail = "fabianvbecker@gmail.com";
    };
  };
}

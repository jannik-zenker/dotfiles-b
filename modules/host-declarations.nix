# Host and user declarations
{
  den.hosts.x86_64-linux.kek = {
    bootloader = "grub";
    gpu = "amd";
    profile = "laptop";

    users.fabian = {
      defaultBrowser = "firefox";
      defaultFileManager = "nemo";
      defaultTerminal = "ghostty";
      gitName = "";
      gitMail = "";
    };
  };
}

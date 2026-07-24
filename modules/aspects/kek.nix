{ den, lib, ... }:
{
  den.aspects.kek = {
    includes = [
      den.aspects.bluetooth
      den.aspects.documentIo
      den.aspects.fonts
      den.aspects.networkManager
      den.aspects.plymouth
      den.aspects.sddm
      den.aspects.niri
      den.aspects.zswap
    ];

    nixos =
      {
        config,
        modulesPath,
        ...
      }:
      {
        system.stateVersion = "26.11";

        # Hardware Configuration
        imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];
        boot = {
          initrd.availableKernelModules = [
            "xhci_pci"
            "nvme"
            "usb_storage"
            "sd_mod"
          ];
          kernelModules = [ "kvm-intel" ];
        };

        nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
        hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

        # Filesystem configuration with disko
        disko.devices = {
          disk = {
            system = {
              device = "/dev/disk/by-id/nvme-eui.00000000000000018ce38e10000626d0";
              type = "disk";
              content = {
                type = "gpt";
                partitions = {
                  EFI = {
                    type = "EF00";
                    size = "1G";
                    content = {
                      type = "filesystem";
                      format = "vfat";
                      mountpoint = "/boot";
                      mountOptions = [ "umask=0077" ];
                    };
                  };
                  SWAP = {
                    size = "4G";
                    content = {
                      type = "swap";
                    };
                  };
                  NIXOS = {
                    size = "100%";
                    content = {
                      type = "btrfs";
                      subvolumes = {
                        "@root".mountpoint = "/";
                        "@home".mountpoint = "/home";
                        "@nix".mountpoint = "/nix";
                      };
                    };
                  };
                };
              };
            };
          };
        };
      };

    # Set home.stateVersion to system.Stateversion since hm is a nixos module
    provides.to-users.homeManager = {
      home.stateVersion = "26.11";
    };
  };
}

{self, ...}: {
  flake.nixosModules.chromium = {
    home-manager.sharedModules = [self.homeModules.chromium];
  };
  flake.homeModules.chromium = {
    programs.chromium = {
      enable = true;
      extensions = [
        "bnjjngeaknajbdcgpfkgnonkmififhfo"
        "cjpalhdlnbpafiamejdnhcphjbkeiagm"
        "dbepggeogbaibhgnhhndojpepiihcmeb"
        "ddkjiahejlhfcafbddmgiahcphecmpfh"
        "djflhoibgkdhkhhcedjiklpkjnoahfmg"
        "eimadpbcbfnmbkopoojfekhnkhdbieeh"
        "ganlcelmnoaidpmaegcmhecolonfmffk"
        "ghbmnnjooekpmoecnnnilnnbdlolhkhi"
        "gnheenieicoichghfmjlpofcaebbgclh"
        "icpgjfneehieebagbmdbhnlpiopdcmna"
        "mmmomengbindngnkjblabjebdfmaiccj"
        "nngceckbapebfimnlniiiahkandclblb"
      ];
    };
  };
}

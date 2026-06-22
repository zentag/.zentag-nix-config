{self, ...}: {
  flake.nixosModules.chromium = {config, ...}: {
    imports = [
      (self.lib.hm config.username "chromium")
    ];
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

{self, ...}: {
  flake.nixosModules.chromium = {
    imports = [
      (self.lib.hm "zen" "chromium")
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

{self, ...}: {
  flake.lib.hm = user: modName: {home-manager.users.${user}.imports = [self.homeModules.${modName}];};
}

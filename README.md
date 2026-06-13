# structure

## tree

<details>
  <summary>click to expand</summary>

```text
├── flake.lock
├── flake.nix
├── helpers
│   ├── update.sh
│   └── ... other shell scripts ...
├── hosts
│   └── hp-laptop
│       ├── default.nix
│       └── hardware-configuration.nix
│   └── ... other hosts ...
├── modules
│   ├── hyprland
│   │   ├── default.nix
│   │   ├── home.nix
│   └── ... other modules ...
├── nvf
│   ├── default.nix
│   ├── highlighting.nix
│   └── ... other nvf configuration files ...
├── profiles
│   ├── graphical.nix
│   ├── minimal.nix
│   └── server.nix
├── README.md
└── wallpapers
    ├── someimage.jpg
    └── ... other wallpapers ...
```

</details>

## import flow

### default.nix

default.nix files exist in many directories in this config. each one will always
import every other file in the directory, but may have additional functionality.

### flake.nix

flake.nix imports from other people's flakes using the `inputs` attribute set

#### outputs

a package, zvim is outputted for each system. this is my configuration of
neovim, which comes from nvf/default.nix

a nixosModule is outputted for each directory in hosts/, importing its
default.nix

a homeConfiguration is outputted for each file in home/

### hosts

each host imports a profile and various addon modules not included in the
profile. the profile is meant to be a generalized use-case that can be applied
to many systems, but there are some modules that a system needs which aren't
general.

### profiles

profiles are parts of a nixos configuration, with each one importing modules.
sometimes they will reference another profile with many importing minimal. they
may or may not introduce configuration options.

### home

files in this directory are meant to be imported by flake.nix as a
homeConfiguration. They import modules, but they cannot just import the module's
directory as default.nix is for nixos configurations. they must import
modules/example_module/home.nix which is every part of the module which can be
expressed in home manager.

### modules

modules are the heart of this repo. each one has a default.nix which sets all
necessary nixos configurations and imports home.nix. home.nix does everything
that is able to be expressed in home manager so the module can be used on a
machine without nixos. modules that are purely nixos config will not have a
home.nix.

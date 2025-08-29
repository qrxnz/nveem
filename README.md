# nveem

## ✒️ Description

> Neovim configuration buit with nixvim

My minimal Neovim configuration provides good experience for multiple languages and facilitates DevOps-related tasks  `^‿^`

## 🖼️ Gallery

![nvim screenshot](./.github/assets/neovim.jpg)

## ⚒️ Installation

### ❄️ Nix

- Try it without installing:

```sh
nix run github:qrxnz/nveem
```

- Installation:

Add input in your flake like:

```nix
{
 inputs = {
   nveem = {
     url = "github:qrxnz/nveem";
     inputs.nixpkgs.follows = "nixpkgs";
   };
 };
}
```

With the input added you can reference it directly:

```nix
{ inputs, system, ... }:
{
  # NixOS
  environment.systemPackages = [ inputs.nveem.packages.${pkgs.system}.default ];
  # home-manager
  home.packages = [ inputs.nveem.packages.${pkgs.system}.default ];
}
```

or

You can install this package imperatively with the following command;

```nix
nix profile install github:qrxnz/nveem
```

## 🗒️ Credits

### 🎨 Inspiration

I was inspired by:

- [IogaMaster](https://github.com/IogaMaster/neovim)
- [redyf](https://github.com/redyf/Moon)
- [elythh](https://github.com/elythh/nixvim)
- [pete3n](https://github.com/pete3n/nixvim-flake/tree/main)

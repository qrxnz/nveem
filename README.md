# nveem

## ✒️ Description
> Personal neovim configuration with nix flake support  
  
My minimal Neovim configuration provides good experience for multiple languages and facilitates DevOps-related tasks  ^‿^

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

### 🐧 Without Nix

Paste in the terminal to install:
```
git clone https://github.com/qrxnz/nveem.git --depth=1 ~/.config/nvim/ && nvim
```
## 🗒️ Credits

### 🎨 Inspiration

I was inspired by:
- [IogaMaster](https://github.com/IogaMaster/neovim)
- [redyf](https://github.com/redyf/Moon)
- [elythh](https://github.com/elythh/nixvim)

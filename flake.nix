{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:/nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim/nixos-24.05";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      nixvim,
      flake-parts,
      ...
    }@inputs:
    let
      config = import ./config;
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem =
        { system, ... }:
        let
          pkgs = import nixpkgs { inherit system; };

          pkgs-unstable = import nixpkgs-unstable { inherit system; };

          asm-lsp-darwin_overlay = final: prev: {
            asm-lsp = pkgs-unstable.asm-lsp.overrideAttrs (oldAttrs: {
              buildInputs =
                oldAttrs.buildInputs
                ++ final.lib.optionals final.stdenv.isDarwin [
                  final.darwin.apple_sdk.frameworks.CoreFoundation
                  final.darwin.apple_sdk.frameworks.CoreServices
                  final.darwin.apple_sdk.frameworks.SystemConfiguration
                ];

              # tests expect ~/.cache/asm-lsp to be writable
              preCheck = ''
                export HOME=$(mktemp -d)
              '';

              meta = oldAttrs.meta // {
                platforms = final.lib.platforms.linux ++ final.lib.platforms.darwin;
              };
            });
          };

          bashdb-darwin_overlay = final: prev: {
            bashdb = prev.bashdb.overrideAttrs (oldAttrs: {
              meta = oldAttrs.meta // {
                platforms = final.lib.platforms.linux ++ final.lib.platforms.darwin;
              };
            });
          };

          pkgsWithOverlays = pkgs.extend (
            final: prev: asm-lsp-darwin_overlay final prev // bashdb-darwin_overlay final prev
          );

          nixvimLib = nixvim.lib.${system};
          nvim = nixvim.legacyPackages.${system}.makeNixvimWithModule {
            pkgs = pkgsWithOverlays;
            module = config;
          };
        in
        {
          checks = {
            default = nixvimLib.check.mkTestDerivationFromNvim {
              inherit nvim;
              name = "A nixvim configuration";
            };
          };

          packages = {
            default = nvim;
          };

          devShells.default = pkgs.mkShellNoCC {
            shellHook =
              # bash
              ''
                echo Welcome to a Neovim dev environment powered by Nixvim -- https://github.com/nix-community/nixvim
                PS1="Nixvim: \\w \$ "
                alias vim='nvim'
              '';
            packages = [ nvim ];
          };
        };
    };
}

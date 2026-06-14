{pkgs, ...}: let
  claudecode-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "claudecode.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "coder";
      repo = "claudecode.nvim";
      rev = "7c7d47e75d1c8597a676ca20b36a8b85a776ac61";
      hash = "sha256-INQAg5q5eSzZkC/RJPwd4R9fNKrwUYcsN/AaVT6saNE=";
    };
  };
in {
  extraPlugins = [claudecode-nvim];

  extraConfigLua = ''
    require("claudecode").setup()
  '';
}

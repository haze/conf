{ config, lib, pkgs, ... }:

{
	
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];

  environment.etc = {
    "sudoers.d/10-nix-commands".text = 
''%admin ALL=(ALL:ALL) NOPASSWD: /run/current-system/sw/bin/darwin-rebuild, \
   /run/current-system/sw/bin/nix*, \
   /run/current-system/sw/bin/ln, \
   /nix/store/*/activate, \
   /bin/launchctl
'';
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs;
    [ neovim-nightly
      ripgrep
      exa
      go
      vivid
      youtube-dl
      kubectl
      rustup
      cargo-edit
      ffmpeg
      cmake
      python39
      fzf
      python39Packages.pip
      hyperfine
      rnix-lsp
      nix-index
      adoptopenjdk-bin
      gnupg
      pinentry_mac
      tldr
      nodejs-14_x
      nodePackages.vscode-css-languageserver-bin
      nodePackages.vscode-html-languageserver-bin
      nodePackages.vscode-json-languageserver-bin
      curlFull.dev
      htop
      neofetch
      direnv
    ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  nix.nixPath = [ "darwin=/Users/haze/.nix-defexpr/channels/darwin" ];

  services.lorri.enable = true;
  nix.package = pkgs.nix;

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;


}

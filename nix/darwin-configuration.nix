{ lib, pkgs, ... }:

# let 
#   pkgsX86 = import <nixpkgs> { localSystem = "x86_64-darwin"; overlays = config.nixpkgs.overlays; };
# in 
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

  users.nix.configureBuildUsers = true;
  nix.nixPath = [ "darwin=/nix/store/pafi8wjxc8f9sslyb578cwddsrpki1nv-nix-darwin" ];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs;
  [ 
      # neovim-nightly
      # ripgrep
      # exa
      # go
      # vivid
      # youtube-dl
      # kubectl
      # rustup
      # cargo-edit
      # ffmpeg
      # cmake
      # python39
      # fzf
      # python39Packages.pip
      # icu
      # hyperfine
      # rnix-lsp
      # nix-index
      # adoptopenjdk-bin
      # gnupg
      # pinentry_mac
      # tldr
      # bat
      # wget
      # lzma
      # nodejs-12_x
      # nodePackages.vscode-css-languageserver-bin
      # nodePackages.vscode-html-languageserver-bin
      # nodePackages.vscode-json-languageserver-bin
      # nodePackages.nodemon
      # google-cloud-sdk
      # curlFull.dev
      # htop
      # neofetch
      # direnv
      # awscli
      # jq
      # ssm-session-manager-plugin
      # yarn
      # gst_all_1.gst-plugins-base
      # gst_all_1.gst-plugins-good
      # gst_all_1.gstreamer
    ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  services.lorri.enable = true;
  nix.package = pkgs.nix;

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  environment.variables.NODE_PATH="${pkgs.nodePackages.webpack.out}/lib/node_modules";
}

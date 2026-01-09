{ config, pkgs, ... }:

{
  # Config
  home.username = "atorizva";
  home.homeDirectory = "/home/atorizva";
  home.stateVersion = "25.05"; # Please read the comment before changing.

  home.packages = with pkgs; [

    # Editor
    helix

    # Language servers
    nil # nix

    # Shell
    zsh
    starship

    # Utils
    tmux
    direnv
    eza
    bat
    act # Run GH actions locally, docker must be installed manually atm
    git

  ];

  # Dotfiles
  home.file = {
    # ZSH + Starship
    ".config/starship.toml".source = dotfiles/starship/starship.toml; 
    ".zprofile".source = dotfiles/zsh/.zprofile;
    ".zshrc".source = dotfiles/zsh/.zshrc;
    # Git
    ".gitconfig".source = dotfiles/git/.gitconfig;
    # Alacritty
    ".alacritty.toml".source = dotfiles/alacritty/alacritty.toml;
  };

  home.sessionVariables = {
    EDITOR = "hx";
  };

  programs.home-manager.enable = true;
}

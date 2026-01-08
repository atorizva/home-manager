{ config, pkgs, ... }:

{
  # Config
  home.username = "atorizva";
  home.homeDirectory = "/home/atorizva";
  home.stateVersion = "25.05"; # Please read the comment before changing.

  home.packages = with pkgs; [

    # Language servers
    nil # nix

    # Shell
    zsh
    starship # prompt config

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
    ".zshrc".source = dotfiles/zsh/.zshrc;
    ".config/starship.toml".source = dotfiles/starship/starship.toml;
    # Git
    ".gitconfig".source = dotfiles/git/.gitconfig;
    # Alacritty
    ".alacritty.toml".source = dotfiles/alacritty/alacritty.toml;
  };

  home.sessionVariables = {
    EDITOR = "vi";
  };

  programs.home-manager.enable = true;
}

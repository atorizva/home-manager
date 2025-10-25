{ config, pkgs, ... }:

{
  # Config
  home.username = "atorizva";
  home.homeDirectory = "/home/atorizva";
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # Enable font management
  fonts.fontconfig.enable = true;

  # Enable GPU on distros different than NixOS
  nixGL.packages = import <nixgl> { inherit pkgs; };
  nixGL.defaultWrapper = "mesa";
  nixGL.installScripts = [ "mesa" ];

  # Programs
  programs.alacritty = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.alacritty;
  };

  home.packages = with pkgs; [

    # Languages
    jdk25 # For Scala purposes

    # Language servers
    nil

    # Package managers
    uv
    coursier

    # Shell
    zsh
    starship # prompt config

    # Utils
    direnv
    eza
    bat
    act # Run GH actions locally, docker must be installed manually atm
    git

    # Fonts
    nerd-fonts.iosevka

  ];

  # Dotfiles
  home.file = {
    # ZSH + Starship
    ".zshrc".source = dotfiles/zsh/.zshrc;
    ".config/starship.toml".source = dotfiles/starship/starship.toml;
    # Zed
    ".config/zed/settings.json".source = dotfiles/zed/settings.json;
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

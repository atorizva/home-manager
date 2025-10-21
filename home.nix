{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "atorizva";
  home.homeDirectory = "/home/atorizva";
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # Enable font management
  fonts.fontconfig.enable = true;

  nixGL.packages = import <nixgl> { inherit pkgs; };
  nixGL.defaultWrapper = "mesa";
  nixGL.installScripts = [ "mesa" ];

  programs.alacritty = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.alacritty;
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
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

    # Fonts
    nerd-fonts.iosevka

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # ZSH + Starship
    ".zshrc".source = dotfiles/zsh/.zshrc;
    ".config/starship.toml".source = dotfiles/starship/starship.toml;
    # Zed
    ".config/zed/settings.json".source = dotfiles/zed/settings.json;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/atorizva/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "zed";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

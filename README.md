# Dotfiles

Simple home-manager configuration and dotfiles.

## Packages

### Editor

 - helix

### Shell

- starship
- zsh

### Utils

- act
- bat
- direnv
- eza
- git
- keychain
- lazygit

### Language servers

- nil

## Instructions

1. Install Nix

```bash
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
```

2. Add home-manager channel

```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
```

3. Install home-manager

```bash
nix-shell '<home-manager>' -A install
```

4. Clone repository

```bash
git clone
```

5. Create new home-manager generation

```bash
home-manager switch
```

> [!IMPORTANT]
> To set ZSH as default shell you must add it first to `/etc/shells`.

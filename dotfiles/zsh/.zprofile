# ~/.profile: executed by the command interpreter for login shells.
# zsh profile file

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -e /home/atorizva/.nix-profile/etc/profile.d/nix.sh ]; then
    . /home/atorizva/.nix-profile/etc/profile.d/nix.sh;
fi # added by Nix installer

# Load Home Manager session variables
if [ -e "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" ]; then
  . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
fi

. "$HOME/.local/bin/env"

# >>> JVM installed by coursier >>>
export JAVA_HOME="/home/atorizva/.cache/coursier/arc/https/github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.29%252B7/OpenJDK11U-jdk_x64_linux_hotspot_11.0.29_7.tar.gz/jdk-11.0.29+7"
export PATH="$PATH:/home/atorizva/.cache/coursier/arc/https/github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.29%252B7/OpenJDK11U-jdk_x64_linux_hotspot_11.0.29_7.tar.gz/jdk-11.0.29+7/bin"
# <<< JVM installed by coursier <<<

# >>> coursier install directory >>>
export PATH="$PATH:/home/atorizva/.local/share/coursier/bin"
# <<< coursier install directory <<<

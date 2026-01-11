# Created by newuser for 5.9


# Enable autocomplete
# -U: supresses alias expansion
# -z: loads using zsh style rather than ksh
autoload -Uz compinit
compinit

eval "$(keychain --quiet --eval atorizva_github)"

eval "$(starship init zsh)"


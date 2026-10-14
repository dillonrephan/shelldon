SHELLDON_ZSH_DIR="$HOME/.zsh/shelldon"

[ -f "$SHELLDON_ZSH_DIR/10-env.zsh" ] && source "$SHELLDON_ZSH_DIR/10-env.zsh"
[ -f "$SHELLDON_ZSH_DIR/60-prompt.zsh" ] && source "$SHELLDON_ZSH_DIR/60-prompt.zsh"
[ -f "$SHELLDON_ZSH_DIR/20-plugins.zsh" ] && source "$SHELLDON_ZSH_DIR/20-plugins.zsh"
[ -f "$SHELLDON_ZSH_DIR/30-history.zsh" ] && source "$SHELLDON_ZSH_DIR/30-history.zsh"
[ -f "$SHELLDON_ZSH_DIR/40-aliases.zsh" ] && source "$SHELLDON_ZSH_DIR/40-aliases.zsh"
[ -f "$SHELLDON_ZSH_DIR/50-keybinds.zsh" ] && source "$SHELLDON_ZSH_DIR/50-keybinds.zsh"
[ -f "$SHELLDON_ZSH_DIR/70-functions.zsh" ] && source "$SHELLDON_ZSH_DIR/70-functions.zsh"

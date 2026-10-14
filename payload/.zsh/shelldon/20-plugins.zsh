ASYNC_PATH="$HOME/.zsh/pure/async.zsh"
PURE_PATH="$HOME/.zsh/pure/pure.zsh"
ZSH_SYNTAX_HIGHLIGHTING_PATH="/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
ZSH_AUTOSUGGESTIONS_PATH="/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

[ -f "$ZSH_SYNTAX_HIGHLIGHTING_PATH" ] && source "$ZSH_SYNTAX_HIGHLIGHTING_PATH"
[ -f "$ZSH_AUTOSUGGESTIONS_PATH" ] && source "$ZSH_AUTOSUGGESTIONS_PATH"
[ -f "$ASYNC_PATH" ] && source "$ASYNC_PATH"
[ -f "$PURE_PATH" ] && source "$PURE_PATH"

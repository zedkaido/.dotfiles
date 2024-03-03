# /etc/zshenv
# ~/.zshenv
# /etc/zprofile
# ~/.zprofile
# /etc/zshrc
# ~/.zshrc
# /etc/zlogin
# ~/.zlogin
# /etc/zlogout
# ~/.zlogout

# I'm not a sourcerer but I like sourcing
source ~/.aliasrc
source ~/.funcrc
source ~/.zsh_prompt
[ -f "/Users/xusr/.ghcup/env" ] && source "/Users/xusr/.ghcup/env" # ghcup-env

# GPG Launch
gpgconf --launch gpg-agent

# Where should I put you?
bindkey -s ^f "tmux-sessionizer\n"
bindkey -s ^b "tmux-switch-session\n"
bindkey -s ^x "cht\n"

# Useful for editing multi-line commands
bindkey -v
function vi-yank-xclip {
	zle vi-yank
   echo "$CUTBUFFER" | pbcopy -i
}
zle -N vi-yank-xclip
bindkey -M vicmd 'y' vi-yank-xclip

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

# Option + Backspace
bindkey "\e\177" backward-kill-word

# Ain't history great?
SAVEHIST=12345
HISTSIZE=1234
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_SPACE
bindkey "^R" history-beginning-search-backward
function fzy-history-selection() {
    local selected_cmd
    selected_cmd=$(fc -l -n 0 | fzy)
    LBUFFER=${selected_cmd%%$'\n'*}
    CURSOR=$#LBUFFER
}
zle -N fzy-history-selection
bindkey "^R" fzy-history-selection

# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit
  compinit
fi
export PATH="/usr/local/opt/libxml2/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/xusr/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# node (nvm)
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

# Ctrl+D was closing terminal
set -o ignoreeof

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/xusr/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/xusr/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/xusr/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/xusr/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

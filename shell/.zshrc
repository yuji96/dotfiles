# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# export -> eval -> alias -> source -> bindkey
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export PATH="$PATH:$HOME/.local/bin"
export GREP_OPTIONS='--color=auto'

eval "$(sheldon source)"
eval "$(direnv hook zsh)"

alias rl="readlink"
alias ls='ls --color=auto'
alias hf="uv run huggingface-cli"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
[[ -f "$HOME/.local/bin/env" ]] && source "$HOME/.local/bin/env"

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
setopt histignorealldups
setopt hist_ignore_space
unsetopt share_history

# 大文字小文字を無視して補完する
# わざわざ大文字を入力した時は小文字の候補を補完しない
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*:default' menu select=1 

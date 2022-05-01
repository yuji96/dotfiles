# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source "$HOME/.zinit/bin/zinit.zsh"

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-history-substring-search
zinit ice depth=1; zinit light romkatv/powerlevel10k

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

setopt histignorealldups
setopt hist_ignore_space
unsetopt share_history
export LSCOLORS=Gxfxcxdxbxegedabagacad

# 大文字小文字を無視して補完する
# わざわざ大文字を入力した時は小文字の候補を補完しない
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

# export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*:default' menu select=1 
zstyle ':completion:*:default' list-colors ${(s.:.)LSCOLORS}

autoload -Uz compinit && compinit

# alias
alias py='python'
alias ipy='ipython'
alias venv='python -m venv venv && pip install -U pip'

cdls ()
{
  \cd "$@" && ls
}
alias cdd="cdls"

# for python
## pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"
eval "$(pyenv init -)"
export PIPENV_VERBOSITY=-1

# for node
export PATH=$HOME/.nodebrew/current/bin:$PATH
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# for ruby
[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"

# for postgresql for mastodon
export PATH="/usr/local/opt/postgresql@12/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

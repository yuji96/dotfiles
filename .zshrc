# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export HOMEBREW_NO_AUTO_UPDATE=1
export PATH="/opt/homebrew/bin:$PATH"

source "/opt/homebrew/opt/zinit/zinit.zsh"
source ~/.local/share/zsh/plugins/zsh-shift-select/zsh-shift-select.plugin.zsh

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
export GREP_OPTIONS='--color=auto'

# 大文字小文字を無視して補完する
# わざわざ大文字を入力した時は小文字の候補を補完しない
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

zstyle ':completion:*:default' menu select=1 

autoload -Uz compinit && compinit

# alias
alias ls='ls --color=auto'
alias e='echo'
alias rl='readlink'
alias py='python'
alias ipy='ipython'
alias venv='python -m venv venv && . venv/bin/activate && pip install -U pip flake8 black isort'
alias brave='open -a Brave\ Browser'

# for python
## pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"
eval "$(pyenv init -)"
export PIPENV_VERBOSITY=-1
export TBVACCINE=1
export PATH="$HOME/.local/bin:$PATH"

# direnv
eval "$(direnv hook zsh)"

# for ruby
[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# # pnpm
# export PNPM_HOME="$HOME/Library/pnpm"
# case ":$PATH:" in
#   *":$PNPM_HOME:"*) ;;
#   *) export PATH="$PNPM_HOME:$PATH" ;;
# esac
# # pnpm end


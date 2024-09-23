# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
export XDG_CONFIG_HOME="$HOME/.config"
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="/opt/homebrew/opt/llvm@14/bin:$PATH"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)

source $ZSH/oh-my-zsh.sh

alias cddev="cd ~/Documents/dev/"
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --group-directories-first"
alias ll="eza --color=always --long --git --icons=always --no-user --no-permissions --group-directories-first"
alias la="eza --color=always --long -a --git --icons=always --no-user --no-permissions --group-directories-first"
alias tree="eza --tree --level=2 --color=always --group-directories-first --icons=always"
alias ..="cd .."

alias vi="vim"
alias vim="nvim"

alias cat="bat"

# markdown reader
alias md="mdcat"

# path for vim config
alias vimconfig="vim ~/.config/nvim"

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

export PATH="/Users/ivan/Documents/dev/nusmv/NuSMV-2.6.0-Darwin/bin:$PATH"

# odin path
export PATH="/usr/local/bin/Odin:$PATH"

# go script
export PATH="/Users/ivan/Documents/dev/go/roulette/:$PATH"
_fzf_comprun() {
  local command=$1
  shift
  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo $'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}
eval "$(fzf --zsh)"


# starship
eval "$(starship init zsh)"

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/ivan/.opam/opam-init/init.zsh' ]] || source '/Users/ivan/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration

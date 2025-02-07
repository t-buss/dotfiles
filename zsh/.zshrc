# zmodload zsh/zprof # Uncomment to get the zprof command for benchmarking zsh startup
export XDG_CONFIG_HOME=$HOME/.config
export LANG="en_US.UTF-8"
export ZSH="$HOME/.oh-my-zsh"
export EDITOR='nvim'
FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT=1

# ZSH Config
plugins=(
    git
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
    history-substring-search
    autojump
    zsh-vi-mode
    dotenv
    aws
    fzf
)

export FZF_VERSION=$(fzf --version | sed 's/ .*$//')
source $ZSH/custom/plugins/zsh-system-clipboard/zsh-system-clipboard.zsh
export ZSH_SYSTEM_CLIPBOARD_TMUX_SUPPORT='true'
source /home/linuxbrew/.linuxbrew/Cellar/fzf/$FZF_VERSION/shell/key-bindings.zsh
source /home/linuxbrew/.linuxbrew/Cellar/fzf/$FZF_VERSION/shell/completion.zsh
# source /home/linuxbrew/.linuxbrew/share/zsh/site-functions/*

# vi mode
bindkey -v

# Yank to the system clipboard
function vi-yank-xclip {
    zle vi-yank
    echo "$CUTBUFFER" | xclip
}

zle -N vi-yank-xclip
bindkey -M vicmd 'y' vi-yank-xclip

autoload -U edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line


# Theming
export BAT_THEME="Nord"
test -h "$XDG_CONFIG_HOME/dir_colors" && test -x dircolors && eval $(dircolors $XDG_CONFIG_HOME/dir_colors)

# Path
export N_PREFIX="$HOME/.n/"
export GOPATH="$HOME/go"
export PATH=$HOME/.n/bin:$HOME/go/bin:$GOPATH/bin:$HOME/.cargo/bin:/home/linuxbrew/.linuxbrew/bin:$HOME/.local/bin:$PATH
export PATH=$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export AWS_PROFILE=default

eval "$(fzf --zsh)"
source $ZSH/oh-my-zsh.sh
unset -f jc # Unset autojumps jc function to not interfere with the jc command line tool

# Aliases
alias v="nvim"
alias d="docker"
alias dc="docker-compose"
alias cp="cp -i"
alias rm="rm -i"
alias mv="mv -i --no-clobber"
alias gd="git diff"
alias gs="git status"
alias glo="git log --graph --oneline --all"
alias glr="git pull --rebase"
alias glrp="git pull --rebase --prune"
alias gcof='git checkout $(git branch | fzf)'
alias l="ls -lAh"
alias wttr="curl wttr.in/Dortmund"
alias sudo="sudo "
alias tmux='TERM=screen-256color tmux'
alias Syu="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean && brew update && brew upgrade && brew cleanup && sudo snap refresh && flatpak update -y"
alias brewdeps='brew deps --installed --tree -1 $(brew leaves) | less'
alias open="xdg-open"

autoload -U compinit && compinit
eval "$(starship init zsh)"


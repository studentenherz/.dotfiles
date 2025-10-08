# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


#zmodload zsh/datetime
#setopt PROMPT_SUBST
#PS4='+$EPOCHREALTIME %N:%i> '
#
#logfile=$(mktemp zsh_profile.XXXXXXXX)
#echo "Logging to $logfile"
#exec 3>&2 2>$logfile
#
#setopt XTRACE

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
# solana path
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"
# neovim
export PATH="$PATH:/opt/nvim-linux64/bin"
# asdf shims
export PATH="$PATH:$HOME/.asdf/shims"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="kennethreitz" # kardan kennethreitz
# ZSH_THEME="powerlevel10k/powerlevel10k" # kardan kennethreitz

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
        git
        virtualenv
        zsh-autosuggestions
        zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

fpath+=~/.zfunc
autoload -Uz compinit && compinit -C

lazy_nvm() {
  unset -f nvm node npm yarn pnpm
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}

nvm() { lazy_nvm; nvm "$@"; }
node() { lazy_nvm; node "$@"; }
npm() { lazy_nvm; npm "$@"; }
yarn() { lazy_nvm; yarn "$@"; }
pnpm() { lazy_nvm; pnpm "$@"; }

# loadnvm(){
# 	export NVM_DIR="$HOME/.nvm"
# 	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# 	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# 	#source /usr/share/nvm/init-nvm.sh
# }

# loadnvm

alias vim=nvim
alias 'cd..'='cd ..'
alias 'cd-'='cd -'
EDITOR=/usr/bin/nvim

random() {
    local length="$1"
    local charset="${2:-A-Za-z0-9}"
    tr -dc "$charset" </dev/random | head -c "$length" ; echo ''
}

loadenv() {
    local env_file="${1:-.env}"  # Default to .env if no argument is given

    if [ ! -f "$env_file" ]; then
        echo "Error: File '$env_file' not found"
        return 1
    fi

    grep '^[A-Za-z_][A-Za-z0-9_]*=' "$env_file" | while IFS= read -r line; do
        export "$line"
    done
}

gpp() {
  if [ $# -ne 1 ]; then
    echo "Usage: gpp <filename>"
  else
    local filename="$1"
    g++ "$filename.cpp" -g -static -Wall -pedantic -O2 -std=c++20 -o "$filename"
  fi
}

# Autocompletion function for gpp (suggest only basenames)
_gpp_completion() {
  # List all .cpp files, strip the .cpp extension, and add to completion
  local basenames=("${(@f)$(ls *.cpp 2>/dev/null | sed 's/\.cpp$//')}")
  compadd -- "${basenames[@]}"
}

# Bind the completion function to the gpp command
compdef _gpp_completion gpp

cf() {
	mkdir -p "$1"
	touch "$1/.editorconfig"
	echo "[*.cpp]" > "$1/.editorconfig"
	echo "indent_size = 4" >> "$1/.editorconfig"
	echo "indent_style = space" >> "$1/.editorconfig"
	touch "$1/in.txt"
	code "$1"
}

#unsetopt XTRACE
#exec 2>&3 3>&-

. "$HOME/.local/bin/env"
. "$HOME/.deno/env"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

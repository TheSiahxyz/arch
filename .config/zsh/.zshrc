### --- Prompt --- ###
if [[ -f "$POWERLEVEL9K_INSTALLATION_DIR/powerlevel10k.zsh-theme" ]]; then
    source "$POWERLEVEL9K_INSTALLATION_DIR/powerlevel10k.zsh-theme"
    if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
        source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
    fi
    [[ ! -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/p10k" ]] || source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/p10k"
else
    autoload -U colors && colors
    PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
fi

### --- ZSH --- ###
# GnuPG
export GPG_TTY="$(tty)"
gpg-connect-agent updatestartuptty /bye >/dev/null

# Options
stty stop undef             # Disable ctrl-s to freeze terminal.
setopt autocd
setopt extendedglob
setopt nomatch
setopt menucomplete
setopt interactive_comments
unsetopt bad_pattern

# History in cache directory
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"
setopt appendhistory
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space    # ignores all commands starting with a blank space! Usefull for passwords

# Style
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(vi-forward-char forward-char)
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(${ZSH_AUTOSUGGEST_ACCEPT_WIDGETS:#(vi-forward-char|forward-char)})
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish


### --- Autoload compinit and run it --- ###
autoload -Uz compinit       # Autoload compinit
_comp_options+=(globdots)   # Include hidden files in completion
compinit                    # Initialize completion system
zmodload zsh/complist       # Load completion list module

# _dotbare_completion_cmd
zstyle ':completion:*' menu select  # selectable menu
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]-_}={[:upper:][:lower:]_-}' 'r:|=*' 'l:|=* r:|=*'     # case insensitive completion
zstyle ':completion:*' special-dirs true    # Complete . and .. special directories
zstyle ':completion:*' list-colors ''   # colorize completion lists
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'    # colorize kill list

# fzf-tab
zstyle ':completion:*:git-checkout:*' sort false    # disable sort when completing `git checkout`
zstyle ':completion:*:descriptions' format '[%d]'   # set descriptions format to enable group support
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}   # set list-colors to enable filename colorizing
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'   # preview directory's content with exa when completing cd
zstyle ':fzf-tab:*' switch-group ',' '.'    # switch group using `,` and `.`


### --- Vi Mode --- ###
autoload edit-command-line; zle -N edit-command-line
zle -N zle-keymap-select
zle -N zle-line-init
echo -ne '\e[5 q'   # Use beam shape cursor on startup.


### --- Load Aliases, Functions, and Shortcuts --- ###
for config_file (${ZDOTDIR:-$HOME/.config/zsh}/*.zsh) source $config_file
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/scriptrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/scriptrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc"
# [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/git-aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/git-aliasrc"
[ -f "/root/.config}/shell/rootshortcutrc" ] && source "/root/.config}/shell/rootshortcutrc"
[ -f "/root/.config}/shell/rootzshnameddirrc" ] && source "/root/.config}/shell/rootzshnameddirrc"

### --- Source --- ###
zsh_add_plugins "${plugins[@]}"
source_packages

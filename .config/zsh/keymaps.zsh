#!/bin/zsh

# emacs style
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

# vi mode
bindkey -v
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# edit line in vim with ctrl-e:
bindkey '^v' edit-command-line          # ctrl-e
bindkey -M vicmd '^[[P' vi-delete-char  # delete
bindkey -M vicmd '^e' edit-command-line # ctrl-e
bindkey -M visual '^[[P' vi-delete      # delete
bindkey -M viins 'jk' vi-cmd-mode       # normal mode

# programs
bindkey -s '^a' '^ulf\n'
bindkey -s '^b' '^ubc -lq\n'
bindkey -s '^d' '^ufD\n'
bindkey -s '^e' '^use\n'
bindkey -s '^f' '^ucdi\n'
bindkey -s '^g' '^ulfcd\n'
bindkey -s '^x^b' '^urbackup\n'
bindkey -s '^x^l' '^usudo lf\n'
bindkey -s '^x^s' '^usshadd\n'
bindkey '^[[P' delete-char

# sudo
zle -N sudo-command-line
bindkey -M emacs '^s' sudo-command-line
bindkey -M vicmd '^s' sudo-command-line
bindkey -M viins '^s' sudo-command-line

# last command output
zle -N insert-last-command-output
bindkey "^o" insert-last-command-output

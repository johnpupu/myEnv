# Setting
setopt always_to_end            # when completing from the middle of a word, move the cursor to the end of the word
## https://stackoverflow.com/questions/32057760/is-it-possible-to-not-share-history-between-panes-windows-in-tmux-with-zsh
setopt noincappendhistory
setopt nosharehistory

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey '^i' expand-or-complete-prefix

# Need a tweak in arch for home and end keys to work properly
# (as well as insert, delete, pageup, pagedown, perhaps others...)
# https://wiki.archlinux.org/index.php/Home_and_End_keys_not_working#Zsh
bindkey "^[[2~" overwrite-mode # Ins
bindkey "^[[3~" delete-char # Del
bindkey "^[[5~" beginning-of-history #PageUp
bindkey "^[[6~" end-of-history #PageDown

# but.... home and end key escape sequences
# are DIFFERENT depending on whether I'm in a tmux session or not!
# To determine if tmux is running, examine values of $TERM and $TMUX.
if [ -n "$TERM" ] && [ -n "$TMUX" ]; then
  bindkey "^[[1~" beginning-of-line
  bindkey "^[[4~" end-of-line
else
  # Assign these keys if tmux is NOT being used:
  bindkey "^[[H" beginning-of-line
  bindkey "^[[F" end-of-line
fi

# Alias
alias la="ls -a"
alias lf="ls -FA"
alias ll="ls -lAhv"
alias tmux="tmux -2"
alias tmuxr="~/.tmuxr"
alias svndiff='svn diff --diff-cmd ~/.svndiff_to_vimdiff'
alias more='less'
#alias man='man \!:1 | less'
alias pwgen="pwgen -sy"
#alias memusage="ps aux | grep '\!:1' | awk '{ total += "\$"6; } END { print total/1024"'" MB"'" }'"
#alias cpuusage="ps aux | grep '\!:1' | awk '{ total += "\$"3; } END { print total"'" %"'" }'"
alias git-spu='git svn dcommit; git push'
alias git-spl='git svn rebase; git pull'
alias git-log='git log --graph --oneline --decorate'
#alias precmd='set msg = `history -h 1` ; logger -t $REMOTEHOST \[$USER@$HOSTNAME\] $PWD# "${msg}" >/dev/null'

# Fix jobs behavior. https://stackoverflow.com/questions/32614648/weird-jobs-behavior-within-zsh
fg() {
    if [[ $# -eq 1 && $1 = - ]]; then
        builtin fg %-
    else
        builtin fg %"$@"
    fi
}

# Do menu-driven completion.
zstyle ':completion:*' menu select

# Color completion for some things.
# http://linuxshellaccount.blogspot.com/2008/12/color-completion-using-zsh-modules-on.html
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# formatting and messages
# http://www.masterzen.fr/2009/04/19/in-love-with-zsh-part-one/
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format "$fg[yellow]%B--- %d%b"
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format "$fg[red]No matches for:$reset_color %d"
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# Completers for my own scripts
zstyle ':completion:*:*:sstrans*:*' file-patterns '*.(lst|clst)'
zstyle ':completion:*:*:ssnorm*:*' file-patterns '*.tsv'

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

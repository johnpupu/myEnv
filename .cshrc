# $FreeBSD: src/share/skel/dot.cshrc,v 1.14.6.1 2008/11/25 02:59:29 kensmith Exp $
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
#

alias h		history 25
alias j		jobs -l
alias la	ls -a
alias lf	ls -FA
alias ll	ls -lAhv
alias tmux	tmux -2
alias tmuxr	~/.tmuxr
alias svndiff 'svn diff --diff-cmd ~/.svndiff_to_vimdiff'
alias more less
alias man 'man \!:1 | less'
alias pwgen	pwgen -sy
alias memusage "ps aux | grep '\!:1' | awk '{ total += "\$"6; } END { print total/1024"'" MB"'" }'"
alias cpuusage "ps aux | grep '\!:1' | awk '{ total += "\$"3; } END { print total"'" %"'" }'"

# A righteous umask
umask 22

set PATH = (/sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin $HOME/bin)

setenv	EDITOR	vi
setenv	PAGER	more
setenv	BLOCKSIZE	K

if ($?prompt) then
	# An interactive shell -- set some stuff up
	set filec
	set history = 100
	set savehist = 100
	set mail = (/var/mail/$USER)
	if ( $?tcsh ) then
		bindkey "^W" backward-delete-word
		bindkey -k up history-search-backward
		bindkey -k down history-search-forward
	endif
endif

setenv LC_CTYPE en_US.ISO8859-1
#setenv LC_ALL zh_TW.Big5
#setenv LANG zh_TW.Big5
setenv LC_ALL en_US.UTF-8
setenv LANG en_US.UTF-8
#setenv LC_ALL zh_TW.UTF-8
#setenv LANG zh_TW.UTF-8

set prompt = '[%B%n%{^[[1;32m%}@%M%b] %B%~%b%# '

# if user is root, make the username bold and red
if (`whoami` == "root") then
 set prompt = '[%B%{^[[1;31m%}%n%{^[[1;32m%}@%M%b] %B%~%b%# '
endif

# color
setenv LSCOLORS ExGxFxdxCxegedabagExEx
setenv CLICOLOR yes
# autolist
set autolist
set autoexpand
set autocorrect
set recexact

# bind keypad keys for console, vt100, vt102, xterm
bindkey "\e[1~" beginning-of-line # Home
bindkey "\e[2~" overwrite-mode # Ins
bindkey "\e[3~" delete-char # Delete
bindkey "\e[4~" end-of-line # End
bindkey "^P" history-search-backward # CTRL + p = history-search-backward
bindkey "^N" history-search-forward # CTRL + n = history-search-forward

unlimit coredumpsize

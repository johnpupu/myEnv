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
alias ll	ls -lAh
alias tmux	tmux -2
alias tmuxr	~/.tmuxr
alias svndiff 'svn diff --diff-cmd ~/.svndiff_to_vimdiff'

# A righteous umask
umask 22

set path = (/sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin $HOME/bin)

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
#setenv LC_ALL en_US.UTF-8
#setenv LANG en_US.UTF-8
setenv LC_ALL zh_TW.UTF-8
setenv LANG zh_TW.UTF-8

0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

if [ ! ${command[exa]}]; then
  ${0:h}/install-exa.sh
fi

fpath+=(~/.local/completions)
manpath+=(~/.local/man)

exaflags='--links --icons --git --group --changed --time-style iso'
alias ls="$(has exa && printf 'exa' || printf 'ls') --group-directories-first --color=auto"
alias ll="${aliases[ls]:-ls} -l $(has exa && printf $exaflags)"
alias la="${aliases[ll]:-ll} -@ -a"
alias tree="exa --tree"

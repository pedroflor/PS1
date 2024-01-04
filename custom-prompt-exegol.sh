###########################################################
#################    CUSTOM PROMPT EXEGOL #################
###########################################################

BOLD=$(tput bold)
NORMAL="$(tput sgr0)"
ICYAN="\[\033[38;5;14m\]"
CYAB="\[\033[38;5;6m\]"
IWHITE="\[\033[38;5;15m\]"
GREEN="\[\033[38;5;2m\]"
IGREEN="\[\033[38;5;10m\]"
IRED="\[\033[38;5;9m\]"
RED="\[\033[38;5;1m\]"
IBLUE="\[\033[38;5;12m\]"
BLUE="\[\033[38;5;33m\]"
SYMBOL_DOLLAR="$"
SYMBOL_AT="㉿"
SYMBOL_GT="➤" #"›"
DATE=$(date "+%d/%m/%Y")

SYMBOL_PATH_SEPARATOR=" :: "
SYMBOL_SQUAREBRACKET_LEFT="["
SYMBOL_SQUAREBRACKET_RIGHT="]"
SYMBOL_LIGHTNING="⚡"
SYMBOL_SKULL_BIG="💀"
SYMBOL_SKULL_SMALL="☠️"
SYMBOL_LAPTOP="💻"
SYMBOL_NO_ENTRY="⛔"
SYMBOL_RED_SQUARE="🟥"
SYMBOL_RED_CIRCLE="🔴"


USER="${BOLD}${IRED}\u"
if [ $TERM == "xterm-256color" ] || [ $TERM == "tmux-256color" ] || [ $TERM == "xterm" ]; then AT_SYMBOL="${SYMBOL_NO_ENTRY}"; else AT_SYMBOL="@"; fi
HOST="\h${NORMAL}"
USER_AT_HOST="${USER}${AT_SYMBOL}${HOST}"
PROMPT_SYMBOL="${BOLD}#${NORMAL}"


PS1_l1="\n【${BLUE} "'$(date "+%H:%M:%S - %d/%m/%Y")'"${NORMAL} 】-【 ${USER_AT_HOST} 】\n"
PS1_l2="${ICYAN}┌── ${NORMAL}〘${ICYAN} ${BOLD}\w${NORMAL} 〙\n"
PS1_l3="${ICYAN}└─›${NORMAL}  ${PROMPT_SYMBOL} "
unset PS1
export PS1=${PS1_l1}${PS1_l2}${PS1_l3}

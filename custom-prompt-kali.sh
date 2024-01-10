#########################################################
#################    CUSTOM PROMPT KALI #################
#########################################################

#BOLD   => "\[$(tput bold)\]"
#NORMAL => "\[$(tput sgr0)\]"
ICYAN="\[\033[38;5;14m\]"
CYAB="\[\033[38;5;6m\]"
IWHITE="\[\033[38;5;15m\]"
GREEN="\[\033[38;5;2m\]"
IGREEN="\[\033[38;5;10m\]"
IRED="\[\033[38;5;9m\]"
RED="\[\033[38;5;1m\]"
IBLUE="\[\033[38;5;12m\]"
BLUE="\[\033[38;5;33m\]"
ORANGE="\[\e[38;5;214m\]"
PINK="\[\e[38;5;199m\]"
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


if [ "$EUID" -eq 0 ]
then
    USER="\[$(tput bold)\]${IRED}\u"
    if [ $TERM == "xterm-256color" ] || [ $TERM == "xterm" ]; then AT_SYMBOL="${SYMBOL_SKULL_SMALL} "; else AT_SYMBOL="@"; fi
    HOST="\h\[$(tput sgr0)\]"
    USER_AT_HOST="${USER}${AT_SYMBOL}${HOST}"
    PROMPT_SYMBOL="\[$(tput bold)\]"'#'"\[$(tput sgr0)\]"
else
    USER="${IGREEN}\u"
    if [ $TERM == "xterm-256color" ] || [ $TERM == "xterm" ]; then AT_SYMBOL="${SYMBOL_LIGHTNING}"; else AT_SYMBOL="@"; fi

    HOST="${IGREEN}\h\[$(tput sgr0)\]"
    USER_AT_HOST="${USER}${AT_SYMBOL}${HOST}"
    PROMPT_SYMBOL="\[$(tput bold)\]"'$'"\[$(tput sgr0)\]"
fi


if [ $TERM == "xterm-256color" ] || [ $TERM == "xterm" ]
then
    PS1_l1="\n【 ${GREEN}"'$(date "+%H:%M:%S - %d/%m/%Y")'"\[$(tput sgr0)\] 】-【 ${USER_AT_HOST} 】\n"
    PS1_l2=${ICYAN}"┌── 〘 ${IWHITE}\w${ICYAN} 〙\[$(tput sgr0)\] \n"
    PS1_l3=${ICYAN}"└─› \[$(tput sgr0)\]${PROMPT_SYMBOL} "
    unset PS1
    export PS1=${PS1_l1}${PS1_l2}${PS1_l3}
else
    PS1_l1="\n[ ${GREEN}"'$(date "+%H:%M:%S - %d/%m/%Y")'"\[$(tput sgr0)\] ] - [ ${USER_AT_HOST} ]\n"
    PS1_l2=${ICYAN}"┌── [ ${IWHITE}\w${ICYAN}]\[$(tput sgr0)\] \n"
    PS1_l3=${ICYAN}"└─> \[$(tput sgr0)\]${PROMPT_SYMBOL} "
    unset PS1
    export PS1=${PS1_l1}${PS1_l2}${PS1_l3}
fi

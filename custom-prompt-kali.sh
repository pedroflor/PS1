#########################################################
#################    CUSTOM PROMPT KALI #################
#########################################################

#BOLD   => "\[$(tput bold)\]"
#NORMAL => "\[$(tput sgr0)\]"
CYAN="\[\e[38;5;6m\]"
ICYAN="\[\e[38;5;14m\]"
WHITE="\[\e[38;5;7m\]"
IWHITE="\[\e[38;5;15m\]"
GREEN="\[\e[38;5;2m\]"
IGREEN="\[\e[38;5;10m\]"
RED="\[\e[38;5;1m\]"
IRED="\[\e[38;5;9m\]"
BLUE="\[\e[38;5;4m\]"
IBLUE="\[\e[38;5;12m\]"
ORANGE="\[\e[38;5;214m\]"
PINK="\[\e[38;5;5m\]"
IPINK="\[\e[38;5;13m\]"
PURPLE="\[\e[38;5;93m\]"

SYMBOL_DOLLAR="$"
SYMBOL_AT_KALI="㉿"
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


# Parametrizar colores
USER_ROOT_AND_HOSTNAME_COLOR=${IRED}
USER_NORMAL_AND_HOSTNAME_COLOR=${GREEN}
AT_ROOT_SYMBOL="☠️"
AT_NORMAL_SYMBOL="㉿"


## Unset previous PS1
#unset PS1

## USERNAME, HOSTNAME, PROMPT-SYMBOL
if [[ "$EUID" -eq 0 ]]
then
    # USERNAME "root"
    USERNAME="\[$(tput bold)\]${USER_ROOT_AND_HOSTNAME_COLOR}\u\[$(tput sgr0)\]"
    # "AT" symbol
    if [ $TERM == "xterm-256color" ] || [ $TERM == "xterm" ]; then AT_SYMBOL="${AT_ROOT_SYMBOL} "; else AT_SYMBOL="\[$(tput bold)\]@"; fi
    # HOSTNAME
    HOSTNAME="\[$(tput bold)\]${USER_ROOT_AND_HOSTNAME_COLOR}\h\[$(tput sgr0)\]"
    # USERNAME "AT" HOSTNAME
    USERNAME_AT_HOSTNAME="${USERNAME}${AT_SYMBOL}${HOSTNAME}"
    # Prompt symbol
    PROMPT_SYMBOL="\[$(tput bold)\]"'#'"\[$(tput sgr0)\]"
else
    # USERNAME "normal"
    USERNAME="\[$(tput bold)\]${USER_NORMAL_AND_HOSTNAME_COLOR}\u\[$(tput sgr0)\]"
    # "AT" symbol
    if [ $TERM == "xterm-256color" ] || [ $TERM == "xterm" ]; then AT_SYMBOL="${AT_NORMAL_SYMBOL}"; else AT_SYMBOL="\[$(tput bold)\]@"; fi
    # HOSTNAME
    HOSTNAME="\[$(tput bold)\]${USER_NORMAL_AND_HOSTNAME_COLOR}\h\[$(tput sgr0)\]"
    # USERNAME "AT" HOSTNAME
    USERNAME_AT_HOSTNAME="${USERNAME}${AT_SYMBOL}${HOSTNAME}"
    # Prompt symbol
    PROMPT_SYMBOL="\[$(tput bold)\]"'$'"\[$(tput sgr0)\]"
fi


ARROW_COLOR="${CYAN}"
PATH_COLOR="${IWHITE}"

# date-time, path
if [ $TERM == "xterm-256color" ] || [ $TERM == "xterm" ]
then
    PS1_l1="\n${IWHITE}【${BLUE} "'$(date "+%H:%M:%S - %d/%m/%Y")'"\[${IWHITE} 】-【 ${IBLUE}${USERNAME_AT_HOSTNAME} 】\n"
    PS1_l2="${ARROW_COLOR}┌── \[$(tput sgr0)\]〘${PATH_COLOR} \w\[$(tput sgr0)\] 〙\n"
    PS1_l3="${ARROW_COLOR}└─›\[$(tput sgr0)\]  ${PROMPT_SYMBOL} "
    PS2=${PS1}
    PS1="${PS1_l1}${PS1_l2}${PS1_l3}"
else
    PS1_l1="\n[${BLUE} "'$(date "+%H:%M:%S - %d/%m/%Y")'"\[$(tput sgr0)\] ] - [ ${USERNAME_AT_HOSTNAME} ]\n"
    PS1_l2="${ARROW_COLOR}┌── \[$(tput sgr0)\]〘${PATH_COLOR} \[$(tput bold)\]\w\[$(tput sgr0)\] 〙\n"
    PS1_l3="${ARROW_COLOR}└─>\[$(tput sgr0)\]  ${PROMPT_SYMBOL} "
    PS1=${PS1_l1}${PS1_l2}${PS1_l3}
fi
export PS1

# pwd only
#PROMPT_COMMAND='echo -en "\033]0; $("pwd") \a"'

## Regular
#PROMPT_COMMAND='echo -en "\033]0; [ $("logname")㉿$("hostname") ] :: [ $("pwd") ] \a"'

## Fancy
#PROMPT_COMMAND='echo -en "\033]0; 【 $("logname")㉿$("hostname") 】 :: 【 $("pwd") 】 \a"'

## ZEN (Clean Window Title & Title Bar)
PROMPT_COMMAND='echo -en "\033]0; \a"'

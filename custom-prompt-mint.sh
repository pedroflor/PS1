#########################################################
#################    CUSTOM PROMPT MINT #################
#########################################################

NORMAL="$(tput sgr0)"
ICyan="\[\033[38;5;14m\]"
Cyan="\[\033[38;5;6m\]"
IWhite="\[\033[38;5;15m\]"
IGreen="\[\033[38;5;10m\]"
IRed="\[\033[38;5;9m\]"
Red="\[\033[38;5;1m\]"
IBlue="\[\033[38;5;12m\]"
Blue="\[\033[38;5;33m\]"
DATE="\D{%d/%m/%Y}"
SYMBOL_DOLLAR="$"
SYMBOL_GT="➤"
SYMBOL_PATH_SEPARATOR=" :: "
SYMBL_SQUAREBRACKET_LEFT="["
SYMBL_SQUAREBRACKET_RIGHT="]"

PROMPT_SYMBOL="::"
if [ "$EUID" -eq 0 ]; then # Change icon for root user
PROMPT_SYMBOL="☠️ "
fi

# Line 1
PS1="\n\[$NORMAL\]${ICyan}${SYMBOL_GT}\[$NORMAL\]${Cyan}${SYMBOL_GT}\[$NORMAL\]${IWhite} [ ${DATE}, \t - \[$NORMAL\]${IGreen}\u@\H\[$NORMAL\]${IWhite} ] \n"
# Line 2: ➤➤
PS1=$PS1"\[$NORMAL\]${IBlue}${SYMBOL_GT}\[$NORMAL\]${IBlue}${SYMBOL_GT}\[$NORMAL\]${IWhite}" #@" \[$(tput bold)\]\\$\[$NORMAL\] \[$NORMAL\]"
# Line 2: PATH
PS1=$PS1" \[$NORMAL\]${IWhite}[ \[$NORMAL\]${IBlue}\w\[$NORMAL\]${IWhite} ]\n"
# Line 3
PS1=$PS1"\[$NORMAL\]${IRed}${SYMBOL_GT}\[$NORMAL\]${Red}${SYMBOL_GT}\[$NORMAL\]${IWhite} \[$(tput bold)\]\\$\[$NORMAL\] \[$NORMAL\]"


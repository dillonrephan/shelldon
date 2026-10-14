if [[ $EUID -eq 0 ]]; then
    export PURE_PROMPT_SYMBOL='🐇'
else
    export PURE_PROMPT_SYMBOL='🐢'
fi

export PURE_CMD_MAX_EXEC_TIME=5

RPROMPT='%(?.%F{green}✔%f.%F{red}✘%f)'

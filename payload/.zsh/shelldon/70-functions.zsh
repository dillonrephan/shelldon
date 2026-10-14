SHELLDON_BG_NORMAL="${SHELLDON_BG_NORMAL:-#1e1e2e}"
SHELLDON_BG_ROOT="${SHELLDON_BG_ROOT:-#5a2a2a}"

shelldon_set_bg() {
    [[ -t 1 ]] || return 0
    [[ -n "${TERM:-}" && "${TERM:-}" != "dumb" ]] || return 0
    printf "\033]11;%s\007" "$1"
}

shelldon_restore_bg() {
    shelldon_set_bg "$SHELLDON_BG_NORMAL"
}

if [[ $EUID -eq 0 ]]; then
    shelldon_set_bg "$SHELLDON_BG_ROOT"
    autoload -Uz add-zsh-hook
    add-zsh-hook zshexit shelldon_restore_bg
    if [[ "${SHELLDON_UNLEASH:-0}" == "1" ]]; then
        cat <<'SHELLDON_UNLEASH_BANNER'

             (\__/)                          (\__/)
             (•ㅅ•)                          (•ㅅ•)
         ＿ノ ヽ ノ＼＿                  ＿／ノ ヽ ノ＿
      /　`/ ⌒Ｙ⌒ Ｙ  ヽ                /　`/ ⌒Ｙ⌒ Ｙ  ヽ
     ( 　(三ヽ人　 /　  |                |　  \ 　人ﾉ三)　  )
     |　ﾉ⌒＼ ￣￣ヽ   ノ                ヽ   ／￣￣ ／⌒ヽ　|
     ヽ＿＿＿＞､＿＿／                ＼＿＿､＜＿＿＿ノ
             ｜( 王 ﾉ〈                  〉ヽ 王 )｜
             /ﾐ`ー―彡\                  /彡―ー`ﾐ\
            / ╰    ╯ \                  / ╰    ╯ \

  _   _ _   _     _____    _    ____  _   _ _____ ____
 | | | | \ | |   | ____|  / \  / ___|| | | | ____|  _ \
 | | | |  \| |   |  _|   / _ \ \___ \| |_| |  _| | | | |
 | |_| | |\  |   | |___ / ___ \ ___) |  _  | |___| |_| |
  \___/|_| \_|   |_____/_/   \_\____/|_| |_|_____|____/

  FAST CARS, POWER TOOLS, AND ROOT TERMINALS.
  FOR WHEN YOU WANNA FUCK UP IN A HURRY ;)
  HOP FAST, VERIFY FASTER.

SHELLDON_UNLEASH_BANNER
        unset SHELLDON_UNLEASH
    fi
fi

ssh() {
    printf "\033]11;#9b0853\007"
    command ssh "$@"
    printf "\033]11;#1e1e2e\007"
}

unleashShell() {
    sudo env HOME="$HOME" ZDOTDIR="$HOME" SHELLDON_UNLEASH=1 /usr/bin/zsh -il
}

suroot() {
    sudo env HOME="$HOME" ZDOTDIR="$HOME" /usr/bin/zsh -il
}

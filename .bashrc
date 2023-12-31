[ -f ~/.fzf.bash ] && source ~/.fzf.bash
#======== FUNCTION ============#
otw() {
  file_path="/root/otwpass"
  line_threshold="$1"
  replacement_text="$2"

  if [[ $(wc -l < "$file_path") -gt "$line_threshold" ]]; then
    sed -i "$(($line_threshold + 1))s/.*/$replacement_text/" "$file_path"
  else
    echo "$replacement_text" >> "$file_path"
  fi
  sshpass -p$replacement_text ssh -p 2220 -o StrictHostKeyChecking=no bandit$line_threshold@bandit.labs.overthewire.org
}
# pnc() {
#   /root/cp/utils/w2pts -n $(tty) 'eval "$(/root/cp/utils/mcf pn code)"'
# }
# pws() {
#   /root/python/winconn cmd $1
# }
# opgx() {
#   pws "opgx $1"
# }
# code() {
#   pws "code $(realpath $1)"
# }
findroot() {
        find / -iname *$1* 2>/dev/null
}
cal_mem() {
  local unit="MB"  # Set the desired unit ("KB", "MB", or "GB")
  ps -o rss --no-header -p $(pgrep $1) | awk -v unit="$unit" '
    { sum += $1 }
    END {
        if (unit == "KB")
            printf "%d KB\n", sum
        else if (unit == "MB")
            printf "%.2f MB\n", sum / 1024
        else if (unit == "GB")
            printf "%.2f GB\n", sum / (1024 * 1024)
    }'
}

#======== ALIAS ============#
alias tmat='tmux attach || tmux'
alias vi='vim'
alias pn='eval "$(/home/kayd/cp/utils/mcf pn vim)"'
alias p='eval "$(/home/kayd/cp/utils/mcf p)"'

#sleep 0.1
#wmctrl -i -r $(wmctrl -lx | grep xfce4-terminal | cut -d' ' -f1) -b add,fullscreen
#wmctrl -r lxterminal -b add,fullscreen
#wmctrl -r qterminal -b add,fullscreen
#wmctrl -i -r $(wmctrl -lx | grep gnome-terminal | cut -d' ' -f1) -b add,fullscreen

# Created by `pipx` on 2023-09-09 09:34:12
export PATH="$PATH:/home/kayd/.local/bin"

startx 2>/dev/null

# open tmux
[[ $TERM_PROGRAM != "vscode" && -z $TMUX ]] && (tmat)

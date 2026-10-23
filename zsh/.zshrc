export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

alias cls='clear && szs'
alias ls='ls -t --color=auto'
alias nzs='nano ~/.zshrc'
alias szs='clear && source ~/.zshrc'
alias sdock='sudo docker'
alias dev="cd /media/samikb/dev/"
alias checkmem='ps -eo pid,user,comm,%mem,rss --sort=-rss | head -20'
alias config='cd ~/.config'
# alias refresh='sudo sh -c 'sync; echo 3 > /proc/sys/vm/drop_caches''
alias cdm='codium'
alias file='thunar'
alias wayt='~/.config/waybar/scripts/themes.sh'
alias backup='bash ~/config-bak/back.sh'

# YT-DLP ALIASES
alias yt720='yt-dlp -f "bv*[height<=720]+ba/b"'
alias yt480='yt-dlp -f "bv*[height<=480]+ba/b"'
alias yt144='yt-dlp -f "bv*[height<=144]+ba/b"'
fastfetch -c ~/.config/fastfetch/config.json

plugins=(git)

# cowsay -f eyes "Back at it again ?"
# cat ~/.config/konsole/logo.txt | sed $'s/.*/\e[36m&\e[0m/'
# figlet -f 'ANSI Regular.flf' welcome | lolcat # bhalo lagche na

source $ZSH/oh-my-zsh.sh
export PATH="/opt/nvim-linux-x86_64/bin:$PATH"

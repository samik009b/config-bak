# PROMPT='%F{173}🍁%K{94}%F{223} %n %k%f %F{223}%1~%f %F{173}❯%f '
PROMPT="${NEWLINE}%F{#e89b45}🍁%F{#d98b45}%n %F{#bdae93}%2~
%F{#d5c4a1}❯ %f"

alias cls='clear && szs'
alias ls='ls -t --color=auto'
alias nzs='nvim ~/.zshrc'
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
alias btop='btop --utf-force'

alias v='nvim'
alias vk='kitty &; nvim'

# YT-DLP ALIASES
alias yt720='yt-dlp -f "bv*[height<=720]+ba/b"'
alias yt480='yt-dlp -f "bv*[height<=480]+ba/b"'
alias yt144='yt-dlp -f "bv*[height<=144]+ba/b"'
fastfetch -c ~/.config/fastfetch/config.json

# from bread on penguins
# NEWLINE=$'\n'
# PROMPT="${NEWLINE}%K{#2E3440}%F{#E5E9F0}$(date +%_I:%M%P) %K{#3b4252}%F{#ECEFF4} %n %K{#4c566a} %~ %f%k ❯ " # nord theme

# echo -e "${NEWLINE}\x1b[38;5;137m\x1b[48;5;0m it's$(date +%_I:%M%P) \x1b[38;5;180m\x1b[48;5;0m $(uptime -p | cut -c 4-) \x1b[38;5;223m\x1b[48;5;0m $(uname -r) \033[0m" # warmer theme
echo -e "\n\033[38;5;180m🍂Welcome back, ${USER}.\033[38;5;223m up: $(uptime -p | sed -E 's/up //; s/,//g; s/ hours?/h/; s/ minutes?/m/; s/ days?/d/')\033[0m\n"

plugins=(git)

# cowsay -f eyes "Back at it again ?"

export PATH="/opt/nvim-linux-x86_64/bin:$PATH"

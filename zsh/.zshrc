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

alias nv='nvim'

# YT-DLP ALIASES
alias yt720='yt-dlp -f "bv*[height<=720]+ba/b"'
alias yt480='yt-dlp -f "bv*[height<=480]+ba/b"'
alias yt144='yt-dlp -f "bv*[height<=144]+ba/b"'

fastfetch -c ~/.config/fastfetch/config.json

echo -e "\n\033[38;5;180m🍂Welcome back, ${USER}.\033[38;5;223m up: $(uptime -p | sed -E 's/up //; s/,//g; s/ hours?/h/; s/ minutes?/m/; s/ days?/d/')\033[0m\n"

# cowsay -f eyes "Back at it again ?"

export PATH="/opt/nvim-linux-x86_64/bin:$PATH"

# Persistent Zsh command history
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

# Autosuggestions
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting — keep this last
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

cd ~

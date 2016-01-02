#file: ~/.bashrc
#author: Ypnose - http://tetedulinuxien.fr

# text editor par défaut
export EDITOR="vim"
#start Archey
#archey

# Check for an interactive session
[ -z "$PS1" ] && return
export LANG="fr_FR.utf8"
#PS1='[\u@\h \W]\$ '
#PS1='\[\e[0;94m\]┌───< \[\e[0;36m\]\u\[\e[0;94m\] >───< \[\e[0;93m\]\w\[\e[0;94m\] >\n\[\e[0;94m\]└───>\[\e[0m\] '
PS1='\[\e[0;34m\]┌──< \[\e[1;36m\]\u\[\e[0;34m\] >───< \[\e[0;33m\]\w\[\e[0;34m\] >\n\[\e[0;34m\]└──< \[\e[1;32m\]\A\[\e[0;34m\] >───╼\[\e[0;36m\] '

#COLORS
trap "printf '\e[0m'" DEBUG
export GREP_COLOR='1;36'

#VARIOUS
export HISTSIZE=100
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=erasedups:ignorespace
shopt -s cdspell
shopt -s expand_aliases

#MAN
export LESS_TERMCAP_mb=$'\E[0;36m'
export LESS_TERMCAP_md=$'\E[0;36m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[0;44;30m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[1;32m'

#EXTRACT
et () {
if [ -f $1 ] ; then
case $1 in
*.lrz) lrztar -d $1 && cd $(basename "$1" .lrz) ;;
*.tar.bz2) tar xvjf $1 && cd $(basename "$1" .tar.bz2) ;;
*.tar.gz) tar xvzf $1 && cd $(basename "$1" .tar.gz) ;;
*.tar.xz) tar Jxvf $1 && cd $(basename "$1" .tar.xz) ;;
*.bz2) bunzip2 $1 && cd $(basename "$1" /bz2) ;;
*.rar) unrar x $1 && cd $(basename "$1" .rar) ;;
*.gz) gunzip $1 && cd $(basename "$1" .gz) ;;
*.tar) tar xvf $1 && cd $(basename "$1" .tar) ;;
*.tbz2) tar xvjf $1 && cd $(basename "$1" .tbz2) ;;
*.tgz) tar xvzf $1 && cd $(basename "$1" .tgz) ;;
*.zip) unzip $1 && cd $(basename "$1" .zip) ;;
*.Z) uncompress $1 && cd $(basename "$1" .Z) ;;
*.7z) 7z x $1 && cd $(basename "$1" .7z) ;;
*) echo "don't know how to extract '$1'..." ;;
esac
else
echo "'$1' is not a valid file!"
fi
}

#EXECUTABLE PERMISSION
ex() {
chmod +x $1 && sh "$1"
}

#RECORD
rec() {
arecord -f S16_LE -c1 -r 48000 -t wav -D hw:2,0 $1.wav
}

#FONT
conv() {
bdftopcf -o $1.pcf $1.bdf
}

#LOG
logsee() {
tail -n 30 -f $1 | ccze -A
}

#ALIASES
#CONSOLE
alias c='clear'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias la='ls -oAhF --group-directories-first'
alias lar='ls -oAhF --group-directories-first | grep -i'
alias ld='ls -d */'
alias ll='ls -ACp --group-directories-first'
alias lr='ls -AhF | grep -i $1'

#SYSTEM
alias sx='startx'



alias am='alsamixer'
alias pi='ping -c6 www.google.fr'
alias pl='ping -c6 192.168.1.1'
alias iw='iwconfig'

#PACKAGES





alias pacor='pacman-color -Qm'
alias pacf='pacman-color -Ss'
alias paq='pacman -Q | grep -i $1'
alias paqi='pacman-color -Qi'
alias paco='pacman-color -Qo'	#Fichier appartient paquet
alias mefi='makepkg -efi --noconfirm'
alias pacex='pacman-color -Qte'	#Paquet installés explicitement
#--------------------------------
alias aurup='package-query -AQm'
alias aurf='package-query -As --sort w'

#SOFTWARES
alias fox='firefox'
alias mp='mocp'
alias sen='sensors'
alias senw='watch -n15 sensors'
alias nvt='nvidia-smi -q -d TEMPERATURE'

alias feh='feh -q -d -g 1365x768'
alias mou='mumble'
alias ra='ranger'
alias tex='geany'

alias dif='colordiff -u'
alias wg='wget'
alias upt='uptime'
alias pdf='epdfview'
alias trk='mocp -Q %title >> ~/OUT.out 2> /dev/null'
alias xev='xev | grep -i keysym'
alias drco='eval $(dircolors -b ~/.dir_colors)'
alias mpl="mplayer -softvol -softvol-max 1000"
#LOGS
alias logd='tail -f ~/.dwmlog | ccze -A'
alias logx='tail -n 30 -f /var/log/Xorg.0.log | ccze -A'
alias loger='tail -n 30 -f /var/log/errors.log | ccze -A'

#DIRECTORIES
alias h='cd'
alias hc='cd && clear'
alias dwd='cd ~/Builds/dwm-6.0'
#alias mons='cd ~/Builds/monsterwm'
alias zik='cd ~/Musique'
alias tel='cd ~/Téléchargements'
alias doc='cd ~/Documents'
alias pic='cd ~/Images'
alias usb='cd /media/USB1'
alias sto='cd /mnt/storage'
alias sec='cd ~/Securite'
alias sq='cd ~/Securite/Sql'

#MOUNT
alias exta='mount /media/USB1'
alias extb='mount /media/USB2'
alias extaum='umount /media/USB1'

#SCREEN AND TOOLS
alias st='scrot -t 10'
alias st3='scrot -cd 3 -t 7'
alias st6='scrot -cd 6 -t 7'
alias see='screenfetch -D "Archlinux"'

#GAMES
alias hon='hon-x86_64'
alias doom='prboom-plus -complevel 3 -iwad doom.wad'
alias doom2='prboom-plus -complevel 2 -iwad doom2.wad'
alias doomp='prboom-plus -complevel 4 -iwad plutonia.wad'
alias doomp2='prboom-plus -complevel 4 -iwad plutonia.wad -file PL2.WAD -deh PL2.DEH'
alias doomt='prboom-plus -complevel 4 -iwad tnt.wad'
alias doomav='prboom-plus -complevel 2 -file AV.WAD -deh AV.DEH'

#MISC

PERL_MB_OPT="--install_base \"/home/crowd42/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/crowd42/perl5"; export PERL_MM_OPT;

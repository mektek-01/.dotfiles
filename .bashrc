######################################################################
#
#
#           ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗
#           ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝
#           ██████╔╝███████║███████╗███████║██████╔╝██║     
#           ██╔══██╗██╔══██║╚════██║██╔══██║██╔══██╗██║     
#           ██████╔╝██║  ██║███████║██║  ██║██║  ██║╚██████╗
#           ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
#
#
######################################################################



# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Date and time to history
HISTTIMEFORMAT="%F %T "
#Ignore duplicate commands in history
HISTCONTROL=ignoredups

HISTSIZE=2000
HISTFILESIZE=2000

#Color
blk='\[\033[01;30m\]'   # Black
red='\[\033[01;31m\]'   # Red
grn='\[\033[01;32m\]'   # Green
ylw='\[\033[01;33m\]'   # Yellow
blu='\[\033[01;34m\]'   # Blue
pur='\[\033[01;35m\]'   # Purple
cyn='\[\033[01;36m\]'   # Cyan
wht='\[\033[01;37m\]'   # White
clr='\[\033[00m\]'      # Reset

#VIM keys
#set -o vi



alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
alias update='paru -Syu'
alias install='sudo pacman -S'

# View the calender by typing the first three letters of the month.
alias jan='cal -m 01'
alias feb='cal -m 02'
alias mar='cal -m 03'
alias apr='cal -m 04'
alias may='cal -m 05'
alias jun='cal -m 06'
alias jul='cal -m 07'
alias aug='cal -m 08'
alias sep='cal -m 09'
alias oct='cal -m 10'
alias nov='cal -m 11'
alias dec='cal -m 12'


# Display the current Git branch in the Bash prompt.
function git_branch() {
    if [ -d .git ] ; then
        printf "%s" "($(git branch 2> /dev/null | awk '/\*/{print $2}'))";
    fi
}

# Set the prompt.

function bash_prompt(){
    PS1='${debian_chroot:+($debian_chroot)}'${blu}'$(git_branch)'${pur}' \W'${grn}' \$ '${clr}
}

bash_prompt


#Search history for specific commands
function hg() {
    history | grep "$1";
}



#function weather() {
#
#    local response=$(curl --silent 'https://api.openweathermap.org/data/2.5/weather?id=5128581&units=imperial&appid=<YOUR_API_KEY>') 
#
#    local status=$(echo $response | jq -r '.cod')
#
#    # Check for the 200 response indicating a successful API query.
#    case $status in
#
#        200) printf "Location: %s %s\n" "$(echo $response | jq '.name') $(echo $response | jq '.sys.country')"  
#             printf "Forecast: %s\n" "$(echo $response | jq '.weather[].description')" 
#             printf "Temperature: %.1f°F\n" "$(echo $response | jq '.main.temp')" 
#             printf "Temp Min: %.1f°F\n" "$(echo $response | jq '.main.temp_min')" 
#             printf "Temp Max: %.1f°F\n" "$(echo $response | jq '.main.temp_max')" 
#            ;;
#        401) echo "401 error"
#            ;;
#        *) echo "error"
#            ;;
#
#    esac
#
#}




eval "$(starship init bash)"

fastfetch

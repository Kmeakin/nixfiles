# Options
opts=(
    # prevent zsh from overwriting old history
    APPEND_HISTORY

    # append history in real-time, rather than when shell exits
    INC_APPEND_HISTORY

    # share history between different instances of zsh in real-time
    SHARE_HISTORY

    # don't write to history if the command is identical to the previous command. Does nothing when duplicate lines are not adjacent
    HIST_IGNORE_DUPS

    # don't write any duplicates at all
    HIST_IGNORE_ALL_DUPS

    # remove excess whitespace from history
    HIST_REDUCE_BLANKS

    # don't store lines that begin with a space. This allows you to enter commands that you don't want to be saved in history
    HIST_IGNORE_SPACE

    # prompt for confirmation when deleting with a *
    # e.g. rm *>o will delete everything in the dir, and write the output to o,
    # when what you meant to do was rm *.o
    NO_RM_STAR_SILENT

    # check if incorrect command can be corrected to an existing command
    # e.g. correct 'car file' to 'cat file'
    CORRECT

    # try to correct spelling of arguments in a line
    CORRECT_ALL
)
setopt $opts

# Line editor
# Use vim keybindings!
bindkey -v
bindkey -M viins '^E' end-of-line
bindkey -M viins '^A' beginning-of-line

# https://www.reddit.com/r/zsh/comments/95y1fz/bindkey_a_command_without_making_a_widget/
# bind Ctrl+H to 'cd ..' (similar to helm-find-file in emacs)
bindkey -s "^H" "^Q cd ..^J"

# Prompt
autoload -Uz promptinit
promptinit

# allows expansion of variables in prompt
# e.g. PS1='${PWD}%'
# without this set, you can only use percent escapes
# e.g. PS1='%m%#'
setopt PROMPT_SUBST

PS1='$(f_user) $(f_colored_path) $(f_arrow)'

function shortened_path() {
    local my_path="$1"
    # path must be more than 10 chars long and have more than 4 dirs in it
    path_length="${#my_path}"
    num_dirs=$(echo "$my_path" | tr -cd '/' | wc -c)
    if [[ $path_length -gt 10 && $num_dirs -gt 4 ]]; then
        first_two_dirs=$(echo "$my_path" | cut -d '/' -f 1,2,3)
        last_two_dirs=$(echo "$my_path" | rev | cut -d '/' -f 1,2 | rev)
        echo "${first_two_dirs}/.../${last_two_dirs}"
    else
        echo "$my_path"
    fi
}

# %~ = current directory, with $HOME and named directories shortened
function f_colored_path() {
    local slash="%F{blue}/%f"
    local tilde="%F{blue}~%f"
    local the_path=${PWD/#$HOME/$tilde}
    the_path=$(shortened_path $the_path)
    local colored_path="${the_path//\//$slash}"
    echo ${colored_path}
}

function f_user() {
    # Use a red uppercase lambda (Λ) if running as root,
    # else a blue lowercase lambda (λ)
    local lambda="λ"
    local uppercase_lambda="Λ"
    if [[ "EUID" -eq 0 ]]; then
        echo "%F{red}$uppercase_lambda%f"
    else
        echo "%F{cyan}$lambda%f"
    fi
}

function f_arrow() {
    local arrow="%(?.%F{green}~>%f.%F{red}~>%f)"
    echo "$arrow"
}

# Completion
# Mostly shamelessly stolen from grml-zsh
autoload -Uz compinit
compinit

# complete command line switches for aliases
setopt NO_COMPLETE_ALIASES

# allow one error for every three characters typed in approximate completer
zstyle ':completion:*:approximate:'    max-errors 'reply=( $((($#PREFIX+$#SUFFIX)/3 )) numeric )'

# don't complete backup files as executables
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '(aptitude-*|*\~)'

# start menu completion only if it could find no unambiguous initial string
zstyle ':completion:*:correct:*'       insert-unambiguous true
zstyle ':completion:*:corrections'     format $'%{\e[0;31m%}%d (errors: %e)%{\e[0m%}'
zstyle ':completion:*:correct:*'       original true

# activate color-completion
zstyle ':completion:*:default'         list-colors ${(s.:.)LS_COLORS}

# format on completion
zstyle ':completion:*:descriptions'    format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'

# match uppercase from lowercase
zstyle ':completion:*'                 matcher-list 'm:{a-z}={A-Z}'

# separate matches into groups
zstyle ':completion:*:matches'         group 'yes'
zstyle ':completion:*'                 group-name ''

# activate menu
zstyle ':completion:*' menu yes select

# ignore duplicate entries
zstyle ':completion:*:history-words'   remove-all-dups yes
zstyle ':completion:*:history-words'   stop yes

zstyle ':completion:*:messages'        format '%d'
zstyle ':completion:*:options'         auto-description '%d'

# describe options in full
zstyle ':completion:*:options'         description 'yes'

# on processes completion complete all user processes
zstyle ':completion:*:processes'       command 'ps -au$USER'

# Provide more processes in completion of programs like killall:
zstyle ':completion:*:processes-names' command 'ps c -u ${USER} -o command | uniq'

# Ignore completion functions for commands you don't have:
zstyle ':completion::(^approximate*):*:functions' ignored-patterns '_*'

# complete manual by their section
zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select

# Better SSH/Rsync/SCP Autocomplete
zstyle ':completion:*:(scp|rsync):*' tag-order ' hosts:-ipaddr:ip\ address hosts:-host:host files'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'

# Cache completions
zstyle ':completion:*' use-cache  yes
zstyle ':completion:*:complete:*' cache-path "${XDG_CACHE_HOME}/zsh/"


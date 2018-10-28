#!/usr/bin/env zsh

# Colours
eval col_grey='$FG[240]'
eval col_orange='$FG[202]'
eval col_yellow='$FG[190]'
eval col_blue='$FG[110]'
eval col_gold='$FG[100]'

eval col_main='$FG[110]'
eval col_secondary='$FG[100]'

# Define prompts
local user_host='[%n@%m]'
local current_dir='%{$terminfo[bold]${col_main}%}%~%{$reset_color%}'

PROMPT="%(?.${col_main}.%F{red})❯%f " # Display a red prompt char on failure
RPROMPT='${time} %{${col_grey}%}${user_host}%{$reset_color%}'


# Output additional information about paths, repos and user
precmd() {
    print -P "\n${current_dir}  %{${col_secondary}%}$(git_prompt_info)%{$reset_color%}$(git_prompt_status)%{$reset_color%}$(git_prompt_ahead)"
}

# Local time, color coded by last return code
time_enabled="%(?.%{${col_grey}%}.%{$fg[red]%})%*%{$reset_color%}"
time_disabled="%{${col_grey}%}%*%{$reset_color%}"
time=$time_enabled

# GIT status
ZSH_THEME_GIT_PROMPT_PREFIX=" ☁  "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} ☂"
#ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ☀"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ⚡"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ♒"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[blue]%} 𝝙"

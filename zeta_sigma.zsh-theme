# Display information about:
# - user
# - host
# - current path (the last 3 directories)
# - time (24 hour clock in HH:MM format)
# - day of the week
# - date (DD/MM/YY format)
# - git info
# - Python Virtualenv

function echo_right_prompt() {
  right_prompt="$(virtualenv_prompt_info)$(oh_my_git_info)"
  if [[ -z ${right_prompt} ]]; then
    right_prompt="%(?,%{$fg[green]%},%{$fg[red]%})[%D{%I:%M %a %d/%m/%y}]%{$reset_color%}"
  fi
  echo $right_prompt
}

current_directory=${0:a:h}

# ZSH_THEME_GIT_COLORS["current_branch"]="%{$fg_bold[yellow]%}"

# ZLE_RPROMPT_INDENT=0

ZSH_THEME_VIRTUALENV_PREFIX="%{\e[1;33m%} %{\e[0m%}%{\e[1;31m%}["
ZSH_THEME_VIRTUALENV_SUFFIX="]%{\e[0m%}"
# $'%{\e[1;33m%}@%{\e[0m%}'\
# $'%{\e[1;35m%}%m%{\e[0m%}'\
PROMPT=$'%{\e[1;33m%} %{\e[0m%}'\
$'%{\e[0;36m%}%n%{\e[0m%}'\
$'%{\e[1;33m%}:%{\e[0m%}'\
$'%{\e[1;31m%}[%{\e[0m%}'\
$'%{\e[2;31m%}$(python ${current_directory}/trim_cwd.py 2)%{\e[0m%}'\
$'%{\e[1;31m%}]%{\e[0m%}\n'\
$'%(?,%{\e[2;32m%}│%{\e[1;34m%}𝒁%{\e[2;32m%}├──▶,%{\e[2;31m%}│%{\e[1;34m%}𝒁%{\e[2;31m%}├──▶)%{\e[0m%} '

# RPROMPT='$(completed_callback)'
RPROMPT='$(echo_right_prompt)'
# RPROMPT='$(virtualenv_prompt_info)$(oh_my_git_info)'
# RPROMPT=$'%(?,%{$fg[green]%},%{$fg[red]%})[%D{%I:%M %a %d/%m/%y}]%{$reset_color%}'

PS2=$'%(?,%{\e[2;32m%}│%{\e[1;34m%}𝒁%{\e[2;32m%}│..:,%{\e[2;31m%}│%{\e[1;34m%}𝒁%{\e[2;31m%}│..:)%{\e[0m%} '


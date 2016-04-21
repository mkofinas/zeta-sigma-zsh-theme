# Display information about:
# - User
# - Host (Inactive)
# - Current Path (the last 3 directories)
# - Time (24 hour clock in HH:MM format) (Inactive)
# - Day of the Week (Inactive)
# - Date (DD/MM/YY format) (Inactive)
# - Git Info (https://github.com/mkofinas/oh-my-zsh-git)
# - Python Virtualenv (https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/virtualenv/virtualenv.plugin.zsh)

################################################################################
#                               Helper Variables                               #
################################################################################

current_directory=${0:a:h}

# ZLE_RPROMPT_INDENT=0

# NORMAL_MODE_INDICATOR="%{$fg[red]%}[ NORMAL]%{$reset_color%}"
# INSERT_MODE_INDICATOR="%{$fg[green]%}[ INSERT]%{$reset_color%}"

################################################################################
#                               Helper Functions                               #
################################################################################

# Right Prompt
function echo_right_prompt() {

  function right_prompt_datetime() {
    echo "%(?,%{$fg[green]%},%{$fg[red]%})[%D{%I:%M %a %d/%m/%y}]%{$fg_no_bold[default]%}"
  }

  ZSH_THEME_VIRTUALENV_PREFIX="%{$fg_bold[yellow]%} %{$fg_bold[red]%}["
  ZSH_THEME_VIRTUALENV_SUFFIX="]%{$fg_no_bold[default]%}"

  # ZSH_THEME_GIT_COLORS["current_branch"]="%{$fg_bold[yellow]%}"

  right_prompt="$(virtualenv_prompt_info)$(oh_my_git_info)"
  echo "${right_prompt}"
}

# Left Prompt
function echo_left_prompt() {

  function left_prompt_user_info() {
    echo "%{$fg_bold[yellow]%} %{$fg_no_bold[cyan]%}%n%{$fg_bold[yellow]%}:"
  }

  function left_prompt_directory() {
    echo "%{$fg_bold[red]%}[%{$fg_no_bold[red]%}$(python ${current_directory}/trim_cwd.py 2)%{$fg_bold[red]%}]%{$fg_no_bold[default]%}"
  }

  function left_prompt_zsh_prompt() {
    echo "%(?,%{$fg_no_bold[green]%},%{$fg_no_bold[red]%})│%{$fg_bold[blue]%}𝒁%(?,%{$fg_no_bold[green]%},%{$fg_no_bold[red]%})├──▶%{$fg_no_bold[default]%} "
  }

  left_prompt="$(left_prompt_user_info)$(left_prompt_directory)\n$(left_prompt_zsh_prompt)"
  echo "${left_prompt}"
}

# Left Continuation Prompt
function echo_left_continuation_prompt() {

  function left_continuation_prompt_zsh_prompt() {
    echo "%(?,%{$fg_no_bold[green]%},%{$fg_no_bold[red]%})│%{$fg_bold[blue]%}𝒁%(?,%{$fg_no_bold[green]%},%{$fg_no_bold[red]%})│..:%{$fg_no_bold[default]%} "
  }
  left_continuation_prompt="$(left_continuation_prompt_zsh_prompt)"
  echo "${left_continuation_prompt}"
}

################################################################################
#                                   Prompts                                    #
################################################################################

PROMPT='$(echo_left_prompt)'

RPROMPT='$(echo_right_prompt)'

PS2='$(echo_left_continuation_prompt)'

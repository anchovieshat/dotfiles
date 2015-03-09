#function git_prompt_info {
#  local ref=$(=git symbolic-ref HEAD 2> /dev/null)
#  local gitst="$(=git status 2> /dev/null)"
#  local pairname=${${${GIT_AUTHOR_EMAIL#pair+}%@github.com}//+/\/}
#  if [[ ${pairname} == 'ch' || ${pairname} == '' ]]; then
#pairname=''
#  else
#pairname=" ($pairname)"
#  fi
#
#if [[ -f .git/MERGE_HEAD ]]; then
#if [[ ${gitst} =~ "unmerged" ]]; then
#gitstatus=" %{$fg[red]%}unmerged%{$reset_color%}"
#    else
#gitstatus=" %{$fg[green]%}merged%{$reset_color%}"
#    fi
#elif [[ ${gitst} =~ "Changes to be committed" ]]; then
#gitstatus=" %{$fg[blue]%}!%{$reset_color%}"
#  elif [[ ${gitst} =~ "use \"git add" ]]; then
#gitstatus=" %{$fg[red]%}!%{$reset_color%}"
#  elif [[ -n `git checkout HEAD 2> /dev/null | grep ahead` ]]; then
#gitstatus=" %{$fg[yellow]%}*%{$reset_color%}"
#  else
#gitstatus=''
#  fi
#
#if [[ -n $ref ]]; then
#echo "%{$fg_bold[green]%}/${ref#refs/heads/}%{$reset_color%}$gitstatus$pairname"
#  fi
#}

#PROMPT='%~%<< $(git_prompt_info)${PR_BOLD_WHITE}>%{${reset_color}%} '
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' actionformats '%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{5}[%F{2}%b%F{5}]%f '
precmd() {
	vcs_info
	omz_termsupport_precmd $@
}
preexec() {
	omz_termsupport_preexec $@
}
PROMPT='${PR_BLUE}%n${PR_WHITE}@${PR_MAGENTA}%m%{${reset_color}%} %~ ${vcs_info_msg_0_}$ '

function title {
  [[ "$EMACS" == *term* ]] && return

  # if $2 is unset use $1 as default
  # if it is set and empty, leave it as is
  : ${2=$1}

  if [[ "$TERM" == screen* ]]; then
    print -Pn "\ek$1:q\e\\" #set screen hardstatus, usually truncated at 20 chars
  elif [[ "$TERM" == xterm* ]] || [[ "$TERM" == rxvt* ]] || [[ "$TERM" == ansi ]] || [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
    print -Pn "\e]2;$2:q\a" #set window name
    print -Pn "\e]1;$1:q\a" #set icon (=tab) name
  fi
}

ZSH_THEME_TERM_TAB_TITLE_IDLE="%15<..<%~%<<" #15 char left truncated PWD
ZSH_THEME_TERM_TITLE_IDLE="%n@%m: %~"

# Runs before showing the prompt
function omz_termsupport_precmd {
  if [[ $DISABLE_AUTO_TITLE == true ]]; then
    return
  fi

  title $ZSH_THEME_TERM_TAB_TITLE_IDLE $ZSH_THEME_TERM_TITLE_IDLE
}

# Runs before executing the command
function omz_termsupport_preexec {
  if [[ $DISABLE_AUTO_TITLE == true ]]; then
    return
  fi

  emulate -L zsh
  setopt extended_glob

  # cmd name only, or if this is sudo or ssh, the next cmd
  local CMD=${1[(wr)^(*=*|sudo|ssh|rake|-*)]:gs/%/%%}
  local LINE="${2:gs/%/%%}"

  title '$CMD' '%100>...>$LINE%<<'
}

autoload -U colors && colors
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Customized git status
git_custom_status() {
  local cb=$(current_branch)
  if [ -n "$cb" ]; then
    echo "[$(current_branch)$(parse_git_dirty)]"
  fi
}

PROMPT='%2~ $(git_custom_status)$%b '

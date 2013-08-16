# Determine arguments for ls colours
if [[ -x "`whence -p dircolors`" ]]; then
  alias ls='ls --color=auto'
else
  alias ls='ls -G'
fi

alias v='vim'

alias x='exit'

alias be='bundle exec'

alias vmtime='sudo /etc/init.d/networking restart && sudo /etc/init.d/ntp restart'

alias pgen='openssl rand -hex'

# Git aliases
alias g='git'

alias gp='git push origin $(current_branch)'

alias gd='git fetch && git rebase origin/$(current_branch)'

alias ga='git add -p'

alias gc='git ci'

alias gs='git st -sb'

alias gl='git l'
alias gr='git r'

alias retag='ctags -R --exclude=.git --exclude=log --exclude=tmp *'

alias rr='rake routes'

alias fs='grep -RL --exclude turnip_helper.rb --exclude spec_helper.rb --exclude-dir spec/acceptance --exclude-dir spec/support --exclude-dir spec/steps "spec_helper" spec | xargs rspec'

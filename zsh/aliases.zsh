# colourful ls
alias ls='ls -G'

alias v='vim'

alias x='exit'

alias be='bundle exec'

alias vmtime='sudo /etc/init.d/networking restart && sudo /etc/init.d/ntp restart'

alias pdata='be rake db:reset db:production:data_light db:production:load_data db:migrate db:test:prepare'

# Git aliases
alias g='git'

alias ggpush='git push origin $(current_branch)'

alias gup='git fetch && git rebase'

alias ggup='git fetch && git rebase origin/$(current_branch)'

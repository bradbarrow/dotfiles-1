export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

# Heroku toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$HOME/Library/Haskell/bin:$PATH"

export PATH="$HOME/.bin:$PATH"

export GREP_OPTIONS="--color"

export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

# chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby ruby-2.1.0-preview1

# ruby
export RUBY_GC_MALLOC_LIMIT=90000000
export RUBY_FREE_MIN=200000

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

###
# Path
###

# Local scripts
set PATH $HOME/bin $PATH

# Homebrew
# set PATH /usr/local/bin /usr/local/sbin $PATH

# Go
# set PATH /usr/local/go/bin $PATH
# set -x GOPATH /usr/local/go

# Composer
# set PATH $HOME/.composer/vendor/bin $PATH

# Done
set -x PATH $PATH

###
# rbenv
# https://github.com/rbenv/rbenv
###

status --is-interactive; and . (rbenv init -|psub)

###
# Fuck
# https://github.com/nvbn/thefuck
###

eval (thefuck --alias | tr '\n' ';')

###
# Theme (bobthefish)
# https://github.com/oh-my-fish/theme-bobthefish
###

set -g theme_display_ruby no
set -g theme_nerd_fonts yes

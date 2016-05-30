###
# Path
###

# Local scripts
set PATH $HOME/bin $PATH

# Homebrew
set PATH /usr/local/bin /usr/local/sbin $PATH

# Go
# set PATH /usr/local/opt/go/libexec/bin $PATH

# Composer
# set PATH $HOME/.composer/vendor/bin $PATH

# Android SDK
# set PATH $HOME/Documents/android-sdk-macosx/platform-tools $PATH
# set PATH $HOME/Documents/android-sdk-macosx/tools $PATH

# Done
set -x PATH $PATH

###
# rbenv
# https://github.com/rbenv/rbenv
###

status --is-interactive; and . (rbenv init -|psub)

###
# Theme
# https://github.com/oh-my-fish/theme-bobthefish
###

set -g theme_display_ruby no
set -g theme_nerd_fonts yes

###
# Fuck
# https://github.com/nvbn/thefuck
###

eval (thefuck --alias | tr '\n' ';')

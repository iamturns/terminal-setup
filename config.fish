###
# Path
###

# Local scripts
set PATH $HOME/bin $PATH

# Homebrew
# set PATH /usr/local/bin /usr/local/sbin $PATH

# Go
# set PATH /usr/local/opt/go/libexec/bin $PATH
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

thefuck --alias | source

###
# nvm
###

nvm use default

function __check_nvm --on-variable PWD --description 'Detect node version'
  if test -f .nvmrc
    set node_version (nvm version)
    set nvmrc_node_version (nvm version (cat .nvmrc))

    if [ $nvmrc_node_version = "N/A" ]
      nvm install
    else if [ $nvmrc_node_version != $node_version ]
      nvm use
    end

    set -gx X_NVM_DIRTY_FLAG 1
  else if set -q X_NVM_DIRTY_FLAG; and [ (node --version) != (nvm version default) ]
    nvm use default
    set -e X_NVM_DIRTY_FLAG
  end
end

__check_nvm

###
# Theme (bobthefish)
# https://github.com/oh-my-fish/theme-bobthefish
###

set -g theme_display_ruby no
set -g theme_nerd_fonts yes

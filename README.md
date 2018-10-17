Terminal setup
==============

- [iTerm](http://iterm2.com/)
- [Fish shell](https://fishshell.com/)
- [bobthefish](https://github.com/oh-my-fish/theme-bobthefish): theme with git status, timestamps, abbreviated path, flags, and more
- [desk](https://github.com/jamesob/desk): allows saving custom commands for various workspaces
- [fkill](https://github.com/sindresorhus/fkill-cli): fabulously kill processes 
- [git-extras](https://github.com/tj/git-extras): additional git commands
- [git-standup](https://github.com/kamranahmedse/git-standup): recall what you did on the last working day
- [gitflow-avh](https://github.com/petervanderdoes/gitflow-avh): gitflow branching model
- [httpstat](https://github.com/reorx/httpstat): visualizes curl stats
- [rbenv](https://github.com/rbenv/rbenv)
- [tab](https://github.com/oh-my-fish/plugin-tab): control tabs from command line
- [thefuck](https://github.com/nvbn/thefuck): correct previous command
- [tldr](https://github.com/tldr-pages/tldr): simplified man pages
- [z](https://github.com/fisherman/z): jump around directories by frecency

Requirements
------------

- Homebrew
- Node

See [Machine Hello](https://github.com/iamturns/til/blob/master/misc/mac/machine-hello.md) for installation.

Nerd font
---------

[Nerd fonts](https://nerdfonts.com/) are fonts patched with additional nerdy glyphs. I like the 'Hack' font.

iTerm
-----

[Download here](http://iterm2.com)

- Preferences
    - Appearance
        - Theme: Dark (High contrast)
    - Profiles
        - Text > Font > Select nerd font
    - Keys
        - Hotkeys > Tick: Show/hide iTerm2 with a system-wide hotkey
            - Set to All + \
        - Key Mappings > Add two new items;
            - Cmd + Right = Next pane
            - Cmd + Left = Previous pane

### Color scheme

Many are available within [this collection](http://iterm2colorschemes.com/).

My favourite: 'Solarized dark high contrast'

- Fetch them locally: `git clone git@github.com:mbadolato/iTerm2-Color-Schemes.git /var/www/vendor/iTerm2-Color-Schemes`
- iTerm > Preferences > Profiles > Colors > Color Presets > Import
- Select from `/var/www/vendor/iTerm2-Color-Schemes/schemes`
- Select from dropdown after import

Fish
----

Install;

    brew install fish

Tell system about new shell;

    echo "/usr/local/bin/fish" | sudo tee -a /etc/shells

Set fish as default shell;

    chsh -s /usr/local/bin/fish

Now restart iTerm. Welcome to fish shell!

Setup
-----

```bash
### Directories ###

mkdir ~/bin/

### Fish config ###

curl -o ~/.config/fish/config.fish https://raw.githubusercontent.com/iamturns/terminal-setup/master/config.fish

### Fisher ###

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

### Goodies ###

brew install git-extras
brew install git-flow-avh
fisher add oh-my-fish/plugin-git-flow
brew install httpstat
brew install thefuck
brew install desk ;and desk init
npm install -g fkill-cli
npm install -g git-standup
npm install -g tldr
fisher add edc/bass
fisher add oh-my-fish/plugin-tab
fisher add oh-my-fish/theme-bobthefish
fisher add jethrokuan/z
```

NVM
---

*Optional*

Fish it not supported by NVM, but is easy to fix.

Create an NVM function in `~/.config/fish/functions/nvm.fish`

```
function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end
```

All done!
---------

Prepare yourself and restart iTerm :)



Usage & cheatsheet
==================

desk
----

### Create / edit

```
desk edit {{name}}
```

File contents example;

```
# Description: Example description here.

example command to run on 'desk go' 1
example command to run on 'desk go' 2

# Example description for task below.
function say_hello
    echo Hello $argv
end
```

### Usage

```
desk ls
desk go {{name}}
desk
say_hello test
```

fkill
-----

Easily kill tasks, see `fkill --help`

git extras
----------

See [full command list](https://github.com/tj/git-extras/blob/master/Commands.md).

git standup
-----------

Simple: `git standup`

git flow
--------

### Init

And accept all defaults;

```
git flow init -d
```

### Start feature

```
git flow feature start {{name}}
```

### Sync feature

```
git checkout develop
git pull
git rebase develop feature/{{name}}
```

### Finish feature

- Sync as above
- Tweak and tidy git history

```
git flow feature finish --no-ff {{name}}
git checkout develop
git push
```

### More

```
git flow release start {{version}}
git flow release finish {{version}}
git flow hotfix start {{version}}
git flow hotfix finish {{version}}
```

tab
---

Open current directory in new tab;

```
tab
```

More;

```
tab [dir]
tab [cmd]
tab [dir] [cmd]
tab [-s|--split]
```

thefuck
-------

Type `fuck` after you've made a typo.

tldr
----

Simplified man pages;

```
tldr [cmd]
```

z
-

Jump around directories by frecency.

```
z [search]
z [search] [search2...]
z [-l|--list]
```

Custom functions
================

I prefix all my custom functions with `z-`, and have a private git repository which syncs all `z-*` functions when I run `z-fish-functions-sync`

First time setup
----------------

Setup an empty git repository online, then;

```bash
cd ~/.config/fish/functions/
git init
git remote add origin [new-git-repo-path]

echo "
*
!z-*
" > .gitignore

echo "
function z-fish-functions-sync
  cd ~/.config/fish/functions/
  git add -A
  git commit -m "Sync"
  git pull --rebase
  git push
end
" > z-fish-functions-sync.fish

git add -A
git commit -m "First commit"
git push -u origin master
```


Setup on new machine
--------------------

```bash
mv ~/.config/fish/functions ~/.config/fish/functions_bak
mkdir ~/.config/fish/functions
git clone git@bitbucket.org:iamturns/fish-functions.git ~/.config/fish/functions
mv ~/.config/fish/functions_bak/* ~/.config/fish/functions
rmdir ~/.config/fish/functions_bak
```

Usage
-----

Create function prefixed with `z-`, eg: `~/.config/fish/functions/z-test.fish`:

```
function z-test
	echo "It works!"
end
```

Sync with git repo using: `z-fish-functions-sync`

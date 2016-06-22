Fish config
===========

My config and setup for [Fish shell](https://fishshell.com/).

Includes
--------

- [bobthefish](https://github.com/oh-my-fish/theme-bobthefish): theme with git status, timestamps, abbreviated path, flags, and more. 
- [desk](https://github.com/jamesob/desk): allows saving custom commands for various workspaces.
- [git-extras](https://github.com/tj/git-extras): additional git commands.
- [gitflow-avh](https://github.com/petervanderdoes/gitflow-avh): gitflow branching model.
- [rbenv](https://github.com/rbenv/rbenv)
- [tab](https://github.com/oh-my-fish/plugin-tab): control tabs from command line.
- [thefuck](https://github.com/nvbn/thefuck): correct previous command.
- [tldr](https://github.com/tldr-pages/tldr): simplified man pages.
- [z](https://github.com/fisherman/z): jump around directories by frecency.



Requirements
============

- [Homebrew](http://brew.sh/)
- Nerd font (see below)

Nerd font
---------

[Nerd fonts](https://github.com/ryanoasis/nerd-fonts) are fonts patched with additional nerdy glyphs.

I like ['Hack' font](https://github.com/chrissimpkins/Hack), which is patched as ['Knack Nerd Font'](https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Knack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf).

Download Regular > Complete > Mono version.



Let's do this!
==============

- Install [iTerm](https://iterm2.com/)
- iTerm Preferences > Profiles > Text > Font > Select nerd font
    - Make sure to set the same font to both Regular and Non-ASCII.

Fish
----

Install;

    brew install fish

Tell system about new shell;

    echo "/usr/local/bin/fish" | sudo tee -a /etc/shells

Set fish as default shell;

    chsh -s /usr/local/bin/fish

Now restart iTerm. Welcome to fish shell!

Commands
--------

```bash
### Directories ###

mkdir ~/.config/fish/completions
mkdir ~/bin/

### Fish config ###

curl -o ~/.config/fish/config.fish https://raw.githubusercontent.com/turnbullm/fish-config/master/config.fish

### Fisherman ###

curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman

### Shell goodies ###

brew install git-extras
brew install git-flow-avh
brew install thefuck
npm install -g tldr

## Desk ##

brew install desk
desk init

# Accept defaults


# Look for fish completions installation directory and adjust below accordingly;

cp /usr/local/share/fish/vendor_completions.d/desk.fish ~/.config/fish/completions/desk.fish

### Fish goodies ###

fisher omf/git-flow
fisher omf/tab
fisher omf/theme-bobthefish
fisher z
```

All done! Prepare yourself and restart iTerm :)



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

git extras
----------

See [full command list](https://github.com/tj/git-extras/blob/master/Commands.md).

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

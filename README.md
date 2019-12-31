---

title: dotfiles
description: My dotfiles
author: Ryan Crosby
tags: terminal
created: 2012 Feb 19
modified: 2019 Dec 30
---# dotfiles

## My dotfiles

These are my dotfiles, I gained much inspiration from
[Michael Smalley](http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/)
. They are a work in progress, as I am only adding what I understand. There are many dotfile repos out
there, but for the most part are filled with adjustments that I never realize. So I am making my own
adding only the customizations I want and/or understand.

Also took some inspiration from https://github.com/losingkeys/dotfiles for the shell-helpers directory.

ZSH configuration was inspired by http://zanshin.net/2013/02/02/zsh-configuration-from-the-ground-up/.

Dotfile Installation: [dotbot](https://github.com/anishathalye/dotbot/)

### Prompt

- http://aperiodic.net/phil/prompt/
- http://superuser.com/questions/382503/how-can-i-put-a-newline-in-my-zsh-prompt-without-causing-terminal-redraw-issues
- http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/#current-directory

VIM is mamanged through vundle.

Additionally this has grown into including all machine configuration I use for my development machine. Some usefule
utilities I use:

- [Quick Look Plugins](https://github.com/sindresorhus/quick-look-plugins)

I reference [Awesome Lists](https://github.com/sindresorhus/awesome) often to find new useful utilities, apps, scripts,
etc.....

## Using

- Install powerline fonts (https://github.com/powerline/fonts)

- Open terminal and run `./install`

- Install [homebrew](https://brew.sh/)

- Fix zsh compinit warnings
  \*\* https://stackoverflow.com/a/43544733 - compaudit | xargs chmod g-w

- Run `brew bundle` to install default apps

- Install nvm https://github.com/creationix/nvm

- Edit gitconfig of dotfiles repo and set author to email, https://dereenigne.org/git/set-git-email-address-on-a-per-repository-basis/

Open iTerm, and change theme to Solarized Dark, and use Source Code Pro font

## Updating

- `> git submodule update --remote dotbot`

## Other Changes

- [Terminal Themes](https://github.com/lysyi3m/osx-terminal-themes)
- Xcode 9 Themes
  - [Solarized Light](https://github.com/nelsyeung/Solarized-Light-for-Xcode)
  - [Solarized Dark](https://github.com/ArtSabintsev/Solarized-Dark-for-Xcode)

## Other Notes

OS X has a utility to help with the PATH environment variable, https://stackoverflow.com/questions/9832770/where-is-the-default-terminal-path-located-on-mac

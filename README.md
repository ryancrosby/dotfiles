---
title: dotfiles
description: My dotfiles
author: Ryan Crosby
tags: terminal
created: 2012 Feb 19
modified: 2011 Apr 16

---

dotfiles
========

## My dotfiles

These are my dotfiles, I gained much inspiration from 
[Michael Smalley](http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/)
. They are a work in progress, as I am only adding what I understand. There are many dotfile repos out
there, but for the most part are filled with adjustments that I never realize. So I am making my own
adding only the customizations I want and/or understand.

Also took some inspiration from https://github.com/losingkeys/dotfiles for the shell-helpers directory.

ZSH configuration was inspired by http://zanshin.net/2013/02/02/zsh-configuration-from-the-ground-up/.

Prompt: http://aperiodic.net/phil/prompt/
http://superuser.com/questions/382503/how-can-i-put-a-newline-in-my-zsh-prompt-without-causing-terminal-redraw-issues
http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/#current-directory


VIM is mamanged through vundle.

## Using

Install powerline fonts (https://github.com/powerline/fonts)

Open terminal and run `./install`

Install homebrew

Run `brew bundle` to install default apps

Change shell, `chsh -s $(which zsh)`

Open iTerm, and change theme to Solarized Dark, and use Source Code Pro font

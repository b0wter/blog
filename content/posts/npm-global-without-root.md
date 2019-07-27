+++
title = "How to install npm packages globally without root."
date = "2019-07-11T22:12:03.284Z"
author = "b0wter"
cover = ""
tags = ["npm", "shell"]
description = "Installing npm packages globally using root priviledges is a bad idea for a number of reasons. Some modern distributions will fail when trying to do so (e.g. Fedora). In this blog post I will explain the necessary steps to save npm packages to your user folder instead."
showFullContent = false
+++

Installing npm packages globally using root priviledges is a bad idea for a number of reasons. Some modern distributions will fail when trying to do so (e.g. Fedora). In this blog post I will explain the necessary steps to save npm packages to your user folder instead.

Create a folder for the packages
```bash
$ mkdir ~/.npm-packages
```

Configure `npm` to use a different path for globally installed packages
```bash
$ npm config set prefix ~/.npm-packages
```

Edit the configuration of your shell to make sure `npm` finds the binaries and man pages. For `bash` or `zsh` add the following to `.bashrc` or `.zshrc`:
```bash
# Add packages to path.
NPM_PACKAGES=~/.npm-packages
export PATH=$NPM_PACKAGES/bin:$PATH
# Add manpages. Note that the unset command is NOT necessary if you modify it somewhere else.
unset MANPATH 
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
```

In case you're using the `fish` shell you need to edit `.config/fish/config.fish`
```bash
# Add packages to path.
set PATH "~/.npm-packages/bin" $PATH
```

You are now able to invoke
```bash
$ npm install -g gatsby-cli
```
without `sudo`!

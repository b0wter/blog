+++
title = "Fish shell setup."
date = "2019-05-11T11:12:03.284Z"
author = "b0wter"
cover = ""
tags = ["fish"]
description = ""
showFullContent = false
+++

## Remove command-not-found-handler.
In case a command cannot be found fish will search for a packge to install to supply that command. I rarely need that and it can take some time. Open `~/.config/fish/config.fish` and add the following:
```bash
function __fish_default_command_not_found_handler --on-event fish_command_not_found
  functions --erase __fish_command_not_found_setup
end
```

## Add time of command start
This will add the current time when a command is executed. I find this useful for long running commands.
```bash
function preexec_add_time_at_command_execution --on-event fish_preexec
        set RPROMPT_DATE \((date +"%H:%M:%S")\)
        set RPROMPT_X_VALUE (math "$COLUMNS-11")
        echo -e "\033[1A\033[""$RPROMPT_X_VALUE""C $RPROMPT_DATE"
end
```

## Add support to vim
Add the [`vim-fish`](https://vimawesome.com/plugin/vim-fish) plugin with your favourite plugin manager. Then put the following content:
```
" Set up :make to use fish for syntax checking.
compiler fish

" Set this to have long lines wrap inside comments.
setlocal textwidth=79

" Enable folding of block structures in fish.
setlocal foldmethod=expr
```

into `.vim/ftplugin/fish.vim`. This will make sure that vim will detect fish files. There is also additional options for function folding. You'll also want to make sure that you have the follwing options set in your `.vimrc`:
```
syntax enable
filetype plugin indent on
```
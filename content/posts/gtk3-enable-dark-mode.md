+++
title = "GTK3 enable global dark mode by command line."
date = "2019-05-11T12:12:03.284Z"
author = "b0wter"
cover = ""
tags = ["gtk", "shell"]
description = ""
showFullContent = false
+++

If you're running a desktop environment that is not Gnome3 but relies on GTK there is a simple way to make your applications run with the dark theme. You only need to open the following file

```bash
$ vim ~/.config/gtk-3.0/settings.ini
```

and change/add `gtk-application-prefer-dark-theme=1` so it looks like this:

```bash
[Settings]
gtk-application-prefer-dark-theme=1
```

That's all!
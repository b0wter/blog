+++
title = "How to disable zombieload, spectre & meltdown protection."
date = "2019-07-31T22:12:03.284Z"
author = "b0wter"
cover = ""
tags = ["shell", "linux", "security"]
description = "This article explains how to quickly disable the zombieload, spectre and meltdown protection on your linux system."
showFullContent = false
+++

*PLEASE ONLY DO THIS IF YOU KNOW WHAT YOU'RE DOING! THIS IS A SECURITY RISK!*

Disabling is pretty straightforward. Edit your grub configuration:

```bash
# vim /etc/default/grub
```

Find the line that starts with `GRUB_CMDLINE_LINUX` and add the following parameters at the end:

```bash
noibrs noibpb spectre_v2=off spec_store_bypass_disable=prctl spec_store_bypass_disable=off nospectre_v1
```

Afterwards, recreate your bootloader configuration. How to do this depends on your distribution. Usually, you either use `update-grub` or `grub2-mkconfig`. Check whichever is installed on your system. Note that at least forfor `grub-mkconfig` you'll need to set a proper output if your on an UEFI system. It will default to creating a BIOS configuration. For Fedora the command looks like this:

```bash
# grub2-mkconfig --output=/boot/efi/EFI/fedora/grub.cfg
```

Reboot and you're done. Check the results using this [tool](https://github.com/speed47/spectre-meltdown-checker).

*UPDATE*: This does not disable all the security features. Will need some further investigating.
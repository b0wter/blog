+++
title = "[WIP] Why automate software releases?"
date = "2019-05-17T22:12:03.284Z"
author = "b0wter"
cover = ""
tags = ["infrastructure", "programming"]
description = "Why you should bother building and creating releases automatically."
showFullContent = false
+++

## This post is a work in progress.

## Repeatability
You want to be able to reproduce the exact environment a bug occured in. If you've got scripts that build everything for you and you keep these scripts under source control it's trivial to recreate anything from the past.

## Reliability
You want each release to be created in the same way to make sure that sublte changes don't have unintended consequences or that you don't forget one or two commands that will render your new release useless (e.g. forgetting to copy an external dependency to the right place. 

## Focus
Remembering the 20 commands to invoke to create your release does not make you a better developer. Instead it takes focus away from what you should really be thinking about: how to make your software better.

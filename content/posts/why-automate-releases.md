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

# Goal: Spend less time making things build and more time coding
Setting up a build and deployment pipeline can be tedious, frustrating and times look daunting. Especially, if you do it the first couple of times. But the reward is so worth it! I guess everybody has that one haunitng project that only builds on an old machine sitting somewhere running some old or obscure operating system. 
Every walk there is 

## "Clean" developer systems
Using containers cleverly allows you to build a lot of stuff on your system without needed to install any build tools. And it also allows all your colleagues to build the stuff on their systems. The thing you need is a proper toolchain in a container. Let's look at an easy example:

This blog is build using [Hugo](https://gohugo.io). To get started with Hugo you'll first need to download and install the toolchain, see [this](https://gohugo.io/getting-started/installing). Then you'll need to repeat the process each time to update to a new version. And you need to do that on every machine that you want to build on. 

How can we fix this? Containers!

I won't go into details explaining what a container is, but you can check out this [link](https://www.docker.com/resources/what-container) to read more. Basically, a container is a form of virtualization but without the overhead of a full-blown vm. A container offers a predefined system with exactly defined parameters, like which tools are installed and what libraries are installed (with strictly defined versions).

## Repeatability
You want to be able to reproduce the exact environment a bug occured in. If you've got scripts that build everything for you and you keep these scripts under source control it's trivial to recreate anything from the past.

## Reliability
You want each release to be created in the same way to make sure that sublte changes don't have unintended consequences or that you don't forget one or two commands that will render your new release useless (e.g. forgetting to copy an external dependency to the right place. 

## Focus
Remembering the 20 commands to invoke to create your release does not make you a better developer. Instead it takes focus away from what you should really be thinking about: how to make your software better.

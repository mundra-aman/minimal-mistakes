---
title: "Some common GIT commands and flows, I use in my day to day work"
layout: single
classes: wide
tags: [git]

excerpt: "This post is about the common git workflows and gotchas that I come across, while version controlling our codebase"

header:
  image: /assets/images/feature_images/git.jpg
  image_description: ""
  caption: "Photo credit: [**Aman Mundra**](/about/)"

permalink:
published: true
categories:
---


> This post is about the common git workflows and gotchas that I come across, while version controlling our codebase

Before I start, a glossary is must for the common git terms and phrases:
 
**Remote:** Stuff that's on your hard drive is local. Stuff that's on GitHub's server is remote.

**origin:** The default name of the remote repository on GitHub corresponding to the repo you're currently in on your machine. 

**master:** The default name of the initial branch of a repository. So, "origin master" is the default branch of your repository on GitHub. 
Thats why you do git push origin master to update GitHub based on the changes you committed locally

**Syncing**
There are two steps required to sync your repository with the upstream: first you must fetch from the remote, then you must merge the desired branch into your local branch.

**Fetching**
Fetching from the remote repository will bring in its branches and their respective commits. These are stored in your local repository under special branches.

**Merging**
Now that we have fetched the upstream repository, we want to merge its changes into our local branch. 
This will bring that branch into sync with the upstream, without losing our local changes.


Now the most common commands that I issue to my gitbash console:

**Viewing un-pushed Git Commits** 

One of the things that I do most often is view a list of commits in my local which are not yet pushed to the remote.
Or sometimes I simply check the last commit to ensure that I'm on the latest code.

    $ git log origin/master..HEAD
    $ git log --oneline

**List the current remotes**

Editing the remotes is another common process which I generally go through, while setting up a new git repo for a new project.

    $ git remote -v

    origin  https://github.com/user/repo.git (fetch)
    origin  https://github.com/user/repo.git (push)

**Set a new remote**    

    $ git remote add upstream https://github.com/otheruser/repo.git

**Verify new remote**

    $ git remote -v
    
    originhttps://github.com/user/repo.git (fetch)
    originhttps://github.com/user/repo.git (push)
    upstream  https://github.com/otheruser/repo.git (fetch)
    upstream  https://github.com/otheruser/repo.git (push)



# How to Keep the forked repo synced with the main repo

	... o ---- o ---- A ---- B  origin/master (upstream work)
                   \
                    C  master (your work)

Before you can sync, you need to add a remote that points to the upstream repository. You may have done this when you originally forked.

**Tip:** Syncing your fork only updates your local copy of the repository; it does not update your repository on GitHub.

# Common commands I use in my gitbash

To query your Git settings of the local repository, execute the following command:
    
    $ git config --list 

If you want to query the global settings you can use the following command.

    $ git config --global --list 
    
Adding username and password to the config

    $ git config --global user.name "John Doe"
    $ git config --global user.email johndoe@example.com

To clone and do a first remote push

    $ git clone https://username:password@/add/repo/path.git
    $ git log --oneline
    $ git branch -a
    $ git pull
    $ git add .
    $ git commit -m "message"
    $ git add . && git commit -am "comment"
    $ git push

### Git Add, Commit and Push in a single line
Add the following alias to the .gitconfig file

Note: It'll not accept commit messages with a space. So I prefer using '_' between my words.

{% highlight BASH %}
[alias]
acp = "!f() { !git add -A && git commit -m "$@" && git push }; f"    
{% endhighlight %}

    
> Inspired from this article on Dzone: [Top 20 Git Commands with Examples](https://dzone.com/articles/top-20-git-commands-with-examples?edition=385286&utm_source=Daily%20Digest&utm_medium=email&utm_campaign=Daily%20Digest%202018-07-25)
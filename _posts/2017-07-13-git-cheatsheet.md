---
title: "Some common GIT commands and flows, I use in my day to day work"
layout: single
classes: wide
tags: [git]

excerpt: "This post is about the common git workflows and gotchas that I come across, while version controlling our codebase"

header:
  image: /assets/images/git.jpg
  image_description: ""
  caption: "Photo credit: [**Aman Mundra**](/about/)"

published: true
---


> This post is about the common git workflows and gotchas that I come across, while version controlling our codebase


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



**Viewing un-pushed Git Commits** 

    $~ git log origin/master..HEAD
		

**List the current remotes**

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
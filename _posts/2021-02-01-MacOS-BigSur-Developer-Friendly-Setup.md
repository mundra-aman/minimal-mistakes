---
title: "MacOS BigSur Developer Setup"
layout: single
classes: wide
tags: [macOS, BigSur, Data Engineering]

excerpt: "Setting up my iMac for big data engineering and data science projects"

permalink:
published: true
categories: 
---

## Install MySQL server and workbench

MySql server is the de-facto standard for RDBMS requirementents

https://medium.com/macoclock/mysql-on-mac-getting-started-cecb65b78e
http://g2pc1.bu.edu/~qzpeng/manual/MySQL%20Commands.htm
https://vladster.net/en/instructions/install-mysql-mac/

{% highlight BASH %}

// mysql server installer directory
/usr/local/mysql/bin/mysql -u root -p 

// set path for zsh
sudo sh -c 'echo /usr/local/mysql/bin > /etc/paths.d/mysql'
mysql --version
mysql -u root -p  

{% endhighlight %}


## Configuring Python environment

Anaconda offers the easiest developer friendly way to setup any system for data engineering.
Anaconda is a package manager, an environment manager, and Python distribution that contains a collection of many open source packages.
Anaconda Individual Edition contains conda and Anaconda Navigator, as well as Python and hundreds of scientific packages. When you installed Anaconda, you installed all these too.
Notice that when you install Anaconda, it modifies your .bash_profile to put Anaconda in your path.
https://opensource.com/article/19/5/python-3-default-mac

{% highlight BASH %}

/user/bin/python
python --version
echo $PATH
which python
conda --version
jupyter notebook

{% endhighlight %}


## Setting up & configuring hibernate modes

{% highlight BASH %}

// Sleep mode and keep awake
pmset -g | grep hibernatemode
	hibernatemode 0  (normal sleep)
	hibernatemode 1  (hibernate mode for pre-2005 portable Macs)
	hibernatemode 3  (safe sleep)
	hibernatemode 25 (hibernate mode for post-2005 portable Macs

sudo pmset -a hibernatemode X

caffeinate -dt 7200

{% endhighlight %}


## Version Check bash commands

{% highlight BASH %}

mysql --version
conda --version
python --version
pip --version


{% endhighlight %}

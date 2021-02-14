---
title: "MacOS BigSur Developer Setup"
layout: single
classes: wide
tags: [nifty50, sensex]

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
mysql -u root -p  
/usr/local/mysql/bin/mysql -u root -p 
sudo sh -c 'echo /usr/local/mysql/bin > /etc/paths.d/mysql'
{% endhighlight %}


## Configuring Python environment

Anaconda offers the easiest developer friendly way to setup any system for data engineering.

https://opensource.com/article/19/5/python-3-default-mac

{% highlight BASH %}
/user/bin/python
python --version

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


I

---
layout: post
status: publish
published: true
title: groovy-statsdclient
author:
  display_name: jmiller
  login: jmiller
  email: joeym@joeym.net
  url: ''
author_login: jmiller
author_email: joeym@joeym.net
wordpress_id: 309
wordpress_url: http://joemiller.me/?p=309
date: '2011-06-29 16:50:13 -0700'
date_gmt: '2011-06-29 23:50:13 -0700'
categories:
- software
- monitoring
- groovy
tags: []
comments: true
---
In an attempt to learn some Groovy and Gradle I wrote an implementation of a Statsd client in groovy.  It's similar to other statsd clients in other languages and supports the typical increment(), decrement(), and timing() methods.

<!--more-->

It's not available on Maven Central or via Grape at this time, which will be a future learning exercise. In the meantime you can download a pre-built .jar or the source code from github:

- [https://github.com/joemiller/groovy-statsdclient](https://github.com/joemiller/groovy-statsdclient "https://github.com/joemiller/groovy-statsdclient")

For more background on Statsd, check out this blog article from Etsy:   [Measure Anything, Measure Everything](http://codeascraft.etsy.com/2011/02/15/measure-anything-measure-everything/ "Statsd: Measure anything, Measure Everything")

 


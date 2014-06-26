---
layout: post
status: publish
published: true
title: dns_compare.py - testing DNS servers
author:
  display_name: jmiller
  login: jmiller
  email: joeym@joeym.net
  url: ''
author_login: jmiller
author_email: joeym@joeym.net
wordpress_id: 94
wordpress_url: http://www.joeym.net/?p=94
date: '2010-12-22 19:53:20 -0800'
date_gmt: '2010-12-23 02:53:20 -0800'
categories:
- testing
- dns
tags: []
comments: true
---
Sometimes it might be nice to be able to test a DNS server's output, such as with a continuous monitoring system, or as a validation tool when migrating to a different DNS server (or service.)

{% highlight text%}
$ dns_compare.py -z example.com --file example.com.zone --server 10.1.1.1
....X...X..done
Results:
Matches: 9
Mis-matches: 2
{% endhighlight %}

To see more examples or download the code, goto: [https://github.com/joemiller/dns\_compare](https://github.com/joemiller/dns_compare "https://github.com/joemiller/dns\_compare")


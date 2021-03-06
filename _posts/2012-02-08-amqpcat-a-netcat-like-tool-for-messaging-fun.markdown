---
layout: post
status: publish
published: true
title: AMQPcat, a netcat-like tool for messaging fun
author:
  display_name: jmiller
  login: jmiller
  email: joeym@joeym.net
  url: ''
author_login: jmiller
author_email: joeym@joeym.net
wordpress_id: 501
wordpress_url: http://joemiller.me/?p=501
date: '2012-02-08 16:30:02 -0800'
date_gmt: '2012-02-08 23:30:02 -0800'
categories:
- scripting
- rabbitmq
- messaging
tags: []
comments: true
---
If you have read [@ripienaar's](http://www.devco.net/) excellent series of [articles](http://www.devco.net/archives/2011/12/11/common-messaging-patterns-using-stomp.php) on common messaging patterns you probably noticed a handy CLI tool for working with STOMP queues called `stompcat`. I looked around for something similar for AMQP brokers but couldn't find anything quite the same. There is [amqp-utils](https://github.com/dougbarth/amqp-utils) but I had some issues with these and the tools didn't work quite like I was hoping. So I wrote `amqpcat` with the idea of providing a similar tool to `stompcat`.

Available on github and rubygems.org: [https://github.com/joemiller/amqpcat](https://github.com/joemiller/amqpcat)

<!--more-->

Installation is easy:

{% highlight bash%}
sudo gem install amqpcat --no-rdoc --no-ri
{% endhighlight %}

## 1:1 Messaging demonstration

Publish a message:

{% highlight bash%}
$ echo "hello there" | amqpcat amqp://guest:guest@rabbitmq -t direct -n test.direct --publisher
{% endhighlight %}

Receive the message:

{% highlight bash%}
$ amqpcat amqp://guest:guest@rabbitmq -t direct -n test.direct --consumer
hello there
{% endhighlight %}

Pretty simple. There are various other options, run with `-h` to see them all. You can easily load-balance amongst multiple consumers by starting multiple consumers with the same url and options. See the [test\_direct.sh](https://github.com/joemiller/amqpcat/blob/master/examples/test_direct.sh) example for a demo of this.

## 1:N / PubSub Messaging

Start 2 (or more) consumers:

{% highlight bash%}
$ amqpcat amqp://rabbitmq -t fanout -n test.fanout -s "Consumer-1: " --consumer &
$ amqpcat amqp://rabbitmq -t fanout -n test.fanout -s "Consumer-2: " --consumer &
{% endhighlight %}

Publish a message:

{% highlight bash%}
$ echo "hello there" | amqpcat amqp://guest:guest@rabbitmq -t fanout -n test.fanout --publisher
{% endhighlight %}

You should see both consumers receive the message, ie:

{% highlight bash%}
Consumer-1: hello there
Consumer-2: hello there
{% endhighlight %}

See [test\_fanout.sh](https://github.com/joemiller/amqpcat/blob/master/examples/test_fanout.sh) for a similar example.

## SSL support

SSL support (server verification, and client certs) has been written into the tool but I have not been able to test it to a working state yet.


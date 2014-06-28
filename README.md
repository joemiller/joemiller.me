joemiller.me jekyll
===================

Hosting overview
----------------

### S3

- bucket 1:  joemiller.me     (empty, website-configuration set to: redir to www.joemiller.me)
- bucket 2:  www.joemiller.me (content repo)

### DNS (Cloudflare)

- joemiller.me     CNAME    joemiller.me.s3-website-us-east-1.amazonaws.com
- www.joemiller.me CNAME    www.joemiller.me.s3-website-us-east-1.amazonaws.com

### CDN (Cloudflare)

Configured to cache all content including html which is not the default on CF.


Install / Setup
===============

bundler
-------
The usual:

    gem install bundler
    bundle install

grunt
-----
install grunt-cli to run the grunt tasks:

    npm install -g grunt-cli

Install the rest of the node modules:

    npm install

s3
--
- Create `joemiller.me` bucket. Configure website hosting to redirect to `www.joemiller.me`.
- Create `www.joemiller.me` bucket.
- Create IAM keypair, attach policies listed below.
- Run `rake apply` to configure `www.joemiller.me` bucket.

IAM policy for r/w s3 access:

    {
      "Statement": [
        {
          "Action": "s3:*",
          "Effect": "Allow",
          "Resource": [
            "arn:aws:s3:::www.joemiller.me",
            "arn:aws:s3:::www.joemiller.me/*"
          ]
        }
      ]
    }

Cloudflare
----------
### Setup DNS:

- joemiller.me     CNAME    joemiller.me.s3-website-us-east-1.amazonaws.com
- www.joemiller.me CNAME    www.joemiller.me.s3-website-us-east-1.amazonaws.com

### Setup Page Rules under Cloudflare settings:

- http://*joemiller.me/*
- http://*.joemiller.me/*
- http://joemiller.me/

Set *Cache Everything* for each.

(not sure if all of these are needed but there were problems during initial setup
and this seems to work.)


Workflow
========

Common tasks are all handled by rake:

Show all tasks and descriptions: `rake -T`

    rake apply            # Apply/update S3 and Cloudfront configuration
    rake build            # Run `jekyll build`
    rake deploy           # Deploy to S3
    rake grunt            # Run grunt
    rake new_page[title]  # Create a new page
    rake new_post[title]  # Create a new post in _posts
    rake serve            # Run `jekyll serve` on localhost:4000

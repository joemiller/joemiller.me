Bootstrap dev environment
=========================

bundler
-------
The usual:

    gem install bundler
    bundle install

grunt
-----
install grunt-cli to run the grunt tasks:

    npm install -g grunt-cli

grunt-cli is just a wrapper and runs the actual grunt version in the Gruntfile.js/package.json

    npm install

s3
--
Configure CloudFront CNAMEs manually since the s3_website app can only configure 1 CNAME right now:
https://github.com/laurilehmijoki/configure-s3-website/issues/9


Workflow
========

Common tasks are all handled by rake:

Run dev server
--------------
`rake serve`

Deploy
------
`rake deploy`



TODO
----
x- better favicon
- new repo
- push to github repo
x get invalidation working
x get rake tasks for new_post, deploy
- figure out cdn and dns
x fix description/excerpts on all posts
x securify config. ENV vars for S3 keys and cloudfront distro id. others?
x fix articles with images. `egrep joemiller.*uploads _posts/*`

### post dns switchover:

- document s3/cdn config details since it's weird
- confirm google analytics still working
- confirm disqus comments are showing up

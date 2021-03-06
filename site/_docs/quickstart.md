---
layout: docs
title: Quick-start guide
permalink: /docs/quickstart/
---

For the impatient, here's how to get a boilerplate Bunto site up and running.

{% highlight shell %}
~ $ gem install bunto
~ $ bunto new myblog
~ $ cd myblog
~/myblog $ bundle install
~/myblog $ bundle exec bunto serve
# => Now browse to http://localhost:4000
{% endhighlight %}

If you wish to install bunto into an existing directory, you can do so by running `bunto new .` from within the directory instead of creating a new one. If the existing directory isn't empty, you'll also have to pass the `--force` option like so `bunto new . --force`.

That's nothing, though. The real magic happens when you start creating blog
posts, using the front matter to control templates and layouts, and taking
advantage of all the awesome configuration options Bunto makes available.

If you're running into problems, ensure you have all the [requirements
installed][Installation].

[Installation]: /docs/installation/

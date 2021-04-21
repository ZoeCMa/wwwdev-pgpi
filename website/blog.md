---
layout: blog
class: blog-feed
title: Blog
permalink: /blog/
---

{% for post in site.posts %}
<article>
  <div class="post-header">
    <h2><a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h2>
    <div class="date">{{ post.date | date: "%B %-d, %Y" }}</div>
  </div>

<div class="meta clear">
  {%- if post.author -%}
    {%- assign post_author = post.author | downcase -%}
      {%- for author in site.authors -%}
        {%- if author.name == post.author or author.name contains post.author -%}
          {%- assign author_url = author.url -%}
        {%- endif -%}
      {%- endfor -%}
  <div class="author">
    <span class="by-author">
      <span class="sep">by</span>
      <a class="url fn n author-url" title="View all posts by {{ post.author | escape }}" rel="author" href="{{ site.url }}{{ author_url | relative_url }}">{{ post.author | escape }}</a>
    </span>
  </div>
  {%- endif-%}
</div>

<p>{{ post.excerpt }}</p>
<div class="post-footer post-footer-blog-feed">
  {% assign categories = post.categories %}
  <div class="categories">from → &nbsp;
    {%- for category in categories -%}
    <a href="{{ site.baseurl }}/category/{{ category | slugify }}">{{category}}</a>
    {% unless forloop.last %}, {% endunless %}
    {%- endfor -%}
  </div>
</div>
</article>

{% endfor %}


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
    {%- if post.author.first -%}
      {%- assign post_authors_list = post.author -%}
    {%- else -%}
      {%- assign post_authors_list = '' | split: "," -%}
      {%- assign post_authors_list = post_authors_list | push: post.author -%}
    {%- endif -%}
  <div class="author">
    <span class="by-author">
      <span class="sep">by</span>
    {%- for post_author in post_authors_list -%}
      {%- assign post_author_cn = post_author | downcase -%}
      {%- assign post_author_url = nil -%}
      {%- for author in site.authors -%}
        {%- assign author_cn = author.name | downcase -%}
	      {%- if author_cn == post_author_cn or author_cn contains post_author_cn -%}
          {%- assign post_author_url = author.url -%}
          {%- break -%}
        {%- endif -%}
      {%- endfor -%}
      {%- if post_authors_list.size == 2 -%}
        {%- if forloop.last %} and {% endif -%}
      {%- else -%}
    {%- if forloop.first -%}{%- elsif forloop.last %}, and {% else %}, {% endif -%}
      {%- endif -%}
      {%- if post_author_url %}
      <a class="url fn n author-url" title="View all posts by {{ post_author | escape }}" rel="author" href="{{ site.url }}{{ post_author_url | relative_url }}">{{ post_author | escape }}</a>
      {%- else %}
      <span class="url fn n author-url" rel="author">{{ post_author | escape }}</span>
      {%- endif -%}
    {%- endfor %}
    </span>
  </div>
  {%- endif %}
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


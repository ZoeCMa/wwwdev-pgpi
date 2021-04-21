---
layout: blog
permalink: /tag/
title: Tags
class: categories-main
---

<h1 class="categories-title">Tags</h1>
<img class="archive-comment" src="{{ "/assets/images/comments-bubble-archive.gif" | relative_url }}" width="17" height="14" alt="comment" scale="0">

<div class="entries">
  <ul class="entry-list">
    {% assign tags_list = site.tags %}
      {% if tags_list.first[0] == null %}
        {% for tag in tags_list %}
          {% unless tag contains "admin" or tag[0] contains "admin" %}
          <li><a class="category-link" href="{{ category | downcase | downcase | url_escape | strip | replace: ' ', '-' }}">{{ tag | camelcase }} ({{ site.tags[tag].size }})
            <!-- <span class="comments_number">0</span> -->
          </a></li>
          {% endunless %}
        {% endfor %}
      {% else %}
        {% for tag in tags_list %}
          {% unless tag contains "admin" or tag[0] contains "admin" %}
          <li><a class="category-link" href="{{ category[0] | downcase | url_escape | strip | replace: ' ', '-' }}">{{ tag[0] | camelcase }} ({{ tag[1].size }})
            <!-- <span class="comments_number">0</span> -->
          </a></li>
          {% endunless %}
        {% endfor %}
      {% endif %}
    {% assign tags_list = nil %}  </ul>
</div><!--end entry-list-->

<div class="navigation">
  <div class="alignleft"></div>
  <div class="alignright"></div>
</div><!--end navigation-->

---
layout: default
class: news
title: News
permalink: /news/
---

## News

{% assign sorted = site.news | sort: 'date' | reverse %}
{% for item in sorted %}
<article class="news-{{ item.year }}">

<h3>{{ item.year }}</h3>
  {{ item.content }}
</article>
{% endfor %}


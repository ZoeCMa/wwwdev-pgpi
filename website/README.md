# Personal Genome Project: Global Network (Jekyll)

This is the repo for the rewrite of the [PGP Global](https://www.personalgenomes.org/) website

<!-- MarkdownTOC -->

* [Instructions and Documentation](#instructions-and-documentation)
* [Issues](#issues)
* [Nice to Have](#nice-to-have)
  * [Gravatars Fallback](#gravatars-fallback)
  * [Replace Captions and Shortcodes](#replace-captions-and-shortcodes)
  * [SCSS \(extra/non-essential\)](#scss-extranon-essential)

<!-- /MarkdownTOC -->

<a id="instructions-and-documentation"></a>
## Instructions and Documentation

Currently in progress - writing documentation for workflow, snippets, notes about site structure, editing, etc.

See A current list of documentation files includes:
* [Documentation](docs/documentation.md) - general documentation
* [Resources](docs/resources.md) - a list of various resources related to in-progress tasks

<a id="issues"></a>
## Issues

* Build time is horrendous, unless using `--limit_posts`
  * This may be due to the archives plugin?
* Swap archives plugin for `jekyll-archives`?
* Finishing replacing relative URLs where relevant
  * See [CDN - Cloudflare](#cdn---cloudflare) regarding performance
* Is Logo still distorted for Sarah (or anyone else)?
  * Previous note: Seems to be a result of bootstrap's `margin-left: -15px; margin-right: -15px;` setting on `.row` classes
* Blog page - performance is terrible. Needs either CDN, pagination, etc.
* Add ARIA roles
* Figure out what `defaults` can be removed from `_config.yml`
* Double check: 
  * favicon w/ Real Favicon Generator (should be fine)
  * Contact Form
* Verify site with Webmaster Tools, prior to launch
* `jekyll-autoprefixer`? `scripts/prefixfree.js` may be taking care of this
* Flickr API for Sidebar(?) - Is this still relevant?

<a id="nice-to-have"></a>
## Nice to Have

* Responsive Images and/or Lazy Loading
  * May be very relevant for blog on mobile
  * There is already an `_includes/lazyload.html` - doesn't seem to be being used currently
  * Plugin Options:
    * https://github.com/wildlyinaccurate/jekyll-responsive-image
    * Instructions here: https://ivovalchev.medium.com/jekyll-responsive-images-with-srcset-5da131415d0f
  * Non-Plugin Options:
    * [Responsive Images in Jekyll without a plugin](https://benseymour.com/2017/03/02/Responsive-Images-in-Jekyll-without-a-plugin)
    * [Designing responsive image layouts with Jekyll](https://www.lizheidner.com/front-end/responsive-images/)

* Fallback for Author gravatars
* Convert `max-width: 767px` section in `_media.scss` to min-width

<a id="gravatars-fallback"></a>
### Gravatars Fallback

Something like this, but in reverse/more nuanced:

```html
{% for author in site.authors %}
{% if author.image and author.image != '/assets/images/no_gravatar.png' %}
  <img src="{{ author.image }}" alt="Author thumbnail for {{ author.name }}" class="avatar avatar-48 grav-hased" height="48" width="48"></a></li>
  {% elsif author.email %}
    <script>
      document.write('<li><a id="{{ author.gravatar_name }}" href="{{ site.url }}{{ site.baseurl }}{{ author.url }}">')
      document.write('<img src="' + get_gravatar('{{ author.email }}', 48) + '" alt="Author thumbnail for {{ author.name }}" class="avatar avatar-48 grav-hased" height="48" width="48" /></a></li>');
    </script>

  {% endif %}        
{% endfor%}

```
<a id="replace-captions-and-shortcodes"></a>
### Replace Captions and Shortcodes

1. Shortcodes need to be replaced with actual code wherever possible. See e.g. [here](http://localhost:4000/2012/11/27/wildlife-of-our-homes-q-a-with-rob-dunn/).
  * `[caption]` covers 21 posts. I can't say for other shortcodes without manually looking through posts.
  * `[youtube]` covers 8 posts
  * `[polldaddy]`covers 1 posts

<a id="scss-extranon-essential"></a>
### SCSS (extra/non-essential)

1. Replace all fixed line heights w/ relative numbers
    * Using a base SCSS variable wherever possible
2. Month Archives: 425px, 768px - would be nice to tweak the styles a bit, so the Archive Title doesn't split into the next line


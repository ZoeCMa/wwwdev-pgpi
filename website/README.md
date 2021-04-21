# Personal Genome Project: Global Network (Jekyll)

This is the repo for the rewrite of the [PGP Global](https://www.personalgenomes.org/) website

<!-- MarkdownTOC -->

* [Instructions and Documentation](#instructions-and-documentation)
* [Questions & Content Needed](#questions--content-needed)
  * [SEO - Webmaster Verifications](#seo---webmaster-verifications)
* [Absolute vs Relative URLs](#absolute-vs-relative-urls)
  * [Nav Alignment & Logo Distorting](#nav-alignment--logo-distorting)
    * [Plugins Staging & Production](#plugins-staging--production)
    * [Plugins - Local Dev](#plugins---local-dev)
* [Accessibility](#accessibility)
* [Cleanup](#cleanup)
  * [SCSS \(extra/non-essential\)](#scss-extranon-essential)
* [Staging and Production](#staging-and-production)
  * [Optimization](#optimization)
    * [Images](#images)
    * [CDN - Cloudflare](#cdn---cloudflare)
  * [SEO & Webmaster Tools](#seo--webmaster-tools)
  * [Domain & Subdomain Setup](#domain--subdomain-setup)
  * [Favicon](#favicon)
  * [Contact Form](#contact-form)
* [Notes](#notes)
  * [Captions and Shortcodes](#captions-and-shortcodes)
  * [Deprecated](#deprecated)

<!-- /MarkdownTOC -->

<a id="instructions-and-documentation"></a>
## Instructions and Documentation

Currently in progress - writing documentation for workflow, snippets, notes about site structure, editing, etc.

See A current list of documentation files includes:
* [Documentation](docs/documentation.md) - general documentation
* [Resources](docs/resources.md) - a list of various resources related to in-progress tasks

<a id="questions--content-needed"></a>
## Questions & Content Needed

<a id="seo---webmaster-verifications"></a>
### SEO - Webmaster Verifications

Good idea to verify with Google Webmaster Tools, etc if not already. Sample config values for `jekyll-seo-tag`:

```yaml
# Just Google
google_site_verification

# Multiple Services
webmaster_verifications:
  google: 1234
  bing: 1234
  alexa: 1234
  yandex: 1234
  baidu: 1234
```

2. What's the correct Facebook link? `https://facebook.com/PersonalGenomesOrg` results in a 404/Page Not Found.

<a id="absolute-vs-relative-urls"></a>
## Absolute vs Relative URLs

* Finishing replacing relative URLs where relevant
  * See [CDN - Cloudflare](#cdn---cloudflare) regarding performance

<a id="nav-alignment--logo-distorting"></a>
### Nav Alignment & Logo Distorting

1. News page is currently off w/ Nav Alignment
    * Home page nav alignment is currently fine
2. Sarah mentioned the Logo looked distorted
    * Seems to be a result of the weird `margin-left: -15px; margin-right: -15px;` setting on `.row` classes

<a id="plugins-staging--production"></a>
#### Plugins Staging & Production

* jekyll-include-cache
* jekyll-feed
* github-pages
* jekyll-seo-tag
* jekyll-redirect-from
* jekyll-sitemap
* jekyll-titles-from-headings

<a id="plugins---local-dev"></a>
#### Plugins - Local Dev

* jekyll-admin - useful for editing posts. Won't run on GH Pages
* jekyll-include-cache
* github-pages
* jekyll-redirect-from
* jekyll-titles-from-headings

<a id="accessibility"></a>
## Accessibility

1. Add ARIA Roles into HTML where necessary, across site
    * Nav menu

<a id="cleanup"></a>
## Cleanup

* Remove `archives.py` when it's 100% clear it's unnecessary
  * Doublecheck that running `_plugins/luna_archives_generator.rb` manually is sufficient
  * A Rakefile might be a good way to save the trouble of running it manually
* Figure out what's necessary/relevant from the `defaults` settings in `_config.yml`

<a id="scss-extranon-essential"></a>
### SCSS (extra/non-essential)

1. Replace all fixed line heights w/ relative numbers
    * Using a base SCSS variable wherever possible
2. Month Archives: 425px, 768px - would be nice to tweak the styles a bit, so the Archive Title doesn't split into the next line


<a id="staging-and-production"></a>
## Staging and Production

<a id="optimization"></a>
### Optimization

<a id="images"></a>
#### Images

1. Figure out how to Lazy Load images for blog posts
2. Compress images
3. Find a way to generate and serve device-appropriate source-sets

<a id="cdn---cloudflare"></a>
#### CDN - Cloudflare

* For performance reasons, I'd advise setting up the website with Cloudflare.
    * This will allow for the use of absolute urls (helpful for SEO and general nav, imo) without a substantial performance hit.
    * Currently when using absolute urls instead of relative urls, the difference is very noticeable
* The main issue is the main page of the Blog.
    * Other (not mutually exclusive) solutions may involve Lazy Loading images or adding post excerpts.

<a id="seo--webmaster-tools"></a>
### SEO & Webmaster Tools

1. Verify with various Webmaster tools
2. Test with Google's [Structured Data Testing Tool](https://search.google.com/structured-data/testing-tool/u/0/)
    * See [Google Developers - Understand how structured data works](https://developers.google.com/search/docs/guides/intro-structured-data)

<a id="domain--subdomain-setup"></a>
### Domain & Subdomain Setup

1. Note that current website seems to prefer `www` over Apex domain.

<a id="favicon"></a>
### Favicon

* Should be all set - but can run [Favicon Checker](https://realfavicongenerator.net/) another time, once the subdomain is set up

<a id="contact-form"></a>
### Contact Form

* Double-check Contact Form just to be on the safe side

<a id="notes"></a>
## Notes

<a id="captions-and-shortcodes"></a>
### Captions and Shortcodes

1. Shortcodes need to be replaced with actual code wherever possible. See [here](http://localhost:4000/2012/11/27/wildlife-of-our-homes-q-a-with-rob-dunn/) for an example.
    * `[caption]` covers 21 posts. I can't say for other shortcodes without manually looking through posts.
    * `[youtube]` covers 8 posts
    * `[polldaddy]`covers 1 posts

<a id="deprecated"></a>
### Deprecated

~~1. Reinstate the /updates.html et al links that go to [sign-up form](https://personalgenomes.us3.list-manage.com/subscribe?u=3980aaa2746fd428de44b2ab4&id=34d31b2d4b) and similar~~

* ~~Setup JS redirect via layout or include or something~~
* ~~use jekyll-redirect to do this possibly?~~
* Not finding the where/what of this. It was a minor concern in the first place.


[1]: docs/resources.md

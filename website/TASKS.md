# Development Tasks

<!-- MarkdownTOC -->

* [High Complexity](#high-complexity)
  * [Markup](#markup)
    * [Accessibility](#accessibility)
  * [CMS System](#cms-system)
* [Medium Complexity](#medium-complexity)
  * [Blog - Share Buttons](#blog---share-buttons)
  * [Flickr](#flickr)
  * [Sidebar Authors](#sidebar-authors)
  * [SEO & Plugins](#seo--plugins)
  * [Styling](#styling)
    * [General](#general)
    * [Responsive](#responsive)
  * [Contact Page](#contact-page)
  * [Responsive Images](#responsive-images)
  * [Favicon](#favicon)
* [Low Complexity](#low-complexity)
  * [Archive and Author Pages](#archive-and-author-pages)
  * [Styling](#styling-1)
    * [General](#general-1)
    * [Responsive](#responsive-1)
* [Need from Curii](#need-from-curii)
  * [Unimportant](#unimportant)
    * [Liquid](#liquid)
* [Staging](#staging)
  * [Testing - GitHub Pages - Local](#testing---github-pages---local)
* [Production](#production)
  * [Custom Domain](#custom-domain)
* [Completed](#completed)
* [Deprecated](#deprecated)
  * [Comments System](#comments-system)

<!-- /MarkdownTOC -->


<a id="high-complexity"></a>
## High Complexity

<a id="markup"></a>
### Markup

<a id="accessibility"></a>
#### Accessibility

* Add ARIA roles and whatever else
  * Look at Genesis/haSepharadi code as a guide

<a id="cms-system"></a>
### CMS System

* Find other Dashboard type things

<a id="medium-complexity"></a>
## Medium Complexity

<a id="blog---share-buttons"></a>
### Blog - Share Buttons

* Replicate Share buttons from old blog. Probably copy HTML and stuff

<a id="flickr"></a>
### Flickr

* Pull from [RSS feed](https://api.flickr.com/services/feeds/photos_public.gne?id=78213110@N06&lang=en-us&format=rss_200)
  * [Jekyll and responsive Flickr photos](https://heipei.io/2016/05/28/jekyll-and-responsive-flickr-photos/)
  * [Keith Marran - Integrating Flickr and Jekyll](http://www.marran.com/tech/integrating-flickr-and-jekyll) - has useful info on caching

<a id="sidebar-authors"></a>
### Sidebar Authors

* Glitches out if not connected to internet

<a id="seo--plugins"></a>
### SEO & Plugins

* Add email, site description, etc to `_config.yml`
* See if there are more page-specific or other specific SEO things I need to do

<a id="styling"></a>
### Styling

<a id="general"></a>
#### General

* Replace all line heights with relative numbers.
  * Is there a base line height I can set that will mostly cover this??
* Desktop nav menu dropdown color

<a id="responsive"></a>
#### Responsive

* Convert `max-width: 767px` section in `_media.scss` to min-width
  * Low priority, but I'd like to

<a id="contact-page"></a>
### Contact Page

* Looks like it will be via Google Forms
  * https://github.com/toperkin/staticformemails
  * https://blog.webjeda.com/jekyll-contact-form/
  * https://bbc.github.io/a11y-tutorials/forms/

<a id="responsive-images"></a>
### Responsive Images
* [Responsive Images in Jekyll without a plugin](https://benseymour.com/2017/03/02/Responsive-Images-in-Jekyll-without-a-plugin)
* [Designing responsive image layouts with Jekyll](https://www.lizheidner.com/front-end/responsive-images/)

<a id="favicon"></a>
### Favicon

* [Real Favicon Generator](https://realfavicongenerator.net/)
* [How do I get Jekyll to copy favicons from a subdirectory to root when publishing?](https://stackoverflow.com/questions/52223620/how-do-i-get-jekyll-to-copy-favicons-from-a-subdirectory-to-root-when-publishing)

<a id="low-complexity"></a>
## Low Complexity

<a id="archive-and-author-pages"></a>
### Archive and Author Pages

* Layouts: default, month, category, day
  * Single template??
  * Archive pages `<li>` needs background change on hover

<a id="styling-1"></a>
### Styling

<a id="general-1"></a>
#### General

* Blog articles typography
* Main page - button hover color
*

<a id="responsive-1"></a>
#### Responsive

* Sidebar social icons get pushed to new line at 768-830px

<a id="need-from-curii"></a>
## Need from Curii

1. Site Footer - what goes in it?
    * Possible options: Licensing, Copyright, and possibly Privacy Policy, if relevant for EU GDPR compliance.
2. Contact Page
    * Contact Form vs. Link
    * If contact form - how will the back-end work?
3. `_config.yml` - the following fields should be filled in or commented out:
  * email
  * description (important for SEO)
  * any social media we might link to (currently have twitter and flickr)

<a id="unimportant"></a>
### Unimportant

<a id="liquid"></a>
#### Liquid

* Figure out where I need to escape things

<a id="staging"></a>
## Staging

<a id="testing---github-pages---local"></a>
### Testing - GitHub Pages - Local
1. [Setting Up GitHub Pages Locally](https://help.github.com/en/articles/setting-up-your-github-pages-site-locally-with-jekyll#keeping-your-site-up-to-date-with-the-github-pages-gem)
    * * Set custom domain on GitHub repo. See [here](https://help.github.com/en/articles/adding-or-removing-a-custom-domain-for-your-github-pages-site)


<a id="production"></a>
## Production

<a id="custom-domain"></a>
### Custom Domain

1. Custom Domains - Create A records pointing to [GitHub's servers](https://help.github.com/en/articles/setting-up-an-apex-domain#configuring-a-records-with-your-dns-provider)
  * 185.199.108.153
  * 185.199.109.153
  * 185.199.110.153
  * 185.199.111.153
* Remove and re-add custom domain on GitHub account to trigger the process of enabling HTTPS.
2. Setup SSL and Test [Enforce HTTPS](https://help.github.com/en/articles/securing-your-github-pages-site-with-https) (this means everything that loads on the page has to start with https:// instead of http://)
    * Cloudflare is probably the most optimal route here. See Resources file.
    * [Secure and fast GitHub Pages with CloudFlare](https://blog.cloudflare.com/secure-and-fast-github-pages-with-cloudflare/)
    * [How to setup a static website using GitHub Pages and Cloudflare with your own Domain Name](https://www.codementor.io/landonpatmore/how-to-setup-a-static-website-using-github-pages-and-cloudflare-with-your-own-domain-name-jb99nbuoe)
    * [How to Deploy Websites on Custom Domains using Cloudflare and Github Pages](https://medium.com/crowdbotics/annie-azana-how-to-deploy-websites-using-cloudflare-and-github-pages-c415c55fea36)

<a id="completed"></a>
## Completed

* Moved News section to its own page
* Fixed 404 Page header
* Nav Menu logic for seperator and dropdown-header added in
* Split the "International Projects" section into a jekyll collection of markdown files (similar to News files)?
* Added alt text to pgp-logo.png
* Retrieved missing Blog images
* Refactored SCSS code
* Created auto-generated Author pages
* Fixed private Author Metadata displaying in post header
* Sidebar and Main layouts on blog, archive, and author pages
* Google Analytics
* Gravatar links dynamic
* Author/Archive layouts default, month, day, category, tag
* Related Posts
* Blog Share buttons
* Category and Tag pages
* Added <time> tags
* Blog Dates are dynamic
<a id="deprecated"></a>
## Deprecated

<a id="comments-system"></a>
### Comments System

* Comments were disabled on all previous blog posts anyway

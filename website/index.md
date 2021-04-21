---
layout: home
title: The Personal Genome Project
class: home
---

<div class="container">
  <div class="row lead-row pgp-row-about">
    <div class="col-xs-12 col-sm-8 col-md-9 lead-div">
      <a id="about" class="anchor-offset"></a>
{% capture pgp_description %}

{:.page-title}
# The Personal Genome Project

{:.lead.pgp-description}
The Personal Genome Project, initiated in 2005, is a vision and coalition of projects across the world dedicated to creating public genome, health, and trait data. Sharing data is critical to scientific progress, but has been hampered by traditional research practices. The PGP approach is to invite willing participants to publicly share their personal data for the greater good.

{% endcapture %}

{{ pgp_description | markdownify }}
    </div>
    <div class="col-xs-8 col-sm-3 col-md-3 lead-div logo-container">
      <img class="logo" src="assets/images/pgp-logo.png" alt="Curii logo - a figure within a circle. A double helix runs through the figure's core. The circle, body, and helix alternate between green and blue on both sides." longdesc="A figure within a circle. A double helix runs from the circle's bottom through the figure's core. The left side of the body is green, while the circle and face are blue. The right side of the body is blue, while the circle and face are green. Each helix maintains its color as it spirals through the figure's body.">
    </div>
  </div>
  <div class="row lead-row">
    <div class="local-projects-wrap col-xs-12 col-md-9 lead-div">

      <div class="local-projects">
        <h2 class="local-projects-header">Local Projects</h2>
        <h3>Harvard PGP (United States)</h3>
        <p>
          Founded in August 2005, the Harvard Personal Genome Project is
          the pilot PGP site, and is based in George Church's laboratory
          at Harvard Medical School.
        </p>
        <div><button class="btn btn-default"><a href="https://pgp.med.harvard.edu/">Go to the Harvard PGP website</a></button></div>

      </div>
    </div>
  </div>
  <hr>

  <div class="row international-projects">
    <a id="overview" class="anchor-offset"></a>

    <div class="col-xs-12">
      <h2>International Projects</h2>

      <p>
        The Global Network of Personal Genome Projects includes researchers
        at leading institutions around the globe:
      </p>

      <ul>
        {% assign sorted = site.projects | sort: 'order' %}
        {% for project in sorted %}
          <li>
            <h3>{{ project.title }} ({{ project.locale }})</h3>
            <p>{{ project.description }}</p>
            <div><button class="btn btn-default"><a href="{{ project.link }}">Go to the {{ project.title }} website {{ project.language }}</a></button></div>
          </li>
        {% endfor %}
      </ul>
    </div>

<div class="col-xs-12">
  <a id="guidelines" class="anchor-offset"></a>

{%- capture global_guidelines -%}

### Global Network Guidelines

Members of the Global Network of Personal Genome Projects adhere to the following guidelines:

1.  **Public Data.** Participants are invited to publicly share their genomic and trait data in an integrated, publicly-accessible format using a CC0 waiver or equivalent public domain license.

2.  **Non-anonymous.** The risks of participant re-identification are addressed up front, as an integral part of the consent and enrollment process; neither anonymity nor confidentiality of participant identities or their data are promised to research participants.

3.  **Equal access.** Participants are provided access to their individual research data in a timely and complete fashion (i.e., raw data and not just summary results, where feasible).
4.  **Oversight.** Each member must at all times maintain current Institutional Review Board (IRB) approval or local equivalent, and will work with PersonalGenomes.org to continue to implement identified best practices for responsible public genomics research.
5.  **Not for profit.** The research project is managed or sponsored by a non-profit organization (or local equivalent). In addition, other than purposes of reasonable cost recovery, the member shall not sell or license participant data or tissues.
{%- endcapture -%}

{{ global_guidelines | markdownify }}

</div> <!-- .col-xs-12 -->

</div> <!-- /#projects .row -->

</div>

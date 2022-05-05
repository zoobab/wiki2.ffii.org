1.  1.  -\*- dok: [FfiiFront](FfiiFront "wikilink"); lang: en; coding:
        iso-8859-1; mode: fundamental; -\*-
    2.  datum: 2004-12-23
    3.  keywords: FFII, web, collaboration, SSI, CVS, front pages, news

# Editing the Front Pages www.ffii.org and swpat.ffii.org {#editing_the_front_pages_www.ffii.org_and_swpat.ffii.org}

-\> \[ [ FFII Web](WebstylEn "wikilink") \| [ MLHT](MlhtEn "wikilink")
\| [ CVS](CvsadmEn "wikilink") \| [ genba](GenbaEn "wikilink") \| [
Web](WebstylEn "wikilink") \| [Discussion
Forum](http://lists.ffii.org/mailman/lists/webstyl-parl/ "wikilink") \|
[Newsletter
Forum](http://lists.ffii.org/mailman/lists/webstyl-news/ "wikilink") \|
[ Project News](FfiiprojNewsEn "wikilink") \]

------------------------------------------------------------------------

The pages of www.ffii.org and swpat.ffii.org make intensive use of
Apache server-side include directives. They contain external chunks that
can be edited independent of the page itself. This makes it easy to add
a new news item, campaign button or language link and to modify some
elements, such as campaign buttons, centrally.

## Examples of included chunks {#examples_of_included_chunks}

-   <http://swpat.ffii.org/banner0.en.html>
-   <http://swpat.ffii.org/banners.fr.html>
-   <http://swpat.ffii.org/cnino.en.html>
-   <http://swpat.ffii.org/links.en.html>
-   <http://swpat.ffii.org/langs.en.html>
-   <http://swpat.ffii.org/google.fr.html>
-   <http://swpat.ffii.org/deskr.de.html>
-   <http://swpat.ffii.org/valid.en.html>

## Finding out which SSI files exist {#finding_out_which_ssi_files_exist}

` $ grep "--#include" /var/www/ffii/index.en.html`\
`   `

## Example: Newsitems files \"cnino.xx.html\" {#example_newsitems_files_cnino.xx.html}

Here you can edit the \"press releases\" column for the english version
of the swpat.ffii.org page:

`   genba:/var/www/swpat/cnino.en.html`\
`   cvs.ffii.org:/var/www/cvs/mlht/www/swpat/cnino.en.html`

For the German version of the www.ffii.org page:

`   genba:/var/www/ffii/cnino.de.html`\
`   cvs.ffii.org:/var/www/cvs/mlht/www/ffii/cnino.de.html`

The naming conventions for all other SSI components, languages etc
follow this pattern:

-   cnino: News
-   langs: language flags
-   banner0: optional banner below first header (e.g. \"Thank you
    Poland!\")
-   banners: multiple banners at top of text body

## CVS or direct editing? {#cvs_or_direct_editing}

The group of people who decides what is put on the front pages will be
small, and they will directly access genba.ffii.org. They will see if
there is any new proposal in CVS and decide whether they merge it into
their version. Possibly they will consult CVS for some languages (e.g.
czech, polish) while they may prefer to directly edit by hand on the
machine for others.

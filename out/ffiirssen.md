1.  1.  -\*- dok: [FfiiRss](FfiiRss "wikilink"); lang: en; coding:
        iso-8859-1; mode: fundamental; -\*-

# RSS Newsfeeds from FFII {#rss_newsfeeds_from_ffii}

\--\> \[ [ cnino2rss](Cnino2rssEn "wikilink") \|
[newsfeeds](http://www.ffii.org/news/rss/ "wikilink") \| [ document
attributes](DokDataEn "wikilink") \]

------------------------------------------------------------------------

RSS has become a popular format for sharing news between sites. What RSS
newsfeeds are available from FFII? How are they generated? How can FFII
editors optimise their writings with regard to RSS ?

## News & Chronology {#news_chronology}

-   2005-02-07 feklee creates Shimbun module for reading FFII RSS feeds
    with several EMACS based mail/news readers (see below).
-   2004-12-?? Miernik integrates Newsfeed in his FFII.Pl site
-   2004-10-29 dietvu provides version 0.01 of [
    cnino2rss](Cnino2rssEn "wikilink"), the script that immediately
    starts producing [FFII RSS
    newsfeeds](http://www.ffii.org/news/rss/ "wikilink")
-   2004-04-00 FFII starts generating news mainly on
    [kwiki](http://kwiki.ffii.org/SwpatcninoEn "wikilink")
-   2004-02-00 newsfeeds produced from static web pages thanks to an
    externally supplied script

## Rules for Producing RSS-optimised Webpages {#rules_for_producing_rss_optimised_webpages}

-   RSS-optimised webpages are also optimised for various other
    purposes. They will be better interwoven and receive more attention
-   Knowledge about RSS optimisation is not a prerequisite for editing
    kwiki pages.
-   The structure in kwiki pages is invisible. Pages that match the
    structure can be processed by cronjobs

### Example

The following is an example of an optimally marked-up page.

` # -*- coding: iso-8859-1; dok: `[`EictaGoebbels041231`](EictaGoebbels041231 "wikilink")`; lang: en -->`\
` # kewyords: ....`\
` = 2004-12-31 EICTA wins Goebbels Award 2004`\
` -->`\
` [ ...`\
` ]`

` -------------`

` ``{{http://www.goebbels-award.org/logo.png}}`{=mediawiki}

` This year's award for the most innovative way of presenting a lost cause in the media went to the European Information and Communication Technology Association (EICTA). ...`

` == Full Text of the Speech`

` ...`

Some of the markup here is separated from the text by comment syntax
(#), some is woven into the text.

The \"date\", \"title\" \"description\" items can be identified by a
parser. The \"title\" is part of the first heading. It must be a
1st-level heading (one \'=\'). It can start with a date, which is then
removed from the title. The description is the first continuous
paragraph, without any markup or links, that comes between the header
section (which ends with a horizontal line) and the first subheading
(which must be 2nd-level heading beginnint with \'==\' ). Alternatively,
any element, be it title, description, date or whatever, can be included
by after a comment sign (#), followed by a space, the element name, a
colon, a space and the contents, e.g.

` # date: 2004-12-31`\
` # keywords: EICTA, media, campaign, creativity`\
` # description:  This year's award for the boldest ...`

Any such explicit tag takes precedence over tags that are woven into the
text.

Tags can also be specified using the emacs syntax for file attributes
(local variables), either in the first line or at the bottom of the
page. This is interesting for certain kinds of tags. [
phm](HartmutPilchEn "wikilink") has a set of emacs lisp routines that
use this data for triggering certain conditions in Emacs and maintaining
local copies of kwiki pages.

## RSS Readers {#rss_readers}

-   Many EMACS based mail/news readers together with the Shimbun module
    sb-ffii.el included in the package emacs-w3m version 1.4.4 (and
    probably upcoming/newer versions).
-   Mozilla Thunderbird

## To Do {#to_do}

-   Generate newsitems for use on various ffii front pages (e.g. in HTML
    for inclusion with Apache sever-side includes)
-   Much of the information in the above section \"Rules for Procuding
    \...\" should probably be moved to [DokDataEn](DokDataEn "wikilink")
    or similar, since it is not RSS-specific.
-   [ improve cnino2rss](Cnino2rssEn "wikilink") (see to-do-list)

1.  1.  -\*- dok: [FfiiPortal](FfiiPortal "wikilink"); lang: en; coding:
        iso-8859-1; mode: fundamental; -\*-

# FFII Portal Specification {#ffii_portal_specification}

\--\> \[ [ francais](FfiiPortalFr "wikilink") \] \[ [ FFII Web
Design](WebstylEn "wikilink") \| [ FFII Project
News](FfiiprojNewsEn "wikilink") \| [ Software Patent
News](SwpatcninoEn "wikilink") \| [ FFII
Projects](FfiiprojEn "wikilink") \| [ FFII
Priorities](FfiiprojPriorEn "wikilink") \| [
Metadata](DokDataEn "wikilink") \]

------------------------------------------------------------------------

## News & Chronology {#news_chronology}

-   2004-11-02 [ EU webportal](FfiiPortalEn "wikilink") IRC session, new
    [todo
    list](http://eu.ffii.org/workspaces/pub/intern/agenda/view "wikilink")
    worked out
-   2004-11-02 [public workspaces on FFII EU
    portal](http://eu.ffii.org/workspaces/pub/ "wikilink") now freely
    viewable by any user
-   2004-10-29 phm rewrites the [eu.ffii.org
    homepage](http://eu.ffi.org/ "wikilink")
-   2004-10-22 nexedi and dekkers make eu.ffii.org point to new server
-   2004-10-09 jmaebe brings presentable [conference
    program](http://eu.ffii.org/sections/bxl0411 "wikilink") to the web,
    see also [SwpTest0411En](SwpTest0411En "wikilink")
-   2004-09-21 [public workspaces on FFII EU
    portal](http://eu.ffii.org/workspaces/pub/ "wikilink") now freely
    editable by any authenticated user
-   2004-08-24 [ new ffii portal](FfiiPortalEn "wikilink") moving to
    [destination machine](http://eu.ffii.org/ "wikilink")
-   2004-08-24 [ Sectioning
    proposals](FfiiPortalEnSectionProposals0408En "wikilink")
-   2004-08-24 <http://eu.ffii.org> points to 212.43.237.77, will be set
    up there today, irc scheduled for tonight 22.00, but kevin not there
-   2004-08-17 kevin participates in [ irc meeting](IrcEn "wikilink")
-   2004-08-05 nexedi [multilingual utf-8
    demo](http://showroom.nexedi.org:10573/ffii.org/sections/encoding_tests "wikilink")
-   2004-07-25 [ IRC](IrcEn "wikilink") meeting of portal project at
    22.00
-   2004-07-25 [ ffii document metadata structure](DokDataEn "wikilink")
    documentation started
-   [2004-07-15 nexedi presents
    prototype](http://showroom.nexedi.org:81/ffii.org "wikilink"), [join
    it](http://showroom.nexedi.org:81/ffii.org/join_form "wikilink"),
    [log
    in](http://showroom.nexedi.org:81/ffii.org/login_form "wikilink")
-   2004-07-08
    [ComputingRestructuring](ComputingRestructuring "wikilink") proposal
    gaining support
-   2004-06-23 miluz offers a machine
-   2004-06-23 Nexedi offers 1 man-month in July for 500 eur for
    implementing portal specification
-   [2004-06-21 Prototype for new FFII web
    portal](http://www.nuatech.com/contact/web/ffii/ "wikilink") by
    Ronan Burke (ronan) of [Nuatech](http://www.nuatech.com "wikilink")
    (Irish web design company)

## Purpose of this Project {#purpose_of_this_project}

Work out [prototype](http://showroom.nexedi.org:81/ffii.org "wikilink")
and specifications for the new FFII portal, implement.

These will be further elaborated and implemented by
[Nexedi.com](http://www.nexedi.com/ "wikilink") using
[CPS3](http://zope.org/Members/nuxeo/Products/CPS3 "wikilink") starting
during July 1-31 (four working weeks of an apprentice/stagiaire).

As a mailing list for discussion in English on this project, use
[webstyl-parl](http://lists.ffii.org/mailman/listinfo/webstyl-parl/ "wikilink"),
for discussions in french use
[fr-parl](http://lists.ffii.org/mailman/listinfo/fr-parl/ "wikilink")

## Content Structure {#content_structure}

-   5 main sections, one manager for each
-   to be specified in detail on the page itself

## Requirements

-   scope of content
    -   -   the portal is oriented primarily toward the EU, could be
            called eu.ffii.org at first, perhaps www.ffii.org later

`    * renaming to www.ffii.org could be done by means of apache rewrite rules that gradually overwrite the existing www.ffii.org namespace`

-   -   we can not expect all ffii.org site content to move to this
        portal. Instead we can try to make it easy for other sites to
        integrate themselves with this site
    -   all pages of this portal must be perfect and current all the
        time. There needs to be a limited and highly motivated group of
        maintainers, some perhaps paid. Elaborate access managment (as
        possible under Zope & Co) is desirable.
    -   example of sites that with limited but focussed content are

`    * `[`http://www.patentverein.de/`](http://www.patentverein.de/)\
`    * `[`http://www.esr-pollmeier.de/swpat/`](http://www.esr-pollmeier.de/swpat/)\
`    * `[`http://www.eu04.com/`](http://www.eu04.com/)

-   variants, multilinguality
    -   -   documents have variants, based on language and other
            parameters (one of the strong points of
            [CPS3](CPS3 "wikilink"))
-   interoperation through database
    -   -   the portal has access to the central ffii database and other
            databases which are currently on genba.ffii.org under
            postgresql with local port 5432 (accessible via ssh)
        -   documents have identifiers, !URLs are calculated from these
            identifiers based on data provided in central ffii database
            tables dokprop et al, based on a document name rule language
            such as found in
            <http://swpat.ffii.org/papri/europarl0309/nodes.txt>.
        -   some documents may be connected to kwiki pages which can be
            read from ffii database table wikipag
-   interoperation through CSS
    -   -   we try to use a common set of naming for blocks between the
            portal and the swpat.ffii.org site
        -   we try to confine layout specification to CSS files which
            can be used by other ffii.org sites. This includes
            documentation of the current CSS tags used.
-   interoperation on News, content syndication
    -   -   our current newsticker is
            <http://kwiki.ffii.org/SwpatcninoEn> and it will continue to
            be like this.
        -   We can try to share news items by creating a form in [
            Aktiv](AktivEn "wikilink") or elsewhere which produces a
            news item both on kwiki and on the new portal and through
            RSS (so as to facilitate sharing by other sites)

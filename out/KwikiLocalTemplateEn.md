1.  1.  -\*- dok: [KwikiLocalTemplate](KwikiLocalTemplate "wikilink");
        lang: en; coding: iso-8859-1; mode: fundamental; -\*-

# Kwiki Page Templates {#kwiki_page_templates}

\--\> \[ [ kwiki](KwikiEn "wikilink") \| [ display
template](KwikiLocalTemplateDisplayEn "wikilink") \| [ edit
template](KwikiLocalTemplateEditEn "wikilink") \| [ FFII Project
News](FfiiprojNewsEn "wikilink") \]

------------------------------------------------------------------------

The kwiki local template files determine the structure of kwiki pages as
they are displayed, edited or otherwise processed.

## News & Chronology {#news_chronology}

-   2004-10-31 phm simplifies changes the [
    display](KwikiLocalTemplateDisplayEn "wikilink") and
    [KwikiLocalTemplateEditEn](edit "wikilink") templates to make sure
    people can easily log in and find info on acquiring an editor status

## Purpose of phm\'s changes of 2004-10-31 {#purpose_of_phms_changes_of_2004_10_31}

-   take account of the fact that most kwiki pages are now
    write-protected
-   take account of the fact that kwiki is no longer mainly and addenda
    system
-   let new users immediately find out how they can get write access
-   let editors switch to editing mode by 2 or less clicks in the upper
    left corner
-   remove addenda-related explanation text: this is still found at the
    bottom and it the it is now implicit in the title of the addenda
    pages, which links back to the associated static page.
    -   -   phm previously already shortened this text
        -   our system should be minimalistic, as little repetitive text
            and as large an editing space on the screen as possible
-   remove possibility of deleting an entire page in the [ edit
    template](KwikiLocalTemplateEditEn "wikilink"): this is too easy to
    do by accident and too easy to abuse. We normally need to maintain a
    record of changes of a kwiki file.

## Details about the File Structure {#details_about_the_file_structure}

The files discussed here are found on [ genba](GenbaEn "wikilink") in
*var/www/cgi-bin/kwikimj04/local/template*.

## To Do {#to_do}

-   incorporate [ document metadata](DokDateEn "wikilink") in
    \_header.html

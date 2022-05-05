# 2004-08-17 DOKPROP: table for document metadata {#dokprop_table_for_document_metadata}

\--\> \[ [ document metadata](DokDataEn "wikilink") \| [
traprop](MlhtDbTrapropEn "wikilink") \| [
fmtprop](MlhtDbFmtpropEn "wikilink") \| [ MLHT DB](MlhtDbEn "wikilink")
\]

\-\-\--

## News & Chronology {#news_chronology}

-   2004-08-16 this page created
-   2004-08-14 table \'dokprop\' becomes primary source for document
    metadata
-   2004-08-02 table \'dokprop\' created to store document metadata

## Outline

-   the table should contain all data which are linked to all documents,
    including
    -   -   data needed to generate the document\'s name (such as
            PREDOK, PRETYP, DOKNOM, DOKDIRP)
        -   author, date

```{=html}
<!-- -->
```
-   apart from this table, there are similar tables for language and
    output-format specific versions of the document

## fields

-   DOK: the document
-   PREDOK: previous document
-   PRETYP: type of sequence in which it is \"previous\":
    -   -   1: side by side
        -   2: head of group whose members are positioned side by side
            under one directory
        -   3: head of group of which the present document is a
            subdirectory
-   DOKDIRP: whether the document is a directory
    -   -   DOKDIRSP: whether documents below this one are all
            directories

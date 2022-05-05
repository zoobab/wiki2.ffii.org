1.  1.  -\*- dok: [SwpatLangtxt](SwpatLangtxt "wikilink"); lang: en;
        coding: iso-8859-1; mode: fundamental; -\*-

\--\> \[ [ MLHT](MlhtEn "wikilink") \| [ MLHT
Import](MlhtImportEn "wikilink") \| [ GPG](MlhtImportGpgEn "wikilink")
\| [ Project News](FfiiprojNewsEn "wikilink") \]

------------------------------------------------------------------------

## News & Chronology {#news_chronology}

-   2005-01-11 phm adds [ password check and PGP/GPG encryption
    support](MlhtImportGpgEn "wikilink")
-   2004-09-12 Beta test of mlhtimport2 at ffii org is started. If there
    is some problem which is fixed by using the mlhtimport address
    directly, save the mail you sent to mlhtimport2 to a mbox mail
    folder, overwrite your password and send this mbox file to gilles.
-   2004-08-17 translations can now be registered in the database table
    [ traprop](MlhtDbTrapropEn "wikilink")
-   2004-07-25 kwiki pages for [ mlht](MlhtEn "wikilink") and [ document
    metadata](DokDataEn "wikilink") started
-   2004-07-24 Added generation of [LaTeX](LaTe "wikilink")/PDF: By
    default only html is compiled, but in the local variables section,
    it is now possible to add a line \'\# fmts: (latex html) ;\' to
    cause compilation of the latex/pdf version.

## Todo

-   introductory section at \"How it works\" roughly like the following:
    If you want to translate a page, follow the \"Txt\" icon (image of
    the icon) at the top of page and download the page to your machine.
    You edit the downloaded file (more on the file format below). Once
    you have edited, please send the file to mlhtimport AT ffii DOT org
    where it will be automatically processed. Edited pages usually show
    up within \... minutes given that there are at least 3 paragraphs
    translated.

------------------------------------------------------------------------

Some mail transport programs cut long lines and insert something like
\"!\\n \".

Possible solutions are:

1.  Introduce more line breaks (mlht.el allows tagged blocks to consist
    of multiple lines!)
2.  send to mlhtimport at a2e de as an attachment (not tried if it
    works)
3.  hack mlht.el so that it deletes the combination of \"!\\n \"
4.  fix the mail transport programs
5.  use [perl
    script](http://brablc.com/download.php?filename=mlhtimport.pl "wikilink")
    as a mail transport program (tested with
    [ActivePerl](http://activestate.com/Products/ActivePerl/ "wikilink")
    on Windows)

## Sending with an E-Mail-Programm {#sending_with_an_e_mail_programm}

e.g. MS-Outlook on Windows:

`To: mlhtimport at a2e.de`\
`Subject: coding: iso-8859-1`\
`Body: ``<the lines of the new version including language code>`{=html}

You might (probably) not be able to use attachments, since you cannot
ensure the correct encoding trough that method!

The specification of the coding scheme has to be in the subject line,
since that is the only unencoded line. If the body is encoded e.g. in 16
bit wide UTF-16, then the respective option line cannot be parsed by
principle.

### Special Hints for MS-Outlook-Express 6.0 {#special_hints_for_ms_outlook_express_6.0}

MS-Outlook-Express 6.0 offers the option to change the character
encoding for new e-mails. Normally e.g. Western Europe (ISO =
iso-8859-1) is the default. In the extended settings you will find even
an entry for Unicode (UTF-8). When you have changed the character
encoding, then you will spot an appended \"(UTF-8)\" in the headline of
your mail window. You can a put such a pre-configured mail as template
on your Desktop by using the save-as menu entry.

MS-OE can be configured for line length in a range up to 132 characters
for sending e-mail. Try to do set it up to the maximum length and apply
as much line breaks as needed, especially before and after a %(\...)
statement. Good luck so that you never want to edit a statement of that
sort which exceeds 132 chars.

### Commandline Recoding Tool for Windows {#commandline_recoding_tool_for_windows}

On the homepage of the free universal packer 7zip, you can find the mini
commandline tool [Convert Text
1.00](http://www.7-zip.org/dl/utils/ct100zip "wikilink") for download.
Its description can be found online on the Links-\>Utils page of the
[7zip homepage](http://www.7-zip.org "wikilink").

------------------------------------------------------------------------

Please setup account-name and password in the options section of your
text. An account can be created at <http://aktiv.ffii.org>.

------------------------------------------------------------------------

Big Exclamation:

When you are opening a (, then please close it \_\_once\_\_. Else this
will lead the converter on the server to a sudden halt - and you will
currently(!) for technical reasons not get any sort response on your
submission.

------------------------------------------------------------------------

## FAQ

Questions:

-   1\. Will i get a confirmation or a reject from the service?
-   2\. Are those #-chars and the space at the options important as
    well?
-   3\. Which options options are absolutely needed in the text? Which
    one should i strip off?
-   4\. Is those HTML-Headline important or not?

Answers:

-   1\. Yes, but only if the server software does parse the file without
    faulting.

Sample:

`From: mlhtimport at a2e.de`\
`Subject: compilation result`\
`Records title, sWW, ror and lpi were successfully imported into the database.`\
`Document cecms040202 was recompiled successfully in languages en and de.`

Reading this will tell you, that the mentioned lines got integrated into
the german language page (de) and that the page was newly created. This
further lead to the need to integrate the flag symbol into the other
language versions, meaning the existing english page (en) got updated as
well.

-   2\. Important is the leading \# + space, plus the trailing
    semicolon.
-   3\. Please copy all options, change the account name, the password
    und (important!) the language if needed. The target encoding will
    currently be determined by the servers setup, which is fixed to
    utf-8, and should generally not be changed in the options.
-   4\. The HTML-Headline is obviousely of no importance, or does
    possibly even introduce some problems for the processing. You better
    leave that thing out of your submission.

------------------------------------------------------------------------

### Bugs of the mlhtimport service and the txl file generator {#bugs_of_the_mlhtimport_service_and_the_txl_file_generator}

-   when you do receive a txl file via the web-interface, the (\...)
    aren\'t always encoded in %(pe:\...) style.
    -   -   What does this mean?
-   when a message with a false username/password pair is sent, you will
    never get any reply
-   if your mail software does break up the lines in between a %(\...)
    statement, the submission will fail without any sort of reply
-   if your sent mail does contain comments with \"( or )\" on a comment
    line and you got line wrapped, then your submission will silently
    fail.
-   when you do get a reply, please be prepared to get it in varying
    languages. if for example en, fr and de web pages is changed due to
    creation of a new page in your language, it might happen that you
    get the reply in any of the languages of the other pages..

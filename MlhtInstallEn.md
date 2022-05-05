1.  1.  -\*- dok: [MlhtInstall](MlhtInstall "wikilink"); lang: en;
        coding: iso-8859-1; mode: fundamental; -\*-

# Installing and Getting Started with the [MultiLingual](MultiLingual "wikilink") [HyperText](HyperText "wikilink") (MLHT) system {#installing_and_getting_started_with_the_multilingual_hypertext_mlht_system}

\--\> \[ [ MLHT](MlhtEn "wikilink") \| [ MLHT DB](MlhtDbEn "wikilink")
\| [ ffii computing](PolisEn "wikilink") \| [ genba](GenbaEn "wikilink")
\| [ Project News](FfiiprojNewsEn "wikilink") \]

------------------------------------------------------------------------

Install mlht.el and other files on your local computer and get started
editing and compiling some example source files from the FFII software
patent documentation.

## News & Chronology {#news_chronology}

-   2004-11-24 phm creates this page

## Prerequisites

-   Emacs V 21.3, probably any version starting from 20 is ok or nearly
    ok) with lisp packages
    -   -   cl (Common Lisp emulation)
        -   apel (path search utility)
        -   UCS-Mule (unicode support)
        -   Eric Marsden\'s Postgres Support package pg.el (currently
            supplied as part of mlht)
-   To make the !LaTeX compilation run perfectly (not needed if you just
    want to edit files and make sure that they are correct):
    -   -   !TeTeX
        -   to support East-Asian languages

`    * Cyberbit TTF font`

-   -   in the future we may chose to work with ucs-latex
    -   PostgreSQL on your own machine if you want to be able to work
        offline

## Database Connection {#database_connection}

To work with the mlht system, you need to have a connection to the FFII
database or a similar database. Directly connecting to the live database
on genba via an ssh tunnel is probably the best choice.

\--\> [MlhtDbEn](MlhtDbEn "wikilink")

## The Files {#the_files}

On genba, you find the latest files at

`   /usr/share/emacs/21.3/site-lisp/mlht/`

or in the CVS direcory

`   cvs.ffii.org:/var/cvs/mlht/`

Pack this directory into a compressed archive, transfer it to your
computer, unpack it in the site-lisp directory of your Emacs
installation.

Make sure that all lisp files in that path can be invoked in your Emacs.
This could be done by ensuring that

`   /usr/share/emacs/21.3/site-lisp/subdirs.el`

is there or by editing the emacs initialisation scripts.

You need in particular the following file

`   mlht/sys/mlht.el`

Aliases for deprecated definitions are foundin

`   mlht/sys/mlht-deprek.el `

The following is useful mainly in East-Asian contexts but may be
required nevertheless:

`   mlht/sys/hanzi.el`\
`   mlht/sys/cjknum.el`

The following may be used upon initialisation in order to byte-compile
the lisp files.

`   mlht/sys/make-mlht-elc.el`

The following provide basic routines needed by mlht and by some other
programs:

`   mlht/bas/lisp-basis.el`\
`   mlht/bas/daten-basis.el`\
`   mlht/bas/string-basis.el`

The following byte-compiles the above lisp files and may be invoked
during initialisation:

`   mlht/bas/make-basis-elc.el`

In

`   mlht/app/`

you find source tests for FFII web pages. Among them, the following are
particularly important:

`   mlht/app/ffiidir.el`\
`   mlht/app/swpatamendb.el`\
`   mlht/app/swpatdir.el`\
`   mlht/app/ffii/proj.el`\
`   mlht/app/ffiirc.el`

In some cases you may need the files

`   mlht/app/nodes/*nodes`

and link them into your local HTML tree in the following way:

`   $ ln -s $PWD/mlht/app/nodes/swpatnodes $FFII/swpat/nodes.txt`\
`   $ ln -s $PWD/mlht/app/nodes/paprinodes $FFII/swpat/papri/nodes.txt`

etc. Currently the MLHT system is moving away from the use of such
document (node) property definition files and instead defining all
documents in the database. See below on how to insert new documents into
the document tree.

Moreover the following may be needed:

`   mlht/init/emacs-versions.el`\
`   mlht/init/emacsrc.el`\
`   mlht/init/make-basis-elc.el`\
`   mlht/init/ffii-init.el`

Just in case, install them all, and evaluate the following, possibly
from your .emacs (initialisation) file:

` (defun find-eval (basename)`\
`  (let (file buf)`\
`    (and    `\
`   (setq file (file-installed-p basename))`\
`   (setq buf (find-file-read-only file))`\
`   (eval-buffer buf)`\
`   ) ) )`

` (find-eval "ffii-init.el")`\
` (find-eval "mlht.el")`\
` (require 'mlht-deprek)`\
` (mlht-require 'ffii)`\
` (require 'swpatdir)`

## Basic Operations {#basic_operations}

Then open a sample file, such as e.g. mlht/app/ffii.el.

Select a document using

`   M-x mlht-selekt`

This command should be bound to the keys \'C-c C-m s\'.

This command allows you to select

-   language for evaluating (ML \...) expressions
-   range of languages for compiling
-   output format for evaluating ml expressions
-   range of output formats for compiling

Perhaps you want to select only one language and HTML as the only output
format.

After having selected the right document from your buffer, go on with

`   M-x mlht-narrow-to-dokregion`

This command should be bound to the keys \'C-c C-m n\'.

After that you can

-   evaluate multilinugal expressions (like all other lisp expressions,
    by pressing \'C-x C-e\' one letter after the closing bracket).
-   compile the document in question (by evaluating the buffer, i.e. by
    saying \'M-x eval-current-buffer\', which should be bound to keys
    \'Esc \[ \[ F\')

You can also create new ML expressions with random identifiers the
following way:

-   write something like: (ML 0 \"\...\" (fr \"\...\"))
-   after a while, say \'M-x mlht-init-mlids\' or \'C-c C-m i\', and the
    zeroes will be replaced by unique identifiers.

You can read the latest translations from the database into your buffer
by saying \'M-x mlht-insert-langtxts\' or \'C-c C-m I\'.

Normally the database is the source and you edit it only by submitting
translations via knecht at ffii org into the database. But you can also
make the ML expressions in your buffer the source by setting the
variable \'mlht-ciska-mlexp-db-p\' to \'t\' (true), using the \'M-x
set-variable\' command. Then you can directly write into the database by
evaluating individual ML expressions. However when you evaluate the
whole mlhtdoc buffer nothing will be written into the database and the
database will still be the source.

## Inserting new documents into the tree {#inserting_new_documents_into_the_tree}

MLHT documents do not have defined [URLs](URLs "wikilink") but only
properties from which their [URLs](URLs "wikilink") are calculated.

Such properties are in particular stored in the \'dokprop\' and
\'traprop\' tables of the [ mlht/ffii database](MlhtDb "wikilink").

One simple way to define these properties was the one used in the
nodes.txt files, see above. This however is incompatible with the needs
for distributed computing. We now have to use the database as the source
and can use the nodes files only for illustrative purposes, as a means
of bookkeeping.

Currently one way of continuing to use both methods is to write the
document properties into the nodes.txt files according to the simple
definitions and write the same informationdirectly into the database by
evaluating a slightly less readable lisp statement:

` sub swpikmupli ep487110 ep803105 ep287578 ep797806 ep825525  `\
` # (apply 'mlht-ciska-doksub-db 'swpikmupli '(ep487110 ep803105 ep287578 ep797806 ep825525))`

This means that the document group in the last subbracket ([
ep487110](Ep487110En "wikilink")\...) is subordinate to
[SwpikmupliEn](swpikmupli "wikilink"), in the sense that each
subdocument is in a subdirectory of the parent document.

` grp swpiktxtep98 swpiktxtep97 swpiktxtep96 swpiktxtep95 swpiktxtep94 swpiktxtep93`\
` # (apply 'mlht-ciska-dokgrp-db 'swpiktxtep98 '(swpiktxtep97 swpiktxtep96 swpiktxtep95 swpiktxtep94 swpiktxtep93))`

This means that the document group in the last subbracket is group
member of the \'swpiktxtep98\' group but yet lives in the same directory
as the group\'s parent. The group concept is reflected only in how
documents are arranged on navigation menus, not in the directory
hierarchy.

There is a series of verbs of the form \'mlht-ciska-\*-db\' that set
properties of documents in ways analogous to the nodes.txt files. We
need to document this further.

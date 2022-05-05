# Webmir Script: incorporating external web pages into ffii.org {#webmir_script_incorporating_external_web_pages_into_ffii.org}

\--\> \[ [ genba](GenbaEn "wikilink") \]

------------------------------------------------------------------------

-   genba:/var/www/adm/bin/webmir
-   synopsis: webmir [\[\$DOK \[\$DBNAME
    \[\$PORT]($DEBUG "wikilink")\]\]\]
-   function: reads from table webmir of ffii database, uses wget to
    fetch external directories and store them locally
-   examples of thus mirrored directories
    -   -   <http://swpat.ffii.org/gasnu/nl/stud/>
-   invoked by /var/www/adm/bin/daily.knecht from daily knecht cronjob
-   parameter \$DEBUG: 1 for debug, 0 for don\'t debug
-   parameter \$DOK: limit downloading to one document id if present

#!/bin/bash
for i in *.md; do pandoc $i -f markdown -o $(echo $i| sed -e "s/.md/.html/g") --template=easy-pandoc-templates/html/easy_template.html ; done

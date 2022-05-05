#!/bin/bash
set -e -o pipefail
#set -x

# change to directory where script is located
CUR=$(dirname "$0")
WORKING=$CUR/working
[ -n "$TMP" ] && WORKING=$TMP/moin2markdown

PAGENAME=$1
MOINROOT=$2
OUTPUT=$3

if [[ "$OUTPUT" == ""  ]]; then
	echo "Syntax: $0 <PageName> <WikiRootDir> <OutputDir>"
	echo "Example: $0 Certificates /data/webs/DVTech outputdir"
	echo "The wiki root directory should be the one that contains the data directory"
	exit 1;
fi

echo "Processing $PAGENAME..."

mkdir -p $WORKING
mkdir -p $OUTPUT

LATEST_REV=`ls $MOINROOT/data/pages/$PAGENAME/revisions | sort -r | head -n 1`
cp $MOINROOT/data/pages/$PAGENAME/revisions/$LATEST_REV $WORKING/$PAGENAME.wiki

# convert moinmoin to mediawiki
# the moinmoin format is very similar to mediawiki
# here we convert a few things that are different
sed -i "s/^ \*/*/g" "$WORKING/$PAGENAME.wiki"
sed -i "s/^  \*/**/g" "$WORKING/$PAGENAME.wiki"
sed -i "s/^   \*/***/g" "$WORKING/$PAGENAME.wiki"
sed -i "s/^ 1. /# /g" "$WORKING/$PAGENAME.wiki"
sed -i "s/^  1. /## /g" "$WORKING/$PAGENAME.wiki"
sed -i "s/{{{/<pre>/g" "$WORKING/$PAGENAME.wiki"
sed -i "s/}}}/<\/pre>/g" "$WORKING/$PAGENAME.wiki"

# auto convert camel case moinmoin to link in mediawiki
sed -i -r 's/ ([/]?[A-Z][A-Za-z0-9]+[A-Z]+[a-z0-9]+)/ [[\1]]/g' "$WORKING/$PAGENAME.wiki"

# remove ''''''
sed -i "s/\([A-Z]([A-Z0-9]*[a-z][a-z0-9]*[A-Z]|[a-z0-9]*[A-Z][A-Z0-9]*[a-z])[A-Za-z0-9]*\)/[[\1]]/g" "$WORKING/$PAGENAME.wiki"

# Start table handling; PAA - omit for Markdown??
# This table handling is a hack because we actually convert straight to confluence format and not mediawiki format

# handle 8 column tables
#sed -i "s/^||\(.*\)||\(.*\)||\(.*\)||\(.*\)||\(.*\)||\(.*\)||\(.*\)||\(.*\)||/<tr><td>\1<\/td><td>\2<\/td><td>\3<\/td><td>\4<\/td><td>\5<\/td><td>\6<\/td><td>\7<\/td><td>\8<\/td><\/tr>/g" "$WORKING/$PAGENAME.wiki"

# handle 7 column tables
#sed -i "s/^||\(.*\)||\(.*\)||\(.*\)||\(.*\)||\(.*\)||\(.*\)||\(.*\)||/<tr><td>\1<\/td><td>\2<\/td><td>\3<\/td><td>\4<\/td><td>\5<\/td><td>\6<\/td><td>\7<\/td><\/tr>/g" "$WORKING/$PAGENAME.wiki"

# handle 6 column tables
#sed -i "s/^||\(.*\)||\(.*\)||\(.*\)||\(.*\)||\(.*\)||\(.*\)||/<tr><td>\1<\/td><td>\2<\/td><td>\3<\/td><td>\4<\/td><td>\5<\/td><td>\6<\/td><\/tr>/g" "$WORKING/$PAGENAME.wiki"

# handle 5 column tables
#sed -i "s/^||\(.*\)||\(.*\)||\(.*\)||\(.*\)||\(.*\)||/<tr><td>\1<\/td><td>\2<\/td><td>\3<\/td><td>\4<\/td><td>\5<\/td><\/tr>/g" "$WORKING/$PAGENAME.wiki"

# handle 4 column tables
#sed -i "s/^||\(.*\)||\(.*\)||\(.*\)||\(.*\)||/<tr><td>\1<\/td><td>\2<\/td><td>\3<\/td><td>\4<\/td><\/tr>/g" "$WORKING/$PAGENAME.wiki"

# handle 3 column tables
#sed -i "s/^||\(.*\)||\(.*\)||\(.*\)||/<tr><td>\1<\/td><td>\2<\/td><td>\3<\/td><\/tr>/g" "$WORKING/$PAGENAME.wiki"

# handle 2 column tables
#sed -i "s/^||\(.*\)||\(.*\)||/<tr><td>\1<\/td><td>\2<\/td><\/tr>/g" "$WORKING/$PAGENAME.wiki"

# add <table> to start of table
#perl -0777 -i -pe 's/[^>]\r\n<tr>/\r\n<table>\r\n<tr>/g' "$WORKING/$PAGENAME.wiki"

# add </table> to end of table
#perl -0777 -i -pe 's/<\/tr>\r\n[^<]/<\/tr>\r\n<\/table>/g' "$WORKING/$PAGENAME.wiki"

# end table handling

# convert from mediawiki to markdown
pushd $WORKING > /dev/null
pandoc -f mediawiki -t markdown -s $PAGENAME.wiki -o $PAGENAME.md
#echo EXITCODE is $?
popd > /dev/null

# Here we clean up the file names and replace common special characters used
CLEANFILE=$PAGENAME

# apos
CLEANFILE=`echo $CLEANFILE | sed "s/(27)/'/g"`

# space
CLEANFILE=`echo $CLEANFILE | sed "s/(20)/ /g"`

# For subpages / is used, we replace / with __
# /
CLEANFILE=`echo $CLEANFILE | sed "s/(2f)/__/g"`

# -
CLEANFILE=`echo $CLEANFILE | sed "s/(2d)/'/g"`

#echo "$PAGENAME > $CLEANFILE"
mv "$WORKING/$PAGENAME.md" "$OUTPUT/$CLEANFILE.md"
rm -rf $WORKING

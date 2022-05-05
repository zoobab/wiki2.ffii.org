# Preparing mass mails and corresponding response evaluation {#preparing_mass_mails_and_corresponding_response_evaluation}

if you want to send out mails to supporters with checkboxes or other
input forms such that replies are evaluated automatically with results
fed into the FFII database, here is what you have to do.

## Internal preparations (mostly invisible in the mail body) {#internal_preparations_mostly_invisible_in_the_mail_body}

1\. Every person you mail to needs to have an identifier called \"uid\".
This need not be the typical FFII supporter uid as long as you know some
way (or table) to derive the personal data from it.

The uid is limited to 8 characters, typically ASCII lowercase.

2\. The mail gets an internal identifier, called \"issue\" in the
relevant database tables.

Example: \"swp0405_de\" for the mail about german May activities in 2004
to german supporters.

The issue name is limited to 24 characters.

3\. Every input field gets an internal identifier, called \"field\".

Example: \"!NoSpam\" for the checkbox in the line

`[] I do not want to receive further requests from FFII.`

Or \"!ManHoursOffer\" for the number box in

`I can spend [__] hours of time in the next week on this.`

The field name is limited to 16 characters.

4\. Every input field also has a type and perhaps a subtype. The type
determines the SQL data type which is used for storing the field
contents (named \"value\") in the database; the subtype actually
specifies a function used to convert the textual contents to the value
stored. The subtype defines the available syntax and/or additional
checks on the input.

E.g. checkboxes usually have type \"int\" and subtype \"checkbox\". This
means that e.g. !\[+\] gives value 1, !\[-\] gives value -1, and !\[\]
yields undef (NULL).

In a numbox, !\[+\] yields undef (NULL) because + is no number, while
!\[\_0.5\_\] yields the valid value 0.5.

Available types, their SQL equivalent, and description:

\|\| int \|\| integer \|\| integer and boolean values \|\| \|\| num \|\|
numeric(16,2) \|\| e.g. monetary values, quantities \|\| \|\| date \|\|
timestamp \|\| date (and time) specs \|\| \|\| text \|\| text \|\|
strings of text in utf-8 \|\|

Available subtypes, their types, example inputs, and description:

\|checkbox \|int \|+ \|+/\*/x/X = yes, - = no \| \|numbox
\|int/num\|2.50 \|any number in decimal \| \|datebox \|date \|2004-05-12
\|date [time \[+ tz](+ "wikilink")\] \| \|textbox \|text \|now or never
\|text string, spaces normalized \| \|namebox \|text \|Lehrter Bahnhof
\|ditto, letter case normalized \| \|urlbox \|text
\|<http://www.ffii.org> \|URL, normalized \|

5\. Every form line in the issue needs a corresponding Perl5 regexp (see
perlre(1)) in its associated feedback module to match reply texts
against, and an internal identifier. If the form line contains just one
input field, it is convenient to use the field name as the form line
identifier.

Regexp fragments for input fields must contain parentheses to capture
the content. Non-input fragments shall not use such capturing
parentheses, but may use the Perl5 (?:\...) construct. The regexps shall
be made such that surrounding spaces and perhaps underscores are not
included in the captured content. Note also that you need not use
delimiting brackets because they do not belong to the content either.
You may even decide to hide input fields in ordinary text without extra
markup. However, users would not immediately recognize what they can and
cannot change in such lines. They might even write such lines all by
themselves, but in another context. Therefore, you should indicate
clearly where users are supposed to change content.

Example: The form line

`[] I have read the instructions.`

could be matched with the Perl5 regexp

`qr{`$$\s*(\S*?)\s*$$`\s*I\s+have\s+read\s+the\s+instructions\b}i`

while

`I will donate [___] EUR`

could be matched with

`qr{\bI\s+will\s+donate\s*`$$[_\s]*([^][]*?)[_\s]*$$`\s*EURO?\b}i`

Notes:

-   The regexp is not anchored, neither to beginning nor end of line,
    because e-mail replies often include more or less strange forms of
    quoting.

```{=html}
<!-- -->
```
-   The feedback system ensures that, in case of several matching lines,
    later matches with more or same indentation are ignored. Think about
    that.

```{=html}
<!-- -->
```
-   The use of non-greedy quantifiers like \*? can help to strip
    trailing void characters such as spaces or underscores from input
    field contents.

```{=html}
<!-- -->
```
-   Spaces should be matched by \\s+ or \\s\* depending on whether they
    separate alphanumeric letters or other characters.

```{=html}
<!-- -->
```
-   Non-ASCII characters are often recoded or eliminated in replies.
    Please match any sequence of non-ASCII letters with \\S\*? .
    Unfortunately, this works only in latin-based languages where
    non-ASCII characters are rare.

```{=html}
<!-- -->
```
-   Exclude irrelevant words or punctuators from the end(s) of the form.
    You may however add \\b to test for a word boundary.

```{=html}
<!-- -->
```
-   Make irrelevant text such as references like !\[1\] or plural (s)
    optional and reasonably variable in the pattern, e.g. !\[1\]
    \[=-\>\] \[=(?:\\s\*$$\S*$$)?\] , (s) \[=-\>\] \[=$?s?$?\] .

```{=html}
<!-- -->
```
-   In general, try to match only the essential parts so that you can be
    quite sure that the filled form says what you expect, and be
    flexible about the irrelevant parts such as spaces, references, and
    variations in expression.

```{=html}
<!-- -->
```
-   Do not try to restrict field content syntax within the regexp. E.g.,
    do not try to match only digits in num fields. Leave the checking to
    the function associated with the field\'s subtype. The rationale is
    that lines with invalid input must be able to overrule (more
    indented) lines with perhaps valid input.

6\. Additional semantics may have to be worked out for what to do with
captured values once a feedback mail has been read completely. One
standard action which is always performed for every input field with
valid contents simply stores uid, issue, field, and value in one of the
ffii database tables fbint, fbnum, fbtext, or fbdate, depending on field
type. So you could, for example, do the query

`select uid, value from fbnum where issue='swp0405_de'`\
`and field='ManHoursOffer' and value>0;`

This lists uids and the number of work hours offered by the
corresponding persons.

Besides the above fields, the fb\* tables also have two additional
columns: \"read\" and \"ans\", both boolean. These are intended to flag
\"accounted\" and \"answered\" states, and are reset to false in new or
changed records. The feedback system never sets them to true, but you
can do so yourself to keep track of the proceeding.

You may need to describe further operations, e.g. when other database
structures need updates too. For example, a valid !NoSpam input shall
lead to an update of ffii\'s \"asoc\" table, decreasing asolvl to zero
(if it was greater) or increasing it to 1 (if it was less), depending on
whether the value of the !NoSpam field is positive or negative.

You may also want to specify some constraints e.g. that the contents of
some text field are significant only when some other box has been
checked.

Given all that, feedback administrators should be able to program a
corresponding Feedback module.

## Preparation of the issue {#preparation_of_the_issue}

Typically this is done before specifying details for the feedback
module. Here are some hints that you should follow.

1\. Choose and declare an encoding like iso-8859-15 or utf-8 if you use
non-ASCII characters.

2\. Do not forget to specify a subject line!

3\. Indent form lines by one or more blank characters to distinguish
them from surrounding text, but do not use tab characters for indenting.
As mentioned above, indentation is significant, and tabs can lead to
confusion. Secondly, tabs typically waste valuable space, see below.

4\. In every form line, try to fit an unambiguous core message into the
first 60-70 characters of the line, and make the corresponding regexp
match only that fragment. This should avoid trouble with replies where
the text of your issue has been re-wrapped.

5\. Do not prefill form fields with valid data unless they remain
insignificant when the text of the issue is returned without change. In
fact, many mails are returned by daemons for whatever reason, and you
would not want to take that for a real answer.

You may prefill text fields and such, but make sure to also specify
conditions that make them insignificant in the case of an automatic
reply that does not change field contents.

Because of this, checkboxes and numboxes should typically be issued
empty or filled with underscores only, and it should be remarked in the
issue that checkboxes need a \"-\" to declare an explicit \"no\"
(although that is usually the default). (Note: Prefilling urlboxes with
\"!http://\" is ok since that is an invalid URL.)

From the text of the issue and the other accompanying data, feedback
admins can prepare a sending script which should read a list of
uid/e-mail pairs from stdin and send the issue to each one. Uid and
issue get hardcoded into the Message-Id header of each mail (together
with some random string) such that replies will include them in their
In-Reply-To header. Thus, uid and issue can be identified in replies
without the need for a database query trying a reverse mapping from
e-mail to uid. Note however that this scheme does not work without
In-Reply-To header, so if some recipient forwards the issue to another
one (or to himself) who tries to respond, the feedback system will
ignore the response. At least that is the way the feedback handlers
worked so far; new feedback handlers may be programmed differently at
the risk of misidentification.

Finally, you should specify what persons you want to have the issue sent
to. The mass mailing admins can then perform a database query resulting
in uid/email pairs which they feed to the issue-sending script.

Prior to that, the corresponding feedback handler should have been
installed and tested. Testing can be done by feeding an own uid/email
pair to the sending script, awaiting the mail with the issue, replying,
and verifying that the database has been updated as required. (If you
are unsure about the database operations, work on dummy tables instead
of the real ones.) The feedback system also maintains a log file which
should capture any warnings or errors.

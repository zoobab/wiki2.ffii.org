1.  1.  -\*- dok: [WdEstimEn](WdEstimEn "wikilink"); lang: en; coding:
        iso-8859-1; mode: fundamental; -\*-
    2.  datum: 2005-06-21
    3.  url: <http://swpat.ffii.org/log/05/swestimen>
    4.  title: NASA: Writing completely new s/w costs about 20% more as
        based on \"similar design\"

-\> \[ [ Adoption Farce](Cons050307En "wikilink") \| [ 22
Questions](LtrFfiiCons050308En "wikilink") \| [ Meijer
Inquiry](Meijer050319En "wikilink") \| [ Banana Union
Day](Eu0307En "wikilink") \| [ New Illoyalties](Cons050527En "wikilink")
\| [ Patent News](SwpatcninoEn "wikilink") \]

------------------------------------------------------------------------

This article contains some useful numbers:

<http://ceh.nasa.gov/webhelpfiles/Software_Estimation.htm>

Especially interesting is the following table:

-+-

\"Exhibit 6 - 11: Effort Adjustment Multipliers for Software Heritage \"

\|\| Software Heritage Category \|\| Effort Multiplier \|\|

\|New design and new code \| 1.2 \| \|Similar design and new code
(nominal case) \| 1.0 \| \|Similar design and some code reuse \| 0.8 \|
\|Similar design and extensive code reuse \| 0.6 \|

-+-

This confirms that reverse engineering is usually not economically
viable, because you will have a situation that is worse then \"Similar
design and new code\".

\"Similar design and new code\" is based on re-using the experience of
your existing crew. They already know the pitfalls. With
reverse-engineering, you have no code re-use, but although you have a
\"similar design\", you have the additional cost of doing the
painstaking job of the reverse-engineering itself.

In other words: reverse engineering is only interesting if you have a
compelling reason not te develop something yourself. And that reason is
usually that you are forced to be interoperable with something, like for
example the famous Phoenix/IBM BIOS case:

<http://www.computerworld.com/softwaretopics/software/appdev/story/0,10801,65532,00.html>

To protect against charges of having simply (and illegally) copied
IBM\'s BIOS, Phoenix reverse-engineered it using what\'s called a
\"clean room,\" or \"Chinese wall,\" approach. First, a team of
engineers studied the IBM BIOSabout 8KB of codeand described
everything it did as completely as possible without using or referencing
any actual code. Then Phoenix brought in a second team of programmers
who had no prior knowledge of the IBM BIOS and had never seen its code.
Working only from the first team\'s functional specifications, the
second team wrote a new BIOS that operated as specified.

# Streaming the FFII General Assembly @ Imatix {#streaming_the_ffii_general_assembly_imatix}

------------------------------------------------------------------------

*Here is a quick howto on how to setup an audio streaming solution.*

------------------------------------------------------------------------

## [URLs](URLs "wikilink") of available streams {#urls_of_available_streams}

<http://assembly.ffii.org:8000/ffiiga-48k.mp3>

<http://assembly.ffii.org:8000/ffiiga-24k.mp3>

## Darkice streamer {#darkice_streamer}

You can get the sound from your OSS or ALSA sound card, encode it, and
send it to the icecast2 streaming server with darkice. You need to
install liblame if you want to compile it with MP3 support.

Here is the config file used:

`# sample `[`DarkIce`](DarkIce "wikilink")` configuration file, edit for your needs before using`\
`# see the darkice.cfg man page for details`

`# this section describes general aspects of the live streaming session`\
`[general]`\
`duration        = 0        # duration of encoding, in seconds. 0 means forever`\
`bufferSecs      = 2         # size of internal slip buffer, in seconds`

`# this section describes the audio input that will be streamed`\
`[input]`\
`device          = /dev/dsp  # OSS DSP soundcard device for the audio input`\
`sampleRate      = 22050     # sample rate in Hz. try 11025, 22050 or 44100`\
`bitsPerSample   = 16        # bits per sample. try 16`\
`channel         = 2         # channels. 1 = mono, 2 = stereo`

`# this section describes a streaming connection to an `[`IceCast`](IceCast "wikilink")` server`\
`# there may be up to 8 of these sections, named [icecast-0] ... [icecast-7]`\
`# these can be mixed with [icecast2-x] and [shoutcast-x] sections`

`# this section describes a streaming connection to an `[`IceCast2`](IceCast2 "wikilink")` server`\
`# there may be up to 8 of these sections, named [icecast2-0] ... [icecast2-7]`\
`# these can be mixed with [icecast-x] and [shoutcast-x] sections`\
`[icecast2-0]`\
`bitrateMode     = abr                           # average bit rate`\
`format          = mp3                           # format of the stream: patented MP3`\
`bitrate         = 64                            # bitrate of the stream sent to the server`\
`server          = apunkt.ffii.org               # host name of the server`\
`port            = 8000                          # port of the `[`IceCast2`](IceCast2 "wikilink")` server, usually 8000`\
`password        = xxxxxxxxx                     # source password to the `[`IceCast2`](IceCast2 "wikilink")` server`\
`mountPoint      = ffiiga-64k.mp3                # mount point of this stream on the `[`IceCast2`](IceCast2 "wikilink")` server`\
`name            = ffiiga-64k.mp3                # name of the stream`\
`description     = FFII General Assembly         # description of the stream`\
`url             = `[`http://wiki.ffii.org/?FfiiKonv0511En`](http://wiki.ffii.org/?FfiiKonv0511En)`       # URL related to the stream`\
`genre           = Conferen                      # genre of the stream`\
`public          = yes                           # advertise this stream?`

## Streamtranscode

Streamtranscode is used on the server apunkt.ffii.org to reencode the
stream in several bitrates (ex: slow PPP phone lines) or codecs.

## Todo

-   Lower stream for slow PPP connexions
-   Save the stream in a file with darkice
-   Get a sound system with a portable microphone

#!/bin/bash
# ziggurats code 
# text to speech 
# semplice < 100 caratteri

say() { 
    local IFS=+;/usr/bin/mplayer -ao alsa -really-quiet -noconsolecontrols "http://translate.google.com/translate_tts?tl=it&q=$*";
}

say $*
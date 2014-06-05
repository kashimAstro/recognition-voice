#!/bin/bash
# ziggurats code 
# recognition voice google API
# create flac record send google api manipulation

arecord -vv -t wav -d 3 > /dev/null | ffmpeg -loglevel panic -y -i - -ar 16000 -acodec flac file.flac > /dev/null 
wget -q -U "Mozilla/5.0" --post-file file.flac --header "Content-Type: audio/x-flac; rate=16000" -O - "http://www.google.com/speech-api/v1/recognize?lang=it&client=chromium" | cut -d\" -f12  > stt.txt
rm file.flac 

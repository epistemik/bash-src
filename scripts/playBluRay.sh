#!/bin/bash

#
# Cross-Platform Blu-ray Playback Script
# Release 1.0
#
# Depends on having curl, MakeMKV and VLC installed.
#
# Revision History:
#
# 05-OCT-2010:  Initial release.
#

# Is this a Mac?
if [ `uname` == "Darwin" ]; then
	MKVPATH="/Applications/MakeMKV.app/Contents/MacOS/"
	VLCPATH="/Applications/VLC.app/Contents/MacOS/"
else
	MKVPATH=""
	VLCPATH=""
fi

# Make sure we're not already decoding a disc.
killall makemkvcon

# Start streaming the first Blu-ray drive we find.
${MKVPATH}makemkvcon --upnp=1 --cache=128 stream disc:0 &

# Wait for the streaming server to be ready.
RESULT=1
COUNT=0
while [ $RESULT != 0 ]; do
	curl -f http://localhost:51000 -o /dev/null 2> /dev/null
	RESULT=$?
	sleep 1
	# Handle timeouts so we don't leave orphan makemkvcon tasks running.
	(( COUNT=${COUNT} + 1 ))
  # orig limit == 60
	if [ ${COUNT} == 120 ]; then
		killall makemkvcon
		exit 1
	fi
done

# Tell VLC to play the first title of the disc.
${VLCPATH}vlc http://localhost:51000/stream/title0.ts

# Shut down MakeMKV after VLC closes.
killall makemkvcon

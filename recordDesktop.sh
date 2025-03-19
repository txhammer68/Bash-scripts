#!/bin/bash
# Imgur - The maximum file size of non-animated images is 20MB, but the PNG files more than 5MB will be converted to JPEGs. The maximum size of animated images and videos is 200MB, and the video length limit is 60 seconds

function ctrl_c () {
    { kill -15 $appID && wait; } 2>/dev/null
    { kill -15 $$ && wait; } 2>/dev/null
}

sleep 7
ffmpeg -y -thread_queue_size 512  -f x11grab -framerate 30 -video_size 1920x1080 -i :0.0+0,0 -f pulse -ac 2  -i default -c:v libx264rgb -crf 22 -preset medium -color_range 2 -tune zerolatency  /home/data/Videos/Desktop-$(date +%Y-%m-%d)-$(date +%H.%M.%S).mp4 &
appID=$!
sleep 144s
ctrl_c;

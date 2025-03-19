#!/bin/bash
start=`date +%s` > /dev/null
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[1;33m'
cyan='\033[1;36m'
clear='\033[0m'
white='\033[1;97m'

titles=(
"Yellowstone-Season-1-Episode-5"
"Yellowstone-Season-1-Episode-6"
"Yellowstone-Season-1-Episode-7"
"Yellowstone-Season-1-Episode-8"
"Yellowstone-Season-1-Episode-9"
)

epTitle=(
" 5 Coming Home"
" 6 The Remembering"
" 7 A Monster Is Among Us"
" 8 The Unravelling (1)"
" 9 The Unravelling (2)"
)

urlList=(
"https://f8.megacdn.co:2228/v3-hls-playback/674e7ee865d42b2dfa2952952f35850967b9ede3baa8e07207df0d0c581ed9d54347da722d4024fd518d9d737efd62e3f7d6b5319002e575498077f213ca1f8a637f1e1b51714f096ee2c6b1c3cd53c5e1b4e1be75c65b2cb334c75e43553f04b12bde5551adfe6cf4d0321ed493ebbde4528b746227cc80180223ac894506576c49ac384d4015c550214eac98a94e248928e160380e644028a688260996c51cdec55b484adfc965579ee5bdf0519550ea6ec69421057271fc08aeb2587ff1bc/1080/index.m3u8"
"https://f8.megacdn.co:2228/v3-hls-playback/e47bd46d5f03a49ffa1a0f24fe3bc102a022c4e0dc21126a91eb1a7ae269c7da3e85d2f2b46a56b0d2c45629a8711c1c024c70bcc7aff1b5f52b09d0fc65ef7b4d77034284ca7b9a74e4dda6ef71a51d5f3a0d9655a0a4cf41651a6b0518d7dca6c7dfe18404c8b89dded2ff8e05764ccb023c25b51c5163cd3311e4f0cc8ad125b1e384b7d318b7a67eacfbc2842b9606b4c15458975e198d8cb23d82bde2a9df9bd4a8ecced8d454b84f49796fc4ab551d2d8681c344211db67c6e08fd3dcb/1080/index.m3u8"
"https://f8.megacdn.co:2228/v3-hls-playback/e45439c3c6cc4907dfa3d10c4ed50d36e1c614212a92768027714c162a326fe51a88f8f82250ef4f16a83ad7f734c64d2e2994c2efcdaa0d384ee01993e5f62ddb4c844a8f692c277eb55635385f749efeee2686cf350d7d189566861cd094f4fa74cdf52b033fa0ca72c07a998d99d4ab5e4265659488b4a63a8ea431255475e34501cbe917dc906ca4af4f03ba6749bf9faf9134fd867ed5281cd080834bd1ae84cf98939887399749d7ee5199081aaa7acce5b5686641d6b2931d774d7afc/1080/index.m3u8"
"https://f6.megacdn.co:2228/v3-hls-playback/19a2233a6029189e8c0b5e941a012c07908e89e2b3cb786806105cb2cd4dccb6e1475c7fdfd311fc44fec5fc583bb5a4ef49b010bd9bacd95085534bf7273bd0ea998587b050e497f532088a30f221eaa504b7f1e3b9716a5c7086a6b4f6cd84b62490da1b34275bef1ca37f3723669134c580d980ae614801908e4296c57605ada4a5ea72aee9051cc09d3790c7b15ff0398e0005ecad5baf18fa28f3830b1c1b4adaeb2345f9dfe2c3e9c8360b27a8bd919d139d9addb1a4dc580600674307/1080/index.m3u8"
"https://f4.megacdn.co:2228/v3-hls-playback/d8290606735c0d9afb39d2380afa5119f290ef65c76a96e96d8df91714ced821e7ccba7d1fafcdc8b425fb42e54fa6fac43b6ca3060e52b30712ed87177287802a901583d90d5c49442db334b55a6f8199ff998589d0b42b7b6f506035d888d1807c5bd20cb6cce8f2c60439a49198314cc706595c55f322746d60b7a7c6e8faef596e383f61463142f668acbd687f6a8e1b45b78e22b4f66eef2d97409bfc657be4730c4519da79b4a64dbf6df0aad9c730bf7fb68cfc47a92c966c0a77c92b/1080/index.m3u8"
)

x=0
errorCnt=0
url=""
# mediaTitle=""
length=${#urlList[@]}
cnt=$length
((cnt--))
completedList=()
abortedList=()

trap ctrl_c INT

function ctrl_c () {
    { kill -9 $appID && wait; } 2>/dev/null
    { kill -9 $$ && wait; } 2>/dev/null
}

function sleepMode () {
    while /bin/true; do qdbus org.freedesktop.ScreenSaver /ScreenSaver SimulateUserActivity ; sleep 5m; done
}

#"Mozilla/5.0 (X11; Linux x86_64; rv:131.0) Gecko/20100101 Firefox/131.0"
# "Mozilla/5.0 (Linux; arm; Android 9; Redmi 8A) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 YaApp_Android/10.92 YaSearchBrowser/10.92 BroPP/1.0 SA/1 Mobile Safari/537.36"
#"Mozilla/5.0 (Linux; Android 12; moto g stylus 5G (2022)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Mobile Safari/537.36"
ua="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.6613.113/114 Safari/537.36"
#"Mozilla/5.0 (Linux; Android 4.4.2; Aquaris E10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.143 Safari/537.36"


options=( -q -c --progress --ignore-config --hls-prefer-native --no-check-certificate --socket-timeout 6 --no-warnings --concurrent-fragments 1 --retries 10 --fragment-retries 10 --abort-on-unavailable-fragments --retry-sleep 5 )

function getMovie () {
        clear
        echo "Downloading $mediaTitle"
        while ! yt-dlp $url "${options[@]}" --format mp4 -o "$tempFile"; do
            ((errorCnt++));
            if (( errorCnt > 11)); then
                abortedList+=("$mediaTitle");
                break;
            else
                sleep 5;
            fi
        done;
        if ffmpeg -v quiet -y -i "$tempFile" -metadata title="$episodeTitle" -codec copy "/home/data/tvSeries/Yellowstone/$mediaTitle.mp4"; then
            rm "$tempFile";
            rm -f /tmp/New/*.temp
            completedList+=("$mediaTitle");
        fi
}

sleepMode &
appID=$!

for (( i=0; i < ${length}; i++ )) do
    url="${urlList[$i]}";
    mediaTitle="${titles[$i]}";
    tempFile="/tmp/New/${mediaTitle}.mp4"
    episodeTitle="${epTitle[$i]}";
    errorCnt=0;
    getMovie;
    if (( ${cnt} == i )); then  ## skip sleep last iteration
        sleep 1
        clear
    else
        sleep 11
    fi
done
ftime=`date +"%m-%d-%Y %l:%M %P"`
echo " "
echo -e "${yellow}************************************************************************************${clear}"
echo -e "Duration: $((($(date +%s)-$start)/60)) minutes"
if (( ${#completedList[@]} > 0)); then
    echo -e "Completed Downloads: $ftime${white}"
    printf '\t%s\n' "${completedList[@]}"
    # echo -e "${clear}"
fi
if (( ${#abortedList[@]} > 0)); then
    echo -e "${red}Aborted Downloads:${white}"
    printf '\t%s\n' "${abortedList[@]}"
    echo -e "${clear}Check Temp Folder..."
fi
echo -e "${yellow}************************************************************************************${clear}"
ctrl_c

#!/bin/bash

cd "$(dirname "$0")"

source config.env

while getopts ":p:s:t:m:" opt; do
  case $opt in
    p) display_popup="$OPTARG"
    ;;
    s) play_sound="$OPTARG"
    ;;
    t) to_telegram="$OPTARG"
    ;;
    m) message="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

if [[ "$display_popup" == "" ]]; then
    if [[ "$IS_DISPLAY_POPUP" != "" ]]; then
        display_popup="$IS_DISPLAY_POPUP"
    else
        display_popup="true"
    fi
fi

if [[ "$play_sound" == "" ]]; then
    if [[ "$IS_PLAY_SOUND" != "" ]]; then
        play_sound="$IS_PLAY_SOUND"
    else
        play_sound="false"
    fi
fi

message_arg=""
if [[ "$message" == "" ]]; then
    message_arg="Your Script/Codes have completed!"
else
    message_arg="${message}"
fi

if [[ "$to_telegram" == "" ]]; then
    if [[ "$IS_SEND_MESSAGE_VIA_TELEGRAM" != "" ]]; then
        to_telegram="$IS_SEND_MESSAGE_VIA_TELEGRAM"
    else
        to_telegram="false"
    fi
fi

source venv/bin/activate

if [[ "$display_popup" == "true" ]]; then
    if [[ "$play_sound" == "true" ]]; then
        python3 alertme.py --message "$message_arg"
    else
        python3 alertme.py --disable-sound --message "$message_arg"
    fi
fi

if [[ "$to_telegram" == "true" ]]; then
   ./telegram.sh
fi

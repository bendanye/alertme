#!/bin/bash

while getopts ":p:s:t:" opt; do
  case $opt in
    p) display_popup="$OPTARG"
    ;;
    s) run_sound="$OPTARG"
    ;;
    t) to_telegram="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

if [[ "$display_popup" == "" ]]; then
    display_popup="true"
else
    display_popup="false"
fi

if [[ "$run_sound" == "" ]]; then
    run_sound="false"
else
    run_sound="true"
fi

if [[ "$to_telegram" == "" ]]; then
    to_telegram="false"
else
    to_telegram="true"
fi

if [[ "$display_popup" == "true" ]]; then
    if [[ "$run_sound" == "true" ]]; then
        python3 alertme.py
    else
        python3 alertme.py --disable-sound
    fi
fi

if [[ "$to_telegram" == "true" ]]; then
   ./telegram.sh
fi
import os
import argparse

from playsound import playsound
import threading

import PySimpleGUI as sg


def alert():
    args = _parse_args()
    if not args.disable_sound:
        loop_thread = threading.Thread(
            target=__loop_sound, name="backgroundMusicThread"
        )
        loop_thread.daemon = True
        loop_thread.start()

    sg.theme("BluePurple")

    layout = [
        [
            sg.Text("Your Script/Codes have completed!"),
            sg.Text(size=(15, 1), key="-OUTPUT-"),
        ],
        [sg.Button("OK", bind_return_key=True)],
    ]

    window = sg.Window("Alert Me", layout, return_keyboard_events=True)

    while True:
        event, values = window.read()

        if "Return" in event:
            break

        if event in ("None", "OK"):
            break

    window.close()


def _parse_args():
    parser = argparse.ArgumentParser(description="Alert Me")
    parser.add_argument("--disable-sound", action="store_true")

    return parser.parse_args()


def __loop_sound():
    while True:
        playsound(
            f"{os.path.realpath(os.path.dirname(__file__))}/sound.wav", block=True
        )


if __name__ == "__main__":
    alert()

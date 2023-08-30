import os

from playsound import playsound
import threading

import PySimpleGUI as sg


def alert():
    loop_thread = threading.Thread(target=__loop_sound, name="backgroundMusicThread")
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


def __loop_sound():
    while True:
        playsound(
            f"{os.path.realpath(os.path.dirname(__file__))}/sound.wav", block=True
        )


if __name__ == "__main__":
    alert()

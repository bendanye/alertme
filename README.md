# Alert Me

A simple tool that will display a popup window and keep alert you with sound until the popup is closed.  

## Prerequisites

Python 3.7 - 3.9

## Project Setup & Commands

### Install venv

```shell
python3 -m venv .venv
```

### Install required library

#### Windows

```powershell
.venv\Scripts\Activate.ps1

pip install -r requirements.txt
```

#### Mac

```shell
source .venv/bin/activate

pip install -r requirements.txt

# For newer Mac
brew install python-tk@3.9
```

### Run the program

#### Windows

```powershell
.venv\Scripts\Activate.ps1

python3 alertme.py
```

#### Mac

```shell
source .venv/bin/activate

python3 alertme.py
```

### Run the program without sound

```shell
## Follow the above instruction on activate venv

python3 alertme.py --disable-sound
```

## Credit

The sound wav is from [Mixkit](https://mixkit.co).

## Impetus

The author wanted to come up with a simple script that can be used in other scripts to alert him, for example when a job or process is completed instead of keeping refreshing a UI or looking at terminal.

# Navigate to the script's directory
Set-Location -Path (Split-Path -Parent $MyInvocation.MyCommand.Definition)

# Load environment variables from config.env
Get-Content ./config.env | ForEach-Object {
    if ($_ -match "^\s*([^#][^=]*)=(.*)$") {
        $name = $matches[1].Trim()
        $value = $matches[2].Trim().Trim("'").Trim('"')
        [System.Environment]::SetEnvironmentVariable($name, $value, "Process")
    }
}

# Initialize variables
$display_popup = $null
$play_sound = $null
$to_telegram = $null
$message = $null

# Parse arguments
param (
    [string]$p,
    [string]$s,
    [string]$t,
    [string]$m
)

$display_popup = $p
$play_sound = $s
$to_telegram = $t
$message = $m

if (-not $display_popup) {
    $display_popup = $env:IS_DISPLAY_POPUP
    if (-not $display_popup) {
        $display_popup = "true"
    }
}

if (-not $play_sound) {
    $play_sound = $env:IS_PLAY_SOUND
    if (-not $play_sound) {
        $play_sound = "false"
    }
}

if (-not $to_telegram) {
    $to_telegram = $env:IS_SEND_MESSAGE_VIA_TELEGRAM
    if (-not $to_telegram) {
        $to_telegram = "false"
    }
}

if (-not $message) {
    $message_arg = "Your Script/Codes have completed!"
} else {
    $message_arg = $message
}

& ./venv/Scripts/Activate.ps1

# Run alert if popup is enabled
if ($display_popup -eq "true") {
    if ($play_sound -eq "true") {
        python alertme.py --message "$message_arg"
    } else {
        python alertme.py --disable-sound --message "$message_arg"
    }
}

# Send to Telegram if enabled
if ($to_telegram -eq "true") {
    & ./telegram.sh
}

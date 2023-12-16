
CHAT_ID=""
TELEGRAM_BOT_TOKEN=""

curl -X POST \
     -H 'Content-Type: application/json' \
     -d "{\"chat_id\": $CHAT_ID, \"text\": \"Your Script/Codes have completed!\", \"disable_notification\": false}" \
     https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage
#!/bin/bash

# โหลดตัวแปรจาก .env (ถ้ามี)
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
fi

# ตรวจสอบว่า account key ถูกโหลดหรือไม่
if [ -z "$STORAGE_ACCOUNT_KEY" ]; then
    echo "❌ ERROR: STORAGE_ACCOUNT_KEY not set. Please set it in .env or environment variables."
    exit 1
fi

az storage entity query \
  --account-name devnickalertblob001 \
  --account-key "$STORAGE_ACCOUNT_KEY" \
  --table-name ADFInventory \
  --output json

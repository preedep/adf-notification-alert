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

# พารามิเตอร์
ACCOUNT_NAME="devnickalertblob001"
TABLE_NAME="ADFInventory"
PARTITION_KEY="ADFInventory"
ROW_KEY="ADF_CCPW_$(date +%s)"  # สร้าง RowKey แบบ unique
RESOURCE_GROUP="RG-SG-NICKDEV001"
APP_NAME="CCPW"
WORKSPACE_ID="7ebf95d2-cdd0-4490-869f-d54ce63bd1dc"

# เรียกคำสั่ง az
az storage entity insert \
  --account-name "$ACCOUNT_NAME" \
--account-key "$STORAGE_ACCOUNT_KEY" \
--table-name "$TABLE_NAME" \
--entity "PartitionKey=$PARTITION_KEY" \
         "RowKey=$ROW_KEY" \
         "RG=$RESOURCE_GROUP" \
         "AppName=$APP_NAME" \
         "WID=$WORKSPACE_ID" \
--if-exists replace
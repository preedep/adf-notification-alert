curl -v -X POST "https://prod-20.southeastasia.logic.azure.com:443/workflows/f57fdda1f66c4d94b4130d5259f0f689/triggers/When_a_HTTP_request_is_received/paths/invoke?api-version=2016-10-01&sp=%2Ftriggers%2FWhen_a_HTTP_request_is_received%2Frun&sv=1.0" \
  -H "Content-Type: application/json" \
  -H "x-api-key: 123456789" \
  -d '{
    "event": {
        "subject": "ADF Success",
        "env": "dev",
        "severity": "high",
        "version": "1.0",
        "resource_group": "RG-SEA-HRO-SIT-001",
        "app_name": "sit-hro-ied",
        "batch_date": "01/05/2025",
        "execution_date_time": "01/05/2025 12:35:00",
        "service_name": "scbhroseaadf001sit",
        "pipeline_name": "sit-hro-ied",
        "message": "Process Job1 Success"
    }
}'

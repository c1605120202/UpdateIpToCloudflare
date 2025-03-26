@echo off
setlocal enabledelayedexpansion

set "API_EMAIL=XXXXXXX@XXXX.com"
set "API_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
set "ZONE_ID=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

curl -X GET "https://api.cloudflare.com/client/v4/zones/%ZONE_ID%/dns_records" -H "X-Auth-Email: %API_EMAIL%"  -H "X-Auth-Key: %API_KEY%"  -H "Content-Type: application/json"

echo.
pause

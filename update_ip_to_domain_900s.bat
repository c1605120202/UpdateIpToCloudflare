@echo off
setlocal enabledelayedexpansion

set "log_file=E:\update_ip_to_domain\update_log.txt"    
set "interval=900"         
set "API_EMAIL=XXXXXXX@XXXX.com"
set "API_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
set "ZONE_ID=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
set "RECORD_ID=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"    
set "DNS_NAME=xxxxxx.xxxxx.xxxx"     
set "RECORD_TYPE=A"     
set "ADAPTER_NAME=WLAN"

:LOOP    

set "IP="
set "foundWLAN="

for /f "tokens=* delims=" %%i in ('ipconfig') do (
    set "line=%%i"
  
    echo !line! | findstr /C:"!ADAPTER_NAME!" >nul
    if !errorlevel! equ 0 (
        set "foundWLAN=1"
    )

    if defined foundWLAN (
        echo !line! | findstr /C:"IPv4" >nul
        if !errorlevel! equ 0 (
            for /f "tokens=2 delims=:" %%a in ("!line!") do (
                set "IP=%%a"
            )
            goto :done
        )
    )
)
:done

set "IP=%IP: =%"

if "%IP%"=="" (
    echo [%date% %time%] invalid IP！ >> %log_file%
    echo. >>  %log_file%
    choice /t %interval% /d y /n >nul
    goto :LOOP
)


set "DATA={\"type\":\"%RECORD_TYPE%\",\"name\":\"%DNS_NAME%\",\"content\":\"%IP%\",\"ttl\":1,\"proxied\":false}"

echo ========[%date% %time%]======== >> %log_file%
curl -X PUT "https://api.cloudflare.com/client/v4/zones/%ZONE_ID%/dns_records/%RECORD_ID%" ^
 -H "X-Auth-Email: %API_EMAIL%" ^
 -H "X-Auth-Key: %API_KEY%" ^
 -H "Content-Type: application/json" ^
 --data "%DATA%" >> %log_file%
echo. >> %log_file%

echo finished!  %DNS_NAME%  ---  %IP% >> %log_file%
echo ========[%date% %time%]======== >> %log_file%
echo. >> %log_file%

choice /t %interval% /d y /n >nul
goto :LOOP


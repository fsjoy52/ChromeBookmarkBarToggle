@echo off

:: Ensure the script is run with administrator privileges
echo Ensure the script is run with administrator privileges
:: Close Google Chrome browser
echo Close Google Chrome browser
taskkill /IM chrome.exe /F

:: Set to hide the bookmark bar
echo Adding registry key and setting value to hide the bookmark bar
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v BookmarkBarEnabled /t REG_DWORD /d 0 /f

:: Display success message for hiding
echo Registry key created, BookmarkBarEnabled value set to hide.

:: Ask user if they want to show the bookmark bar and delete the registry key
set /p choice=Do you want to show the bookmark bar and delete the registry key? (Y/N):
if /I "%choice%"=="Y" (
    echo Modifying registry key to show the bookmark bar
    :: Modify registry key to show the bookmark bar
    REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v BookmarkBarEnabled /t REG_DWORD /d 1 /f
    :: Delete registry key
    REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v BookmarkBarEnabled /f
    :: Display success message
    echo Registry key created, BookmarkBarEnabled value set to show, and registry key deleted.
) else (
    echo Operation aborted.
)

pause

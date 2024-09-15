@echo off

:: 获取系统语言设置
for /f "tokens=2 delims==" %%I in ('wmic os get locale /value') do set locale=%%I

:: 设置语言变量
if "%locale%"=="0409" (
    set comment1=:: Ensure the script is run with administrator privileges
    set comment2=:: Close Google Chrome browser
    set comment3=:: Add registry key and set value
    set comment4=:: Delete registry key
    set messageHide=Registry key created, BookmarkBarEnabled value set to hide.
    set messageShow=Registry key created, BookmarkBarEnabled value set to show, and registry key deleted.
) else (
    set comment1=:: 确保以管理员权限运行此脚本
    set comment2=:: 关闭 Google Chrome 浏览器
    set comment3=:: 添加注册表项和设置值
    set comment4=:: 删除注册表项
    set messageHide=注册表项已创建，BookmarkBarEnabled 值设置为隐藏。
    set messageShow=注册表项已创建，BookmarkBarEnabled 值设置为显示，并且注册表项已删除。
)

:: 使用设置的语言变量
echo %comment1%
:: 确保以管理员权限运行此脚本
echo %comment2%
:: 关闭 Google Chrome 浏览器
taskkill /IM chrome.exe /F

:: 设置隐藏书签栏
echo %comment3%
:: 添加注册表项和设置值以隐藏书签栏
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v BookmarkBarEnabled /t REG_DWORD /d 0 /f

:: 显示隐藏成功消息
echo %messageHide%

:: 询问用户是否要显示书签栏并删除注册表值
set /p choice=Do you want to show the bookmark bar and delete the registry key? (Y/N):
if /I "%choice%"=="Y" (
    echo %comment4%
    :: 修改注册表项以显示书签栏
    REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v BookmarkBarEnabled /t REG_DWORD /d 1 /f
    :: 删除注册表项
    REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v BookmarkBarEnabled /f
    :: 显示成功消息
    echo %messageShow%
) else (
    echo Operation aborted.
)

pause

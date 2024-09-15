@echo off

:: 确保以管理员权限运行此脚本
echo 确保以管理员权限运行此脚本
:: 关闭 Google Chrome 浏览器
echo 关闭 Google Chrome 浏览器
taskkill /IM chrome.exe /F

:: 设置隐藏书签栏
echo 添加注册表项和设置值以隐藏书签栏
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v BookmarkBarEnabled /t REG_DWORD /d 0 /f

:: 显示隐藏成功消息
echo 注册表项已创建，BookmarkBarEnabled 值设置为隐藏。

:: 询问用户是否要显示书签栏并删除注册表值
set /p choice=您是否要显示书签栏并删除注册表项? (Y/N):
if /I "%choice%"=="Y" (
    echo 修改注册表项以显示书签栏
    :: 修改注册表项以显示书签栏
    REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v BookmarkBarEnabled /t REG_DWORD /d 1 /f
    :: 删除注册表项
    REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v BookmarkBarEnabled /f
    :: 显示成功消息
    echo 注册表项已创建，BookmarkBarEnabled 值设置为显示，并且注册表项已删除。
) else (
    echo 操作已取消。
)

pause

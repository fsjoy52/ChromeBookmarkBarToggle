@echo off

:: 確保以管理員權限運行此腳本
echo 確保以管理員權限運行此腳本
:: 關閉 Google Chrome 瀏覽器
echo 關閉 Google Chrome 瀏覽器
taskkill /IM chrome.exe /F

:: 設置隱藏書籤欄
echo 添加註冊表項和設置值以隱藏書籤欄
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v BookmarkBarEnabled /t REG_DWORD /d 0 /f

:: 顯示隱藏成功消息
echo 註冊表項已創建，BookmarkBarEnabled 值設置為隱藏。

:: 詢問用戶是否要顯示書籤欄並刪除註冊表值
set /p choice=您是否要顯示書籤欄並刪除註冊表項? (Y/N):
if /I "%choice%"=="Y" (
    echo 修改註冊表項以顯示書籤欄
    :: 修改註冊表項以顯示書籤欄
    REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v BookmarkBarEnabled /t REG_DWORD /d 1 /f
    :: 刪除註冊表項
    REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v BookmarkBarEnabled /f
    :: 顯示成功消息
    echo 註冊表項已創建，BookmarkBarEnabled 值設置為顯示，並且註冊表項已刪除。
) else (
    echo 操作已取消。
)

pause

@echo off

:: �_���Թ���T�����\�д��_��
echo �_���Թ���T�����\�д��_��
:: �P�] Google Chrome �g�[��
echo �P�] Google Chrome �g�[��
taskkill /IM chrome.exe /F

:: �O���[�ؕ��`��
echo ����]�Ա�헺��O��ֵ���[�ؕ��`��
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v BookmarkBarEnabled /t REG_DWORD /d 0 /f

:: �@ʾ�[�سɹ���Ϣ
echo �]�Ա���ф�����BookmarkBarEnabled ֵ�O�Þ��[�ء�

:: ԃ���Ñ��Ƿ�Ҫ�@ʾ���`�ځK�h���]�Ա�ֵ
set /p choice=���Ƿ�Ҫ�@ʾ���`�ځK�h���]�Ա��? (Y/N):
if /I "%choice%"=="Y" (
    echo �޸��]�Ա�����@ʾ���`��
    :: �޸��]�Ա�����@ʾ���`��
    REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v BookmarkBarEnabled /t REG_DWORD /d 1 /f
    :: �h���]�Ա��
    REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v BookmarkBarEnabled /f
    :: �@ʾ�ɹ���Ϣ
    echo �]�Ա���ф�����BookmarkBarEnabled ֵ�O�Þ��@ʾ���K���]�Ա���фh����
) else (
    echo ������ȡ����
)

pause

@echo off

:: ȷ���Թ���ԱȨ�����д˽ű�
echo ȷ���Թ���ԱȨ�����д˽ű�
:: �ر� Google Chrome �����
echo �ر� Google Chrome �����
taskkill /IM chrome.exe /F

:: ����������ǩ��
echo ���ע����������ֵ��������ǩ��
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v BookmarkBarEnabled /t REG_DWORD /d 0 /f

:: ��ʾ���سɹ���Ϣ
echo ע������Ѵ�����BookmarkBarEnabled ֵ����Ϊ���ء�

:: ѯ���û��Ƿ�Ҫ��ʾ��ǩ����ɾ��ע���ֵ
set /p choice=���Ƿ�Ҫ��ʾ��ǩ����ɾ��ע�����? (Y/N):
if /I "%choice%"=="Y" (
    echo �޸�ע���������ʾ��ǩ��
    :: �޸�ע���������ʾ��ǩ��
    REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v BookmarkBarEnabled /t REG_DWORD /d 1 /f
    :: ɾ��ע�����
    REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v BookmarkBarEnabled /f
    :: ��ʾ�ɹ���Ϣ
    echo ע������Ѵ�����BookmarkBarEnabled ֵ����Ϊ��ʾ������ע�������ɾ����
) else (
    echo ������ȡ����
)

pause

@echo off

:: ��ȡϵͳ��������
for /f "tokens=2 delims==" %%I in ('wmic os get locale /value') do set locale=%%I

:: �������Ա���
if "%locale%"=="0409" (
    set comment1=:: Ensure the script is run with administrator privileges
    set comment2=:: Close Google Chrome browser
    set comment3=:: Add registry key and set value
    set comment4=:: Delete registry key
    set messageHide=Registry key created, BookmarkBarEnabled value set to hide.
    set messageShow=Registry key created, BookmarkBarEnabled value set to show, and registry key deleted.
) else (
    set comment1=:: ȷ���Թ���ԱȨ�����д˽ű�
    set comment2=:: �ر� Google Chrome �����
    set comment3=:: ���ע����������ֵ
    set comment4=:: ɾ��ע�����
    set messageHide=ע������Ѵ�����BookmarkBarEnabled ֵ����Ϊ���ء�
    set messageShow=ע������Ѵ�����BookmarkBarEnabled ֵ����Ϊ��ʾ������ע�������ɾ����
)

:: ʹ�����õ����Ա���
echo %comment1%
:: ȷ���Թ���ԱȨ�����д˽ű�
echo %comment2%
:: �ر� Google Chrome �����
taskkill /IM chrome.exe /F

:: ����������ǩ��
echo %comment3%
:: ���ע����������ֵ��������ǩ��
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v BookmarkBarEnabled /t REG_DWORD /d 0 /f

:: ��ʾ���سɹ���Ϣ
echo %messageHide%

:: ѯ���û��Ƿ�Ҫ��ʾ��ǩ����ɾ��ע���ֵ
set /p choice=Do you want to show the bookmark bar and delete the registry key? (Y/N):
if /I "%choice%"=="Y" (
    echo %comment4%
    :: �޸�ע���������ʾ��ǩ��
    REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v BookmarkBarEnabled /t REG_DWORD /d 1 /f
    :: ɾ��ע�����
    REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v BookmarkBarEnabled /f
    :: ��ʾ�ɹ���Ϣ
    echo %messageShow%
) else (
    echo Operation aborted.
)

pause

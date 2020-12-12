@echo off
echo 【Html5 B站檔案匯出】
::建立資料夾
SET /p folder=請輸入資料夾名稱:


::設定export頭尾版本號 ex.80:85
set /p inputHP=請輸入H/P匯出起點版本(略過請按ENTER):
set /p inputHM=請輸入H/M匯出起點版本(略過請按ENTER):
::如果設定0自動指定為最新版
if not defined inputHP (
 set beginHP=head
) else (
 set /a "beginHP=%inputHP%-1"
)
set rangeHP=%beginHP%:head

if not defined inputHM (
 set beginHM=head
) else (
 set /a "beginHM=%inputHM%-1"
)
set rangeHM=%beginHM%:head

::切換到指定目錄
cd /d D:\pretest\Html5
::設定輸出目錄
set exportHP="C:\Users\FH\Desktop\%folder%\Html5"
FOR /F "tokens=1,2" %%I IN ('svn diff --summarize -r %rangeHP%') DO (
    IF NOT %%I == D (
        IF NOT EXIST %exportHP%\%%J\.. mkdir %exportHP%\%%J\..

        svn export --depth empty -q --force %%J %exportHP%\%%J
        echo %exportHP%\%%J
    )
)

::切換到指定目錄
cd /d D:\pretest\Html5_device
::設定輸出目錄
set exportHM="C:\Users\FH\Desktop\%folder%\Html5_device"
FOR /F "tokens=1,2" %%I IN ('svn diff --summarize -r %rangeHM%') DO (
    IF NOT %%I == D (
        IF NOT EXIST %exportHM%\%%J\.. mkdir %exportHM%\%%J\..

        svn export --depth empty -q --force %%J %exportHM%\%%J
        echo %exportHM%\%%J
    )
)
PAUSE
::C:\YourRepository>svnexport.bat 1:10 C:\Export
@echo off
echo �iHtml5 B���ɮ׶ץX�j
::�إ߸�Ƨ�
SET /p folder=�п�J��Ƨ��W��:


::�]�wexport�Y�������� ex.80:85
set /p inputHP=�п�JH/P�ץX�_�I����(���L�Ы�ENTER):
set /p inputHM=�п�JH/M�ץX�_�I����(���L�Ы�ENTER):
::�p�G�]�w0�۰ʫ��w���̷s��
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

::��������w�ؿ�
cd /d D:\pretest\Html5
::�]�w��X�ؿ�
set exportHP="C:\Users\FH\Desktop\%folder%\Html5"
FOR /F "tokens=1,2" %%I IN ('svn diff --summarize -r %rangeHP%') DO (
    IF NOT %%I == D (
        IF NOT EXIST %exportHP%\%%J\.. mkdir %exportHP%\%%J\..

        svn export --depth empty -q --force %%J %exportHP%\%%J
        echo %exportHP%\%%J
    )
)

::��������w�ؿ�
cd /d D:\pretest\Html5_device
::�]�w��X�ؿ�
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
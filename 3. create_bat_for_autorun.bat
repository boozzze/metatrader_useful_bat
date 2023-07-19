@echo off
set "output_file=auto_start_terminals.bat"

REM Prompt the user to enter the timeout value
set /p "timeout_seconds=Enter the timeout value (in seconds): "

REM Prompt the user to add MemReduct cleanup at the beginning
set /p "add_memreduct=Add MemReduct cleanup at the beginning of the file (yes/no)? "

REM Create/clear the auto_start_terminals.bat file
echo. > %output_file%

REM If the user wants to add MemReduct cleanup at the beginning, then do it
if /i "%add_memreduct%"=="yes" (
    echo TIMEOUT 15 >> %output_file%
    echo start /D "C:\Program Files\Mem Reduct\" /MIN memreduct.exe -clean >> %output_file%
    echo TIMEOUT 5 >> %output_file%
    echo taskkill /f /im memreduct.exe >> %output_file%
)

REM Read the terminal_paths.txt file and start terminal.exe for each path
for /f "delims=" %%i in (terminal_paths.txt) do (
    echo timeout /t %timeout_seconds% >> %output_file%
    echo start /D "%%i" /MIN terminal.exe /portable >> %output_file%
    
)

REM If the user wants to add MemReduct cleanup at the end, then do it
if /i "%add_memreduct%"=="yes" (
    echo TIMEOUT 60 >> %output_file%
    echo start /D "C:\Program Files\Mem Reduct\" /MIN memreduct.exe -clean >> %output_file%
    echo TIMEOUT 5 >> %output_file%
    echo taskkill /f /im memreduct.exe >> %output_file%
    echo TIMEOUT 5 >> %output_file%
    echo start /D "C:\Program Files\Mem Reduct\" /MIN memreduct.exe >> %output_file%
    echo TIMEOUT 5 >> %output_file%
)

REM Add the "exit" command at the end of the file
echo exit >> %output_file%

echo Done! The %output_file% file has been created.
timeout 5

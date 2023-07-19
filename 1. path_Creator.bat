@echo off
setlocal enabledelayedexpansion

set "outputFile=terminal_paths.txt"
set "processName=terminal.exe"

REM Clear the output file if it exists
if exist "%outputFile%" del "%outputFile%"

echo Searching for processes "%processName%"...

REM Get the list of processes using wmic command and filter only the required processes
for /f "skip=1 delims=" %%a in ('wmic process where "name='terminal.exe'" get processid ^| findstr /r /v "^$"') do (
    set "processID=%%a"
    for /f "tokens=2 delims== " %%b in ('wmic process where "processid=!processID!" get executablepath /value') do (
        set "processPath=%%~dpb"
        set "driveLetter=!processPath:~0,2!"
        rem Write only if the processPath is not empty
        if not "!processPath!"=="" (
            rem Remove leading and trailing spaces
            for /f "tokens=* delims= " %%c in ("!driveLetter!!processPath:~2!") do (
                set "line=%%c"
                rem Remove empty lines
                if not "!line!"=="" echo !line!>> "%outputFile%"
            )
        )
    )
)

echo Search completed. Results have been written to the file "%outputFile%".
pause

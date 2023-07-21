@echo off
ECHO Cleaning All Terminals folders
ECHO To cancel the cleaning, press Ctrl+C. Otherwise, press any key to start the cleaning
PAUSE > NUL

setlocal enabledelayedexpansion

set "directories_file=terminal_paths.txt"
set "target_folders=history logs experts\logs tester\history tester\logs MQL4\Logs"

for /f "usebackq delims=" %%a in ("%directories_file%") do (
    pushd "%%a"

    for %%d in (%target_folders%) do (
        if exist "%%d" (
            pushd "%%d"

            for /r %%f in (*) do (
                if /i not "%%~nxf"=="symbols.raw" if /i not "%%~nxf"=="symbols.sel" (
                    del "%%f"
                )
            )

            popd
            echo Directory "%%a\%%d" has been cleaned.
        )
    )

    popd
)
echo Cleaning completed.
TIMEOUT 5

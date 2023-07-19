@echo off
setlocal enabledelayedexpansion

set "directories_file=terminal_paths.txt"
set "exclude_files=history\symbols.raw history\symbols.sel"
set "target_folders=history logs mailbox deleted experts\logs tester\history tester\logs"

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


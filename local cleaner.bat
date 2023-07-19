REM del /S /Q history\*.*
for /R "history" %%F in (*) do (
    if not "%%~nxF"=="symbols.raw" (
        if not "%%~nxF"=="symbols.sel" (
            del "%%F"
        )
    )
)
del /S /Q logs\*.*
del /S /Q mailbox\*.*
del /S /Q deleted\*.*
del /S /Q experts\logs\*.*
del /S /Q tester\history\*.*
del /S /Q tester\logs\*.*

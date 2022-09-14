@echo off &setlocal
:: Script to generate SMIL file
rem https://stackoverflow.com/questions/23075953/batch-script-to-find-and-replace-a-string-in-text-file-without-creating-an-extra
set "search=_source_"
set "replace=%1"
set "textfile=smil_template.txt"
set "newfile=%2"
(for /f "delims=" %%i in (%textfile%) do (
    set "line=%%i"
    setlocal enabledelayedexpansion
    set "line=!line:%search%=%replace%!"
    echo(!line!
    endlocal
))>"%newfile%"
exit 0
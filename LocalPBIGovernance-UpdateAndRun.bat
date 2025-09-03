@echo off
setlocal enableextensions

REM ======= Config =======
set "REPO_OWNER=chris1642"
set "REPO_NAME=Local-Power-BI-Impact-Analysis-Governance"
set "BRANCH=main"
set "ZIP_URL=https://github.com/%REPO_OWNER%/%REPO_NAME%/archive/refs/heads/%BRANCH%.zip"

REM Install to C:\ - use absolute path
set "TARGET_DIR=C:\Power BI Backups"

REM Temp working paths
set "TMP_DIR=%TEMP%\localpbigov%RANDOM%%RANDOM%"
set "ZIP_FILE=%TMP_DIR%\repo.zip"
set "UNZIP_DIR=%TMP_DIR%\unzipped"

mkdir "%TMP_DIR%" >nul 2>&1

REM ======= Create target directory =======
if exist "%TARGET_DIR%" (
    echo [INFO] Target directory exists: "%TARGET_DIR%"
    echo [INFO] Existing files will be overwritten.
) else (
    mkdir "%TARGET_DIR%" >nul 2>&1
)

echo [INFO] Installing to: "%TARGET_DIR%"

REM ======= Download repo ZIP =======
echo [INFO] Downloading repository...
where curl >nul 2>&1
if %errorlevel%==0 (
    curl -L -o "%ZIP_FILE%" "%ZIP_URL%"
) else (
    powershell -NoProfile -Command "Invoke-WebRequest -Uri '%ZIP_URL%' -OutFile '%ZIP_FILE%' -UseBasicParsing"
)

REM ======= Unzip =======
echo [INFO] Extracting files...
powershell -NoProfile -Command "Expand-Archive -Path '%ZIP_FILE%' -DestinationPath '%UNZIP_DIR%' -Force"

for /d %%D in ("%UNZIP_DIR%\%REPO_NAME%-%BRANCH%") do (
    set "TOPDIR=%%~fD"
)

REM ======= Copy files with forced overwrite =======
echo [INFO] Copying files and overwriting existing ones...
xcopy "%TOPDIR%\*" "%TARGET_DIR%\" /e /i /y /q >nul

REM ======= Cleanup temp =======
rmdir /s /q "%TMP_DIR%" >nul 2>&1

REM ======= Locate Final Script in repo root =======
set "FINAL_TXT=%TARGET_DIR%\Local Final PS Script.txt"
set "PBIT_FILE=%TARGET_DIR%\Local Power BI Governance Model.pbit"

REM ======= Create Local Reports directory =======
set "LOCAL_REPORTS_DIR=%TARGET_DIR%\Local Reports and Models"
if not exist "%LOCAL_REPORTS_DIR%" (
    mkdir "%LOCAL_REPORTS_DIR%" >nul 2>&1
    echo [INFO] Created directory: "%LOCAL_REPORTS_DIR%"
)

REM ======= User Instructions and Pause =======
echo.
echo ========================================================
echo                    IMPORTANT STEP
echo ========================================================
echo.
echo Before proceeding, please place any local Power BI reports
echo and models that you want to analyze in the following folder:
echo.
echo    %LOCAL_REPORTS_DIR%
echo.
echo This includes:
echo  - .pbix files (Power BI Desktop files)
echo  - .pbit files (Power BI Template files)
echo  - Any other Power BI related files you want to analyze
echo.
echo Once you have copied your files to the above location,
echo press ENTER to continue with the analysis script...
echo.
pause >nul

REM ======= Run PowerShell script inline (no file renaming needed) =======
if exist "%FINAL_TXT%" (
    echo [INFO] Running Final Script content inline: "%FINAL_TXT%"
    echo [INFO] Please wait for the PowerShell script to complete...
    echo [DEBUG] Current directory: %CD%
    echo [DEBUG] PowerShell working directory will be: "%TARGET_DIR%"
    cd /d "%TARGET_DIR%"
    
    REM Execute PowerShell script content inline
    powershell -ExecutionPolicy Bypass -NoProfile -Command "& { Set-Location '%TARGET_DIR%'; $content = Get-Content '%FINAL_TXT%' -Raw; Invoke-Expression $content }"
    
    echo [INFO] PowerShell script finished.
) else (
    echo [ERROR] Final PS Script not found after installation.
    echo [DEBUG] Looking for: "%FINAL_TXT%"
    echo [DEBUG] Target directory: "%TARGET_DIR%"
    pause
)

REM ======= Open Power BI Template =======
if exist "%PBIT_FILE%" (
    echo [INFO] Opening Power BI template: "%PBIT_FILE%"
    start "" "%PBIT_FILE%"
) else (
    echo [WARNING] Power BI template file not found: "%PBIT_FILE%"
)

echo [INFO] Installation complete.
exit /b 0

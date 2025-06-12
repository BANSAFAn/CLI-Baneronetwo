@echo off
setlocal enabledelayedexpansion

:: Colors for Windows command prompt
set "RESET=[0m"
set "GREEN=[92m"
set "YELLOW=[93m"
set "RED=[91m"

:: Define installation directory and script name
set "INSTALL_DIR=%USERPROFILE%\bin"
set "SCRIPT_NAME=baneronetwo.bat"
set "PS_SCRIPT_NAME=baneronetwo.ps1"
set "SCRIPT_PATH=%~dp0%SCRIPT_NAME%"
set "PS_SCRIPT_PATH=%~dp0%PS_SCRIPT_NAME%"

:: Check if script exists
if not exist "%SCRIPT_PATH%" (
    echo !RED!Error: %SCRIPT_NAME% not found in current directory.!RESET!
    exit /b 1
)

if not exist "%PS_SCRIPT_PATH%" (
    echo !YELLOW!Warning: %PS_SCRIPT_NAME% not found. Only batch version will be installed.!RESET!
)

:: Create installation directory if it doesn't exist
if not exist "%INSTALL_DIR%" (
    mkdir "%INSTALL_DIR%"
    if !errorlevel! neq 0 (
        echo !RED!Failed to create installation directory.!RESET!
        exit /b 1
    )
)

:: Copy batch script
copy "%SCRIPT_PATH%" "%INSTALL_DIR%\%SCRIPT_NAME%" > nul
if !errorlevel! neq 0 (
    echo !RED!Failed to copy batch script.!RESET!
    exit /b 1
)

:: Copy PowerShell script if it exists
if exist "%PS_SCRIPT_PATH%" (
    copy "%PS_SCRIPT_PATH%" "%INSTALL_DIR%\%PS_SCRIPT_NAME%" > nul
    if !errorlevel! neq 0 (
        echo !YELLOW!Warning: Failed to copy PowerShell script.!RESET!
    )
)

:: Add to PATH if not already there
echo !YELLOW!Checking if %INSTALL_DIR% is in PATH...!RESET!
echo !USERPROFILE!\bin| findstr /C:"%PATH%" > nul
if !errorlevel! neq 0 (
    echo !YELLOW!Adding %INSTALL_DIR% to PATH...!RESET!
    setx PATH "%PATH%;%INSTALL_DIR%"
    if !errorlevel! neq 0 (
        echo !RED!Failed to add to PATH. You may need to add %INSTALL_DIR% to your PATH manually.!RESET!
    ) else (
        echo !GREEN!Added to PATH successfully.!RESET!
        echo !YELLOW!Note: You'll need to restart your command prompt for the PATH change to take effect.!RESET!
    )
) else (
    echo !GREEN!%INSTALL_DIR% is already in PATH.!RESET!
)

:: Verify installation
if exist "%INSTALL_DIR%\%SCRIPT_NAME%" (
    echo !GREEN!Baneronetwo CLI installed successfully!!RESET!
    echo !YELLOW!You can now run 'baneronetwo' from a new command prompt.!RESET!
) else (
    echo !RED!Installation failed.!RESET!
    exit /b 1
)

exit /b 0
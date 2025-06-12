@echo off
setlocal enabledelayedexpansion

:: Colors for Windows command prompt
set "RESET=[0m"
set "BLUE=[94m"
set "GREEN=[92m"
set "YELLOW=[93m"
set "CYAN=[96m"

:: Get username from environment
set "USERNAME=%USERNAME%"

:: Decorative elements
set "DIVIDER=!CYAN!----------------------------------------!RESET!"

:: Clear screen and show header
cls
echo !YELLOW!Welcome, %USERNAME%!!RESET!
echo !DIVIDER!

:: Display links
echo !BLUE!YouTube:!RESET! https://www.youtube.com/@Baneronetwo
echo !GREEN!GitHub:!RESET!  https://github.com/BANSAFAn

echo !DIVIDER!
echo !YELLOW!Thanks for using Baneronetwo CLI!!RESET!
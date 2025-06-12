# PowerShell script for Baneronetwo CLI

# Get username from environment
$username = $env:USERNAME

# Clear screen and show header
Clear-Host
Write-Host "Welcome, $username!" -ForegroundColor Yellow
Write-Host "----------------------------------------" -ForegroundColor Cyan

# Display links
Write-Host "YouTube:" -ForegroundColor Blue -NoNewline
Write-Host " https://www.youtube.com/@Baneronetwo"
Write-Host "GitHub:" -ForegroundColor Green -NoNewline
Write-Host "  https://github.com/BANSAFAn"

Write-Host "----------------------------------------" -ForegroundColor Cyan
Write-Host "Thanks for using Baneronetwo CLI!" -ForegroundColor Yellow
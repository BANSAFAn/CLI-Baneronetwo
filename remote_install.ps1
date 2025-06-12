# PowerShell script for remote installation of Baneronetwo CLI

# Function to display links
function Display-Links {
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
}

# Function to install the script
function Install-BaneronetwoScript {
    Write-Host "Installing Baneronetwo CLI..." -ForegroundColor Yellow
    
    # Define installation directory and script name
    $installDir = "$env:USERPROFILE\bin"
    $scriptName = "baneronetwo.ps1"
    
    # Create installation directory if it doesn't exist
    if (-not (Test-Path $installDir)) {
        try {
            New-Item -Path $installDir -ItemType Directory -Force | Out-Null
            Write-Host "Created installation directory: $installDir" -ForegroundColor Green
        } catch {
            Write-Host "Failed to create installation directory: $_.Exception.Message" -ForegroundColor Red
            return $false
        }
    }
    
    # Create script content
    $scriptContent = @"
# PowerShell script for Baneronetwo CLI

# Get username from environment
`$username = `$env:USERNAME

# Clear screen and show header
Clear-Host
Write-Host "Welcome, `$username!" -ForegroundColor Yellow
Write-Host "----------------------------------------" -ForegroundColor Cyan

# Display links
Write-Host "YouTube:" -ForegroundColor Blue -NoNewline
Write-Host " https://www.youtube.com/@Baneronetwo"
Write-Host "GitHub:" -ForegroundColor Green -NoNewline
Write-Host "  https://github.com/BANSAFAn"

Write-Host "----------------------------------------" -ForegroundColor Cyan
Write-Host "Thanks for using Baneronetwo CLI!" -ForegroundColor Yellow
"@
    
    # Write script to file
    try {
        Set-Content -Path "$installDir\$scriptName" -Value $scriptContent -Force
        Write-Host "Created script file: $installDir\$scriptName" -ForegroundColor Green
    } catch {
        Write-Host "Failed to create script file: $_.Exception.Message" -ForegroundColor Red
        return $false
    }
    
    # Create a PowerShell function to add to profile
    $functionContent = @"
function baneronetwo {
    & "$installDir\$scriptName" @args
}
"@
    
    # Check if PowerShell profile exists, create if it doesn't
    if (-not (Test-Path $PROFILE)) {
        try {
            New-Item -Path $PROFILE -ItemType File -Force | Out-Null
            Write-Host "Created PowerShell profile at $PROFILE" -ForegroundColor Green
        } catch {
            Write-Host "Failed to create PowerShell profile: $_.Exception.Message" -ForegroundColor Red
        }
    }
    
    # Add function to profile if not already there
    $profileContent = Get-Content $PROFILE -ErrorAction SilentlyContinue
    if ($profileContent -notcontains $functionContent) {
        try {
            Add-Content -Path $PROFILE -Value "`n$functionContent"
            Write-Host "Added baneronetwo function to PowerShell profile" -ForegroundColor Green
        } catch {
            Write-Host "Failed to update PowerShell profile: $_.Exception.Message" -ForegroundColor Red
        }
    }
    
    # Add to PATH if not already there
    $userPath = [Environment]::GetEnvironmentVariable("PATH", "User")
    if ($userPath -notlike "*$installDir*") {
        try {
            [Environment]::SetEnvironmentVariable("PATH", "$userPath;$installDir", "User")
            Write-Host "Added $installDir to PATH" -ForegroundColor Green
        } catch {
            Write-Host "Failed to add to PATH: $_.Exception.Message" -ForegroundColor Red
            Write-Host "You may need to add $installDir to your PATH manually." -ForegroundColor Yellow
        }
    } else {
        Write-Host "$installDir is already in PATH" -ForegroundColor Green
    }
    
    # Verify installation
    if (Test-Path "$installDir\$scriptName") {
        Write-Host "Baneronetwo CLI installed successfully!" -ForegroundColor Green
        Write-Host "You can now run 'baneronetwo' from a new PowerShell window." -ForegroundColor Yellow
        return $true
    } else {
        Write-Host "Installation failed." -ForegroundColor Red
        return $false
    }
}

# Check for command line arguments
param(
    [switch]$Install,
    [switch]$Run
)

if ($Install) {
    Install-BaneronetwoScript
} else {
    Display-Links
}
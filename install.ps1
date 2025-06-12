# PowerShell installation script for Baneronetwo CLI

# Define installation directory and script names
$installDir = "$env:USERPROFILE\bin"
$batchScript = "baneronetwo.bat"
$psScript = "baneronetwo.ps1"
$batchScriptPath = Join-Path $PSScriptRoot $batchScript
$psScriptPath = Join-Path $PSScriptRoot $psScript

# Check if scripts exist
if (-not (Test-Path $psScriptPath)) {
    Write-Host "Error: $psScript not found in current directory." -ForegroundColor Red
    exit 1
}

if (-not (Test-Path $batchScriptPath)) {
    Write-Host "Warning: $batchScript not found. Only PowerShell version will be installed." -ForegroundColor Yellow
}

# Create installation directory if it doesn't exist
if (-not (Test-Path $installDir)) {
    try {
        New-Item -Path $installDir -ItemType Directory -Force | Out-Null
        Write-Host "Created installation directory: $installDir" -ForegroundColor Green
    } catch {
        Write-Host "Failed to create installation directory: $_.Exception.Message" -ForegroundColor Red
        exit 1
    }
}

# Copy PowerShell script
try {
    Copy-Item -Path $psScriptPath -Destination "$installDir\$psScript" -Force
    Write-Host "Copied PowerShell script to $installDir\$psScript" -ForegroundColor Green
} catch {
    Write-Host "Failed to copy PowerShell script: $_.Exception.Message" -ForegroundColor Red
    exit 1
}

# Copy batch script if it exists
if (Test-Path $batchScriptPath) {
    try {
        Copy-Item -Path $batchScriptPath -Destination "$installDir\$batchScript" -Force
        Write-Host "Copied batch script to $installDir\$batchScript" -ForegroundColor Green
    } catch {
        Write-Host "Warning: Failed to copy batch script: $_.Exception.Message" -ForegroundColor Yellow
    }
}

# Create a PowerShell function to add to profile
$functionContent = @"
function baneronetwo {
    & "$installDir\$psScript" @args
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
if (Test-Path "$installDir\$psScript") {
    Write-Host "Baneronetwo CLI installed successfully!" -ForegroundColor Green
    Write-Host "You can now run 'baneronetwo' from a new PowerShell window." -ForegroundColor Yellow
} else {
    Write-Host "Installation failed." -ForegroundColor Red
    exit 1
}
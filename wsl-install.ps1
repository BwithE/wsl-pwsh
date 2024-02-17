# Check if WSL is already enabled
$wslStatus = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

if ($wslStatus.State -eq "Enabled") {
    Write-Host "WSL is already enabled."
} else {
    # Enable WSL
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart

    # Check if reboot is required
    $rebootRequired = $?
    if ($rebootRequired) {
        Write-Host "WSL has been enabled. Please reboot your computer to apply the changes."
    } else {
        Write-Host "WSL has been enabled successfully."
    }
}

# Turn on WSL
wsl --set-default-version 2

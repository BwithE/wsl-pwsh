Clear-host
# Check if running as admin
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    clear-host
    Write-Host "Please run this script as an administrator." -foregroundcolor red
} else {
    # Check if WSL is already enabled
    $wslStatus = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

    if ($wslStatus.State -eq "Enabled") {
        Write-Host "WSL is already enabled." -foregroundcolor Green
    } else {
        # Enable WSL
        Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart

        # Check if reboot is required
        $rebootRequired = $?
        if ($rebootRequired) {
            Write-Host "WSL has been enabled. Please reboot your computer to apply the changes." -foregroundcolor Yellow
        } else {
            Write-Host "WSL has been enabled successfully." -foregroundcolor Green
        }
    }

# Turn on WSL
#wsl --set-default-version 2
}

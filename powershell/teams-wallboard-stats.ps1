Set-Location -Path $PSScriptRoot

Connect-MicrosoftTeams -CertificateThumbprint "example" -ApplicationId "example" -TenantId "example"

while ($true) {

    ### Some call queue ###
    $callQueue = Get-CsCallQueue -Identity "example" -WarningAction SilentlyContinue
    $outputFile = "C:\example\files\stats.txt"

    $agentsOptIn = ($callQueue.Agents | Where-Object {$_.OptIn -eq $true}).count
    $agentsInTotal = $callQueue.Agents.count
    $waitingInQueue = $callQueue.Statistics.StatValue

    # Agents opt in
    if ($agentsOptIn) {
        $agentsOptIn | Out-File $outputFile
    } else {
        "-" | Out-File $outputFile
    }

    # Agents in total
    If ($agentsInTotal) {
        $agentsInTotal | Out-File $outputFile -Append
    } else {
        "-" | Out-File $outputFile -Append
    }

    # Waiting in queue
    if ($waitingInQueue) {
        $waitingInQueue | Out-File $outputFile -Append
    } else {
        "-" | Out-File $outputFile -Append
    }

    Start-Sleep 2
}
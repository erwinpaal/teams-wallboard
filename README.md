# Microsoft Teams Wallboard
This is a simple wallboard for call queues in Microsoft Teams. Unfortunately Microsoft doesn't provide wallboard functionality, so I've created it myself. At the moment, there are no real-time call queue statistics available via Microsoft Graph, but the most important information is available via PowerShell.

## How it works
I run the `teams-wallboard-stats.ps1` PowerShell script as a scheduled task, which starts when the server starts. This script connects to Microsoft Teams using the `MicrosoftTeams` PowerShell module and executes a `Get-CsCallQueue` every 2 seconds in an infinite loop. It writes the statistics to a txt-file on the web server.

The frontend is a simple HTML file which utilizes JQuery to read the values from the txt-file every 2 seconds. There is also some CSS involved to make it responsive (so you can use it on your desktop or phone as well) and to make it look nice, of course. :smiley:

![Screenshot](/screenshot.png?raw=true "Screenshot")

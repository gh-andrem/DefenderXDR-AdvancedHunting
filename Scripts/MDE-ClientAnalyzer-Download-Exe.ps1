#=============================================================================================================================
#
# Script Name:     MDE-ClientAnalyzer-Download-Exe.ps1
# Description:     Downloads, extracts and runs MDE Client Analyzer on remote system
# Arguments:       none | RUN as administrator
# Version:	   1.0 (created 5/31/2024)
#
#=============================================================================================================================

$URL = "https://mdatpclientanalyzer.blob.core.windows.net/mdatpclientanalyzer/MDEClientAnalyzer.zip"
$Path = "C:\temp\MDEClientAnalyzer.zip"
Invoke-WebRequest -URI $URL -OutFile $Path

Expand-Archive C:\temp\MDEClientAnalyzer.zip -DestinationPath C:\temp\MDEClientAnalyzer
Remove-Item C:\temp\MDEClientAnalyzer.zip

C:\temp\MDEClientAnalyzer\MDEClientAnalyzer.cmd -r

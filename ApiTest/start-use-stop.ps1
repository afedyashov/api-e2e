$ErrorActionPreference = "Stop"

Write-Host "Starting the Api Server"
$job = dotnet run --project "$PSScriptRoot/../ApiServer/ApiServer.csproj" --launch-profile dev > "$PSScriptRoot/server.log" 2>&1 &

Write-Host "Waiting for the Api Server to initialize"
Start-Sleep -Second 5

Write-Host "Invoking the test method directly"
$result = Invoke-RestMethod -Uri http://localhost:5000/operations/sayhello
$result | Write-Host -ForegroundColor Green

Write-Host "Invoking the test via Cmdlet/SDK"
Import-Module "$PSScriptRoot/../ApiCmdlet/bin/Debug/netstandard2.0/ApiCmdlet.dll"
$result = Invoke-SayHello -BaseUrl http://localhost:5000/
$result | Write-Host -ForegroundColor Green

Write-Host "Server job information"
$job | Get-Job | Format-List | Out-String | Write-Host

Write-Host "Stopping the server job"
$job | Stop-Job

Write-Host "Server job output"
Get-Content "$PSScriptRoot/server.log" | Write-Host


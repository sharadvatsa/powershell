$services = 'service1', 'service2'
Get-Service | ? {
  $services -contains $_.Name
} | Restart-Service

& powershell Set-ExecutionPolicy unrestricted OR restricted or ByPass

& C:\tomcat\bin\tomcat8 //US//asdasdas --JvmMs=512 --JvmMx=3072

$services = '<servicename>'
Get-Service | ? {
  $services -contains $_.Name
} | Restart-Service

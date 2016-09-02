# Get the prod certificate for IIS 
#$mypwd = ("<plaintextpassword>" | ConvertTo-SecureString -AsPlainText -Force)
#Import-PfxCertificate –FilePath C:\pfxcertfolder\certificate.pfx cert:\localMachine\my -Password $mypwd
& certutil.exe -f -p <passwordadmin> -importpfx C:\pfxcertfolder\certificate.pfx NoRoot

# Set to the Web Site
$sitename = "Default Web Site"	
# Set to the Port number
$port = 443
$CertSubject = "CN=*.domain.com"

$cert = Get-ChildItem cert:\LocalMachine\My | Where-Object {$_.subject -like "$CertSubject*"}
$thumbprint = $cert.Thumbprint.ToString()
Write-Output $cert

$NewWebBinding = New-WebBinding -Name $sitename -Port $Port -Protocol "https"
Write-Output $NewWebBinding
$AddSSLCertToWebBinding = (Get-WebBinding $sitename -Port $Portt -Protocol "https").AddSslCertificate($thumbprint, "MYtp")
Write-Output $AddSSLCertToWebBinding

$cert = Get-ChildItem cert:\LocalMachine\My | Where-Object {$_.subject -like "$CertSubject*"}
get-item -Path "cert:\localmachine\my\$cert" | new-item -path IIS:\SslBindings\0.0.0.0!<portnumbertobindcert>!*.domain.com -Force

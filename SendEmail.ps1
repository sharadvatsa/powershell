# Reference -- http://www.adminarsenal.com/admin-arsenal-blog/powershell-sending-email-with-gmail-example/
# Reference -- http://www.owenwebs.com/2014/12/09/powershell-to-check-and-start-a-service/
# Add any lines just after line 37 with a service name like  -- FuncCheckService -ServiceName "<check this name from services and key in here>"
$From = "Do Not Reply System Email<ServiceCheckJob@gmail.com>"
$To = @("email1@gmail.com", "First <email1@gmail.com>", "Second <secondemail@gmail.com>")
$Cc = "Copy email<emailcopy@gmail.com>"
$Subject = " -- Service on -- " + $env:computername
$Body = " service started @ " + $env:computername + " current server time"
$SMTPServer = "smtp.<domain>.com"
$SMTPPort = "portnumber"
$User = "gmailuserid"
$Password = ("password" | ConvertTo-SecureString -AsPlainText -Force)
$MyCredential=New-Object -TypeName System.Management.Automation.PSCredential ` -ArgumentList $User, ( $Password)
##############################################################################


function FuncCheckService{
param($ServiceName)
$arrService = Get-Service -Name $ServiceName
$Date = Get-Date -Format "MM/dd/yyyy HH:mm:ss"
if ($arrService.Status -ne "Running"){
# Dodo add some line in case you feel you want to log not running service activity
Start-Service $ServiceName
 ($Date + " - " + $ServiceName + " - Started ") | Out-file c:\ServiceLogs.txt -append
 Send-MailMessage -From $From -to $To -Cc $Cc -Subject $ServiceName$Subject `
         -Body $ServiceName$Body$Date -SmtpServer $SMTPServer -port $SMTPPort -UseSsl `
         -Credential (Get-Credential $MyCredential)
}
if ($arrService.Status -eq "Running"){
# Add some line in case you feel you want to log running service activity
 ($Date + " - " + $ServiceName + " - Already On ") | Out-file c:\log.txt -append
}
}
 
FuncCheckService -ServiceName "nxlog"

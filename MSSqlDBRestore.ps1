Import-Module SQLPS
$User = "userid"
$Password = ("abcd12345" | ConvertTo-SecureString -AsPlainText -Force)
$MyCredential=New-Object -TypeName System.Management.Automation.PSCredential ` -ArgumentList $User, ( $Password)
#Write-Host $MyCredential.UserName
#Write-Host $MyCredential.Password

$RelocateDatafile = New-Object Microsoft.SqlServer.Management.Smo.RelocateFile("<dbname>", "C:\Program Files\Microsoft SQL Server\<hello>.MSSQLSERVER\MSSQL\DATA\123.mdf")
$RelocateLogfile = New-Object Microsoft.SqlServer.Management.Smo.RelocateFile("<dbname_log>", "C:\Program Files\Microsoft SQL Server\<hello>.MSSQLSERVER\MSSQL\DATA\345.ldf")
Restore-SqlDatabase -ServerInstance localhost -Database <dbname> -BackupFile "c:\<dbname>.BAK" -Credential (Get-Credential $MyCredential) -RelocateFile @($RelocateDatafile,$RelocateLogfile)

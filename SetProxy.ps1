$reg = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings"
Set-ItemProperty -Path $reg -Name ProxyServer -Value "proxyserver.domain.com:80"
Set-ItemProperty -Path $reg -Name ProxyEnable -Value 1

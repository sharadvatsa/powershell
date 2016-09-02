(Get-Content "C:\hello.txt").replace('searchtext', 'replacetext') | Set-Content "C:\hello_new.txt"


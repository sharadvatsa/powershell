$Recycler = (New-Object -ComObject Shell.Application).NameSpace(0xa)
$Recycler.items() | foreach { rm $_.path -force -recurse }

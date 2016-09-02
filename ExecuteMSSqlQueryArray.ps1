$ServerInstance = "(local)"
$Database = "databasename"
$ConnectionTimeout = 30
$Query = "sp_configure 'show advanced options', 1;","RECONFIGURE WITH OVERRIDE;","sp_configure 'max degree of parallelism', 1;","RECONFIGURE WITH OVERRIDE;","UPDATE [database].[dbo].[table] SET[column] = 'value' WHERE [condition] != 1;"
$QueryTimeout = 120
foreach ($Q in $Query){
    $conn=new-object System.Data.SqlClient.SQLConnection
    $ConnectionString = "Server={0};Database={1};Integrated Security=True;Connect Timeout={2}" -f $ServerInstance,$Database,$ConnectionTimeout
    $conn.ConnectionString=$ConnectionString
    $conn.Open()
    $cmd=new-object system.Data.SqlClient.SqlCommand($Q,$conn)
    $cmd.CommandTimeout=$QueryTimeout
    $ds=New-Object system.Data.DataSet
    $da=New-Object system.Data.SqlClient.SqlDataAdapter($cmd)
    [void]$da.fill($ds)
    $conn.Close()
    $ds.Tables
}


Set-DefaultAWSRegion -Region <regionname>
Set-AWSCredentials -AccessKey 'accesskey' -SecretKey 'longsecretkey' 
Initialize-AWSDefaults

# file copy to local
Copy-S3Object -BucketName <bucketname> -Key <frombucketfilepath> -LocalFile <destinationlocalfilepath>

# folder copy
Read-S3Object -BucketName <bucketname> -KeyPrefix <bucketsourcefolderpath> -Folder <localdestinationfolder>




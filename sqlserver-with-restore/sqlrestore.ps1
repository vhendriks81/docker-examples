# Download backup file. You could remove this and use a local copy instead
Write-Output 'Downloading backup file'
Invoke-WebRequest -OutFile "./db.bak" "https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksLT2017.bak"

# Create the backup folder inside the docker container
Write-Output 'Creating backup folder inside the docker container'
docker-compose exec sqlserver mkdir -p /var/opt/mssql-backups

# Copy the backup file to the docker container
Write-Output 'Copying backup file to the docker container'
$sqlserverContainerId = docker-compose ps -q sqlserver
docker cp ./db.bak ${sqlserverContainerId}:/var/opt/mssql-backups/db.bak

# Restore the backup inside the docker container
Write-Output 'Restoring database'
docker-compose exec sqlserver /opt/mssql-tools/bin/sqlcmd -S localhost `
-U SA -P "NoSecret@!" `
-Q "RESTORE DATABASE [AdventureWorksLT2012] FROM  DISK = N'/var/opt/mssql-backups/db.bak' WITH  FILE = 1,  MOVE N'AdventureWorksLT2012_Data' TO N'/var/opt/mssql/data/AdventureWorksLT2012_Data.mdf',  MOVE N'AdventureWorksLT2012_Log' TO N'/var/opt/mssql/data/AdventureWorksLT2012_Log.ldf',  NOUNLOAD, REPLACE, STATS = 5"


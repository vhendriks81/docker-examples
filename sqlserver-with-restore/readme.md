# Running SQLServer in a docker container with an easy way to restore a database into the container

## Start the sqlserver docker container
docker-compose up -d

## Copy the backup into the docker container and restore it (This will download the AdventureWorks database backup from GitHub)
./sqlrestore.ps1
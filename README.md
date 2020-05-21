# docker-examples

## Collection of some examples using docker/docker-compose

- [Running your own pipeline agent on your own hardware for Azure Devops](https://github.com/vhendriks81/docker-examples/tree/master/azuredevops-agent)
- [Running SQLServer in a docker container with an easy way to restore a database into the container](https://github.com/vhendriks81/docker-examples/tree/master/sqlserver-with-restore)

## Useful commands (powershell)
| Description   | Command |
|----------|:-------------|
| Run [k9s](https://k9scli.io/) (Kubernetes CLI To Manage Your Clusters In Style!)|  docker run --rm -it -v $env:USERPROFILE\.kube\config:/root/.kube/config derailed/k9s |

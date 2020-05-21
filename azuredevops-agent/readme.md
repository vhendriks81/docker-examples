# Running your own pipeline agent on your own hardware for Azure Devops

## How to get started
1) Create a personal access token. For a build pipeline grant: "Agent Pools (Read & Manage)". For a release pipeline grant: "Deployment Groups". (Or both if you want to combine this)
2) Update the azp.env file with the personal access token and the correct Azure DevOps Url
3) either just run ./start.ps1 OR run docker-compose up -d. If you want to run 2 agents on the same machine run: docker-compose up -d --scale azpagent=2
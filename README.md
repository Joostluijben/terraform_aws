# Demo code cafe azure pipelines code cafe 30/6/2020

![azure pipelines](https://azuredevopslabs.com/images/AzureDevOps-img.png)

We're deploying a spring webapp in a docker container to the azure platform.<br>
We will have a production and test environment on the azure platform. This readme is a guide on how to set this up.

## Tools used
- Maven
- Spring Boot
- Azure pipelines
- Docker

### Set up
Clone this repository

#### Create your pipeline
- Go to https://dev.azure.com 
- Create an organization
- Create a project
- Create a pipeline 
- At Select a repository click on all repositories
- Set the name of this repository

#### Next create your azure container registry
- Go to https://portal.azure.com
- Create a container registry

#### Connect your container registry with your DevOps project
- Go to your project in azure DevOps
- In the left bottom corner click on Project settings
- Service connections
- New Service Connection
- Click on Docker registry
- Select Azure Container Registry
- Click on your registry (after selecting your subscription and logging in)
- Give your connection a name such as azure Code cafe

### Connect your docker container with your webapp

#### Upload your docker image to the registry with Azure Pipelines
The maven step in the code compiles the code to a jar file in the target folder. The docker step takes this jar and puts it in a container. This is configured in the Dockerfile.
- In the azure-pipelines.yml file change the containerRegistry name to your set connection name
- Run the pipeline. The pipeline pushes the container to the registry at the given repository name and with the given tag.

#### Create an Azure Webapp
- Search on the portal for app services
- Create a new webapp
- Select Docker container on publish
- Make sure you set the plan to Free or Basic 1 for cheaper prices 
- Give it a name such as codeCafeAzurePipelines-testing
- In the next screen select Azure Container registry for Image Source
- Select the created registry, repo and tag
- Create the webapp

#### Set up the used port on the docker container
By default, the azure webapp listens to port 80. Spring boot defaults to port 8080. You can fix this by doing the following:
- Go to your webapp
- Configuration
- Add a new Application setting with key WEBSITES_PORT and value 8080
- Your webapp should work now with your docker container! Go to overview and click on browse to see it


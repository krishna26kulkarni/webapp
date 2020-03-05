# webapp
## CICD for docker web application using Github, AWS, CodeBuild, ECS, ECR and CodePipeline.

### Prerequisites:
1. A Docker image repository that contains an image you have built from your Dockerfile and application source. We are using AWS ECR.

2. An Amazon ECS task definition that references the Docker image hosted in your image repository.

3. An Amazon ECS cluster that is running a service that uses your previously mentioned task definition.

### Workflow:
1. We have created a build project in AWS Codebuild which fetches the source code from github repository and we have also created buildspec.yml which includes the phases for building the docker image and pushing that image to AWS ECR.

2. We have created a cluster with service and Task Definitions in ECS.

3. We have created a AWS Codepipeline which includes below stages:
     - Source Stage: Integrated with Github and is invoked by a webhook which triggers the pipeline.
     - Build Stage: The code is build using specifications mentioned in buildspec.yml which will create an docker image and it will be            pushed to ECR.
     - Deploy Stage: We are using ECS service to deploy our application. ECS will create a task as per imagedefinitions.json.

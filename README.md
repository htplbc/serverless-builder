## Serverless Framework Builder


This folder contains a docker container used for serverless building

* build.sh - Runs docker build and tags for public upload
* Dockerfile - Docker container based on node:6.10.0-alpine. Installs AWS CLI, Serverless and react-scripts
* release.sh - Uses the VERSION to bump a patch version. Runs the build.sh command and uploads to dockerhub. Git commits back to origin.
* VERSION - VERSION used for docker container.


# Example
> ./release.sh


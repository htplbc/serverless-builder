set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=htplbc
# image name
IMAGE=node-serverless
docker build -t $USERNAME/$IMAGE:latest .

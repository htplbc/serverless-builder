FROM node:6.10.0-alpine
MAINTAINER Hugo Samayoa <htplbc@gmail.com>

ENV SLS_VERSION=1.25.0

RUN apk add --no-cache \
    python \
    py-pip \
    ca-certificates \
    groff \
    less \
    bash \
  && pip install --no-cache-dir --upgrade pip awscli

RUN pip install awscli
RUN yarn global add serverless@$SLS_VERSION
ENTRYPOINT ["/bin/bash", "-c"]

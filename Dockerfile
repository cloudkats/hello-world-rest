###
# Build:
# docker build . -t hello-world-rest --tag local --build-arg VERSION=local
# Run:
# docker run --rm -it -p 8080:3000 hello-world-rest
# Tag and Push
# docker tag hello-world-rest:local cloudkats/hello-world-rest:local
# docker push cloudkats/hello-world-rest:local
###
FROM node:17-alpine@sha256:f61706c2cb120c06cf4fdcf60a2822a804b0bd90b6b2209be1ee00db1d33130c

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY app/package*.json ./

RUN npm install

# Bundle app source
COPY app/ .

EXPOSE 3000

ARG VERSION
ENV VERSION=$VERSION

# Metadata
LABEL org.opencontainers.image.authors="cloudkats@gmail.com" \
    org.opencontainers.image.vendor="https://github.com/cloudkats" \
    org.opencontainers.image.title="cloudkats/hello-world-rest" \
    org.opencontainers.image.source="https://github.com/cloudkats/hello-world-rest" \
    org.opencontainers.image.documentation="https://github.com/cloudkats/hello-world-rest/readme.md" \
    org.opencontainers.image.licenses="https://github.com/cloudkats/hello-world-rest/LICENCE" \
    org.opencontainers.image.version="${VERSION}"

CMD [ "node", "./server.js" ]

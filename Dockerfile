###
# Build:
# docker build . -t hello-world-rest --tag local --build-arg VERSION=local
# Run:
# docker run --rm -it -p 8080:3000 hello-world-rest
# Tag and Push
# docker tag hello-world-rest:local cloudkats/hello-world-rest:local
# docker push cloudkats/hello-world-rest:local
###
FROM node:17-slim@sha256:f3670332d1eee315ebeb69d6d6eb2e8f64a3b511a8340ad25c4090cd55b49a97

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

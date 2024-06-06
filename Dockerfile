###
# Build:
# docker build . -t hello-world-rest --tag local --build-arg VERSION=local
# Run:
# docker run --rm -it -p 8080:3000 hello-world-rest
# Tag and Push
# docker tag hello-world-rest:local cloudkats/hello-world-rest:local
# docker push cloudkats/hello-world-rest:local
###
FROM node:21-alpine@sha256:78c45726ea205bbe2f23889470f03b46ac988d14b6d813d095e2e9909f586f93

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

# hadolint ignore=DL3016,DL3018
RUN apk add --update --no-cache \
    curl bash; \
    rm -rf /var/cache/apk/*;

# Metadata
LABEL org.opencontainers.image.authors="cloudkats@gmail.com" \
    org.opencontainers.image.vendor="https://github.com/cloudkats" \
    org.opencontainers.image.title="cloudkats/hello-world-rest" \
    org.opencontainers.image.source="https://github.com/cloudkats/hello-world-rest" \
    org.opencontainers.image.documentation="https://github.com/cloudkats/hello-world-rest/readme.md" \
    org.opencontainers.image.licenses="https://github.com/cloudkats/hello-world-rest/LICENCE" \
    org.opencontainers.image.version="${VERSION}"

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

CMD [ "node", "./server.js" ]

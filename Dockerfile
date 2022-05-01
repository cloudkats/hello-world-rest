# docker build . -t hello-world-rest
# docker run -p 8080:3000 hello-world-rest
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

CMD [ "node", "./server.js" ]

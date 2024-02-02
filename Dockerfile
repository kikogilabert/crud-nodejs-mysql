FROM node:19-alpine AS install
WORKDIR /usr/src/app
COPY package.json .
RUN npm install

FROM node:19-alpine AS start
WORKDIR /usr/src/app
RUN apk update && apk add bash
COPY package.json .
COPY wait-for-it.sh .
RUN chmod +x /usr/src/app/wait-for-it.sh
COPY src /usr/src/app/src
COPY --from=install /usr/src/app/node_modules /usr/src/app/node_modules
EXPOSE 3000
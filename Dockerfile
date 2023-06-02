FROM node:18-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache git

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY ./dist /usr/src/app/

ENV NODE_ENV production

EXPOSE 5173

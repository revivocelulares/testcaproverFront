FROM node:18-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache git

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY . /usr/src/app/

RUN npm install --production && npm cache clean --force

CMD ["npm", "run", "build"]

COPY /dist /usr/src/app/

ENV NODE_ENV production

EXPOSE 80
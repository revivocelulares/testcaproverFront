# FROM socialengine/nginx-spa:latest

# COPY ./dist /app

# RUN chmod -R 777 /app

FROM node:18-alpine as build

WORKDIR /app

COPY . /app

RUN npm install --production && npm cache clean --force

ENV PATH /app/node_modules/.bin:$PATH

RUN npm run build

FROM nginx:alpine

COPY --from=build /app/dist /usr/share/nginx/html

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx/nginx.conf /etc/nginx/conf.d

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]


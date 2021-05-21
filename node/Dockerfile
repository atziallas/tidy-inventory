FROM node:12.16.1-alpine3.11
RUN apk --no-cache add git
RUN mkdir /code
WORKDIR /code
COPY ./src .
RUN npm install


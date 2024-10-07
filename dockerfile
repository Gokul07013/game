FROM node:20-alpine as build

WORKDIR  /app

COPY package*.json /app

RUN npm install && npm i -g nodemon

COPY . .

FROM node:20-alpine

WORKDIR /app

COPY --from=build /app /app

EXPOSE 3001

ENV PORT=3001

CMD [ "npm" , "run" , "dev" ]


#Docker image for aremi-natmap, modified to workaround npm install errors
FROM node:0.10.41

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json /usr/src/app/
RUN npm install; exit 0
RUN npm install
COPY . /usr/src/app

CMD [ "npm", "start" ]
MAINTAINER briely.marum@nicta.com.au
RUN apt-get update && apt-get install -y gdal-bin

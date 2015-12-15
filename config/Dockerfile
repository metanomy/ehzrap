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

#Metanomy Logo
CMD cp /opt/ehzrap/images/metanomy-logo-reversed.png /opt/ehzrap/aremi-natmap/wwwroot/images/

#EHZRAP Branding
CMD cp /opt/ehzrap/images/ehzrap.png /opt/ehzrap/aremi-natmap/wwwroot/images/

# Replace NationalMap references to EHZRAP
CMD find /opt/ehzrap/aremi-natmap -type f -print0 | xargs -0 sed -i 's/The NationalMap/EZHRAP/g'
CMD find /opt/ehzrap/aremi-natmap -type f -print0 | xargs -0 sed -i 's/NationalMap/EZHRAP/g'
CMD find /opt/ehzrap/aremi-natmap -type f -print0 | xargs -0 sed -i 's/nationalmap/EZHRAP/g'

RUN apt-get update && apt-get install -y gdal-bin

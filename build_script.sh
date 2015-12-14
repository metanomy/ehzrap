#!/bin/sh
set -e


#Clone ehzrap
cd /opt; git clone https://github.com/metanomy/ehzrap.git

#Identify apt-get vs yum

# Check for Docker, install it as necessary
#curl -sSL https://get.docker.com/ | sh



#EHZRAP Main Interface (based on TerriaJS/NationalMap)

#Get local copy of NationalMap
#git clone https://github.com/NICTA/nationalmap.git

#Get local copy of Aremi branch of NationalMap
cd /opt/ehzrap; git clone https://github.com/NICTA/aremi-natmap.git

# Get local copy of TerriaJS
#git clone https://github.com/TerriaJS/terriajs.git

#Link local version of TerriaJS to global npm package repository
#cd /opt/ezhrap/terriajs
#npm link

##Link (now) global terriajs to NationalMap
#cd /opt/ezhrap/nationalmap
#npm link terriajs

#After making changes to package.json
#cd /opt/ezhrap/terriajs
#npm install

#Convert NationalMap to EHZRAP
#cp /opt/ezhrap

#Metanomy Branding
cp /opt/ehzrap/images/metanomy-logo-reversed.png /opt/ezhrap/nationalmap/images/

#EHZRAP Branding
cd /opt/ehzrap/images/ehzrap.png /opt/ezhrap/nationalmap/images

# Replace NationalMap references to EHZRAP
find /opt/ehzrap/nationalmap -type f -print0 | xargs -0 sed -i 's/The NationalMap/EZHRAP/g'
find /opt/ehzrap/nationalmap -type f -print0 | xargs -0 sed -i 's/NationalMap/EZHRAP/g'
find /opt/ehzrap/nationalmap -type f -print0 | xargs -0 sed -i 's/nationalmap/EZHRAP/g'

#Build NationalMap
cd /opt/ehzrap/nationalmap
npm install
gulp release


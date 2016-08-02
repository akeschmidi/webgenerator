#!/bin/bash
# Erstellt ein Web Projekt mit Compass und Git
read -p "Projekt Name:" verzeichnis
#Installationsort
read -p "[s]chreibtisch oder [l]ocalhost, Abbruch mit anderen Tasten" kommando 
if [ $kommando == 's' ]; 
then pfad=$HOME'/Schreibtisch/'$verzeichnis
elif [ $kommando == 'l' ];
then pfad=/var/www/html/$verzeichnis;
else exit 0; 
fi
#Ordner und Seitenstruktur
mkdir $pfad
#cp /tmp/config.rb /tmp/index.html $pfad
cd $pfad
curl -O https://raw.githubusercontent.com/netsession/webgenerator/master/config.rb
curl -O https://raw.githubusercontent.com/netsession/webgenerator/master/index.html
mkdir img js fonts
#Compass
compass init
rm css/ie.css css/print.css scss/ie.scss scss/print.scss
#Git
git init
git add .
git commit -m "Initial commit"
compass watch $pfad

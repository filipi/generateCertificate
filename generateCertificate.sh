#!/bin/bash

while CERTIFICATES='' read -r name || [[ -n "$name" ]]; do
    echo -n "Procssing $name's certificate"
    #echo "$line" | tr ' ' '_'
    file=`echo "$name" | tr ' ' '_'`
    #echo $file
    cp templateCertificate.svg certificatesFolder/$file.svg; sed -i -e "s/NAME/$name/g" certificatesFolder/$name.svg;
    rsvg-convert -f pdf -o certificatesFolder/$file.pdf certificatesFolder/$file.svg;
    echo "  [ OK ]"
done < "$1"


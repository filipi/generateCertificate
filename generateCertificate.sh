#!/bin/bash

nofprocs=`cat /proc/cpuinfo  | grep processor | wc -l`

if [[ $nofprocs > "1" ]]; then
    echo $nofprocs " processors detected."
else
    echo "Only one processor detected."
fi

processes=1
#nofprocs=12

while CERTIFICATES='' read -r name || [[ -n "$name" ]]; do   
    fileName=`echo "$name" | tr ' ' '_'`
    upperName=""
    for word in $name; do
	upperName=$upperName" $(tr '[:lower:]' '[:upper:]' <<< ${word:0:1})${word:1}"		   
    done
    name=$upperName
    echo -n "Processing's $nome certificate "


    cp templateCertificate.svg certificatesFolder/$fileName.svg;
    sed -i -e "s/NAME/$name/g" certificatesFolder/$fileName.svg;
    sed -i -e "s/ROLE/$2/g" certificatesFolder/$fileName.svg;
    
    if [ "$processes" -gt "$[nofprocs - 1]" ];
    then    
	processes=1;
	echo -n "  [ ... ]"
	rsvg-convert -f pdf -o certificatesFolder/$fileName.pdf certificatesFolder/$fileName.svg;
	echo "  [ OK ]"
    else
	processes=$[processes+1];
	rsvg-convert -f pdf -o certificatesFolder/$fileName.pdf certificatesFolder/$fileName.svg &
	echo "  [ ... ]"
    fi;
    
done < "$1"

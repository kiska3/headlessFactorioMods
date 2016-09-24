#!/bin/bash

set -euo pipefail

if [ -w factorissimoSave ]; then
	latest=""
	for file in factorissimoSave/*.zip; do
	  [[ $file -nt $latest ]] && latest=$file
	done

fi
if [ "$#" -ne 1 ]; then
	if [ -z $latest ]; then	
        echo -e "./runFactorio.sh <ZipFileSave> \n or make sure that factorissimoSave/ is populated"
        exit 1
    else
    	save=$latest
    fi  
else
	save=$1

fi


if [ "$(file -ib $save)" != "application/zip; charset=binary" ]; then
        echo "$save is not a valid zip file."
        exit 1
fi

echo "*********** Your game password is in the quotes *********"
grep "game_password" /opt/modpackFacrorissimo/config/settings.json
echo "*********************************************************"

numthreads=$(grep -P "processor\t" /proc/cpuinfo | wc -l)
sed -i -e 's/max_threads=.*/max_threads='"$numthreads/" /opt/modpackFacrorissimo/config/config.ini

/opt/modpackFacrorissimo/bin/x64/factorio --config /opt/modpackFacrorissimo/config/config.ini --start-server $save \
                 --autosave-interval 10 --afk-autokick-interval 5 --allow-commands restrict \
                 --server-settings /opt/modpackFacrorissimo/config/settings.json 

!/bin/bash
set -euo pipefail

if [ ! -w /opt ] ; then
        echo 'Please allow $(whoami) to write to /opt';
        exit 1
fi

wget https://www.factorio.com/get-download/latest/headless/linux64 -O /tmp/latestFactorio.tar.gz

cd /opt

echo "... unpacking"
tar -xzf /tmp/latestFactorio.tar.gz -C modpackFacrorissimo


if [ ! -w /opt/modpackFacrorissimo/config/settings.json ]; then
        echo "... creating default settings.json"
        mkdir -p /opt/modpackFacrorissimo/config
        cp -n /opt/modpackFacrorissimo/data/server-settings.example.json /opt/modpackFacrorissimo/config/settings.json
fi

numthreads=$(grep -P "processor\t" /proc/cpuinfo | wc -l)


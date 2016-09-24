!/bin/bash
set -euo pipefail

if [ ! -w /opt ] ; then
        echo 'Please allow $(whoami) to write to /opt';
        exit 1
fi

wget https://www.factorio.com/get-download/latest/headless/linux64 -O /tmp/latestFactorio.tar.gz

cd /opt

echo "... unpacking"
tar -xzf /tmp/latestFactorio.tar.gz -C modpackFactorissimo


if [ ! -w /opt/modpackFactorissimo/config/settings.json ]; then
        echo "... creating default settings.json"
        mkdir -p /opt/modpackFactorissimo/config
        cp -n /opt/modpackFactorissimo/data/server-settings.example.json /opt/modpackFactorissimo/config/settings.json
fi

numthreads=$(grep -P "processor\t" /proc/cpuinfo | wc -l)


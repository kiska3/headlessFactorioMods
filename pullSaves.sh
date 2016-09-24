#!/bin/bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
	echo "please state server to pull settings from"
	exit 1
fi

ssh $1 "test -e /opt/modpackFactorissimo/config/settings.json"

if [ $? -eq 1 ]; then
    echo "cannot find settings.json on remote server. Nothing to copy"
    exit 1
fi

scp -r $1:/opt/modpackFactorissimo/saves /opt/modpackFactorissimo/
scp -r $1:/opt/modpackFactorissimo/config /opt/modpackFactorissimo/
scp -r $1:/opt/modpackFactorissimo/mods /opt/modpackFactorissimo/
scp $1:/opt/modpackFactorissimo/banlist.json /opt/modpackFactorissimo/banlist.json
scp -r $1:factorissimoSave
#!/bin/bash

set -euo pipefail

if [ ! -w mapsettings.json ]; then
cat > mapsettings.json <<- EOM
{
  "_comment": "Sizes can be specified as none, very-low, low, normal, high, very-high",

  "terrain_segmentation": "normal",
  "water": "normal",
  "width": 0,
  "height": 0,
  "starting_area": "high",
  "peaceful_mode": false,
  "autoplace_controls":
  {
    "coal": {"frequency": "very-low", "size": "high", "richness": "very-high"},
    "copper-ore": {"frequency": "very-low", "size": "high", "richness": "very-high"},
    "crude-oil": {"frequency": "very-low", "size": "high", "richness": "very-high"},
    "enemy-base": {"frequency": "low", "size": "very-high", "richness": "very-high"},
    "iron-ore": {"frequency": "very-low", "size": "high", "richness": "very-high"},
    "stone": {"frequency": "very-low", "size": "high", "richness": "very-high"}
  }
}
EOM
fi

mkdir -p /opt/modpackFactorissimo/saves



if [ -d factorissimoSave -a ! -h factorissimoSave ]; then
  echo "... migrating save directory";
  mv factorissimoSave/* /opt/modpackFactorissimo/saves/
  rm -rf factorissimoSave/
fi

if [ ! -w factorissimoSave ]; then 
  echo "... making symbolic link" 
  ln -s /opt/modpackFactorissimo/saves factorissimoSave 
fi
/opt/modpackFactorissimo/bin/x64/factorio --create /opt/modpackFactorissimo/saves/$(date +%Y%m%d) --map-gen-settings mapsettings.json
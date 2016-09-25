#!/bin/bash
set -euo pipefail

rm "$2"

rm -r /opt/modpackFactorissimo/mods

gdrive download $1

7z x -o/opt/modpackFactorissimo/mods "$2"
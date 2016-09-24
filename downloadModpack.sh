#!/bin/bash
set -euo pipefail

gdrive download $1

7z x -o /opt/modpackFactorissimo/mods "$2"
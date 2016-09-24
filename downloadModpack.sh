#!/bin/bash
set -euo pipefail

gdrive download $1

7z e -o /opt/modpackFactorissimo/mods "$2"
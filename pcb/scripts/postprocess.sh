#!/usr/bin/zsh

PROJECT=ad9958-dev

setopt extended_glob

./scripts/rename_gerbers.sh $PROJECT

./scripts/gerb_render.sh $PROJECT

./scripts/convert_schematic.sh $PROJECT

#!/bin/bash

bash scripts/rename_gerbers.sh
bash scripts/gerb_render.sh

ps2pdf -sPAPERSIZE=legal renders/ad9958-dev.ps renders/ad9958-dev.pdf
convert -alpha Off +antialias -density 40 renders/ad9958-dev.pdf renders/ad9958-dev_small.png


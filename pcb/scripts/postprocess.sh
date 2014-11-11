#!/usr/bin/zsh

PROJECT=ad9958-dev

setopt extended_glob

./scripts/rename_gerbers.sh $PROJECT

./scripts/gerb_render.sh $PROJECT

pushd renders
    for i in *.ps; do
        ps2pdf -sPAPERSIZE=letter "$i" "${i%.ps}.pdf"
    done

    pdfunite $PROJECT.pdf *.pdf~$PROJECT.pdf~schematic.pdf(N) schematic.pdf

    convert -alpha Off +antialias -density 40 $PROJECT.pdf schematic_small.png
    rm *.pdf~schematic.pdf
popd



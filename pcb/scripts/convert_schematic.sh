#!/usr/bin/zsh
setopt extended_glob

PROJECT=$1

pushd renders
    for i in *.ps; do
        ps2pdf -sPAPERSIZE=legal "$i" "${i%.ps}.pdf"
    done

    pdfunite $PROJECT.pdf *.pdf~$PROJECT.pdf~schematic.pdf(N) schematic.pdf

    convert -alpha Off +antialias -density 40 $PROJECT.pdf schematic_small.png
    rm *.pdf~schematic.pdf
popd



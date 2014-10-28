#!/bin/bash

# Target must be a target directory or .
TARGET=gerbers
PROJNAME=ad9958-dev

# Valid: ITEAD, SEEED, OSHPARK
# Or set the values manually after the conditional

MANUF=OSHPARK

if [ "$MANUF" = "OSHPARK" ]; then
    EXT_TOPCOPR="GTL"
    EXT_TOPMASK="GTS"
    EXT_TOPSILK="GTO"

    EXT_L2COPR="G2L"
    EXT_L3COPR="G3L"

    EXT_BOTCOPR="GBL"
    EXT_BOTMASK="GBS"
    EXT_BOTSILK="GBO"

    EXT_MECH="GKO"
    EXT_DRILL="XLN"

elif [ "$MANUF" = "ITEAD" ] || [ "$MANUF" = "SEEED" ]; then
    EXT_TOPCOPR="GTL"
    EXT_TOPMASK="GTS"
    EXT_TOPSILK="GTO"

    EXT_L2COPR="GL2"
    EXT_L3COPR="GL3"

    EXT_BOTCOPR="GBL"
    EXT_BOTMASK="GBS"
    EXT_BOTSILK="GBO"

    EXT_MECH="GML"
    EXT_DRILL="TXT"

fi

mkdir -p "${TARGET}"

mv -f "${PROJNAME}-F_Cu.gtl" "${TARGET}/${PROJNAME}.${EXT_TOPCOPR}"
mv -f "${PROJNAME}-F_Mask.gts" "${TARGET}/${PROJNAME}.${EXT_TOPMASK}"
mv -f "${PROJNAME}-F_SilkS.gto" "${TARGET}/${PROJNAME}.${EXT_TOPSILK}"

mv -f "${PROJNAME}-In1_Cu.gbr" "${TARGET}/${PROJNAME}.${EXT_L2COPR}"
mv -f "${PROJNAME}-In2_Cu.gbr" "${TARGET}/${PROJNAME}.${EXT_L3COPR}"

mv -f "${PROJNAME}-B_Cu.gbl" "${TARGET}/${PROJNAME}.${EXT_BOTCOPR}"
mv -f "${PROJNAME}-B_Mask.gbs" "${TARGET}/${PROJNAME}.${EXT_BOTMASK}"
mv -f "${PROJNAME}-B_SilkS.gbo" "${TARGET}/${PROJNAME}.${EXT_BOTSILK}"

mv -f "${PROJNAME}.drl" "${TARGET}/${PROJNAME}.${EXT_DRILL}"
mv -f "${PROJNAME}-NPTH.drl" "${TARGET}/${PROJNAME}-NPTH.${EXT_DRILL}"


if [ -f "${PROJNAME}-Edge_Cuts.gbr" ]; then
    mv -f "${PROJNAME}-Edge_Cuts.gbr" "${TARGET}/${PROJNAME}.${EXT_MECH}"
elif [ -f "${PROJNAME}-Eco1_User.gbr" ] ; then
    mv -f "${PROJNAME}-Eco1_User.gbr" "${TARGET}/${PROJNAME}.${EXT_MECH}"
fi

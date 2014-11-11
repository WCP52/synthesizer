#!/usr/bin/zsh

setopt extended_glob

# Target must be a target directory or .
TARGET=gerbers
PROJNAME=$1

# Valid: ITEAD, SEEED, OSHPARK
# Or set the values manually after the conditional

MANUF=OSHPARK

# Manufacturers' file extensions
exts_oshpark=(
    '*F_Cu.g*'      .GTL
    '*F_Mask.g*'    .GTS
    '*F_SilkS.g*'   .GTO
    '*In1_Cu.g*'    .G2L
    '*In2_Cu.g*'    .G3L
    '*B_Cu.g*'      .GBL
    '*B_Mask.g*'    .GBS
    '*B_SilkS.g*'   .GBO
    '*Edge_Cuts.g*' .GKO
    '*Eco1_User.g*' .GKO
    '*.drl'         .XLN
    '*-NPTH.drl'    -NPTH.XLN )

exts_itead_seeed=(
    '*F_Cu.g*'      .GTL
    '*F_Mask.g*'    .GTS
    '*F_SilkS.g*'   .GTO
    '*In1_Cu.g*'    .GL2
    '*In2_Cu.g*'    .GL3
    '*B_Cu.g*'      .GBL
    '*B_Mask.g*'    .GBS
    '*B_SilkS.g*'   .GBO
    '*Edge_Cuts.g*' .GML
    '*Eco1_User.g*' .GML
    '*.drl'         .TXT
    '*-NPTH.drl'    -NPTH.TXT )

case "$MANUF" in
    OSHPARK)
        exts=($exts_oshpark)
        ;;
    ITEAD)
        exts=($exts_itead_seeed)
        ;;
    SEEED)
        exts=($exts_itead_seeed)
        ;;
esac

mkdir -p "${TARGET}"
for pat ext in $exts; do
    file=( $~pat(N) )
    if [ -z $file ]; then continue; fi
    mv -vf $file ${TARGET}/${PROJNAME}$ext
done


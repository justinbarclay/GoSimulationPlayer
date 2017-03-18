#!/bin/bash
set -eu
RESULTDIR="testresults"
# Modify paths to your programs below as needed
NOGO1="Go4.py"
NOGO2="Go4.py"
TWOGTP="../../gogui-1.4.9/bin/gogui-twogtp" 

run() {
echo Match with $NUGAMES games on board size $BOARDSIZE. Storing results in $RESULTDIR

mkdir -p $RESULTDIR
$TWOGTP -black "$NOGO1" -white "$NOGO2" \
-auto  -komi 0 -size $BOARDSIZE -games $NUGAMES \
-sgffile $RESULTDIR/game 

$TWOGTP -analyze $RESULTDIR/game.dat -force
}

NUGAMES=2
BOARDSIZE=3
run
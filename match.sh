#!/bin/bash
set -eu
RESULTDIR="test4"
# Modify paths to your programs below as needed
NOGO1="engines/Go4Original/Go4/Go4.py"
NOGO2="Go4.py"
TWOGTP="gogui-1.4.9/bin/gogui-twogtp " 

run() {
echo Match with $NUGAMES games on board size $BOARDSIZE. Storing results in $RESULTDIR

mkdir -p $RESULTDIR
$TWOGTP -black "$NOGO1" -white "$NOGO2" \
-auto  -komi 6.5 -size $BOARDSIZE -games $NUGAMES \
-sgffile $RESULTDIR/game 

$TWOGTP -analyze $RESULTDIR/game.dat -force
}

NUGAMES=100
BOARDSIZE=5
run

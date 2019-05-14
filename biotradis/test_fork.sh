#!/bin/bash
if [ -z ${1+x} ]; then
	IMG='biotradis:git'
else
	IMG="$1"
fi
set -euxo pipefail
NAME=$(echo $IMG | perl -ne '$_=~s/[^a-z\s]/~/g; print $_;') 

echo $NAME 

REP="Bio-Tradis" 
REPURL="https://github.com/telatin/${REP}.git" 
sudo docker run --rm -it $IMG /bin/bash -c \
 "git clone $REPURL && cd $REP && source ./install_dependencies.sh && dzil test" > test_${NAME}.log 2>&1
echo "[DONE $?]" >> test_${NAME}.log

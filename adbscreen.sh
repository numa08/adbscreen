#!/bin/bash

SCRIPT=`dirname ${0}`/monkey_screen.py
MONKEY_SCREEN=`cygpath -a -w ${SCRIPT}`

usage(){
        echo "Usage: adbscreenn [-s serialno] [-f filename]" 1>&2
        echo "-s: Serial Number of devices" 1>&2
        echo "filename: output screen shot image filename" 1>&2
        exit 1
}

SERIAL=0
FILE=result.png

while getopts ":s: :f:" OPT ; do
        case ${OPT} in
                s ) 	 ENAVLE_S="t"
                         SERIAL=${OPTARG}
                        ;;
                f )
                         ENAVLE_F="t"
                         FILE=${OPTARG}
                        ;;
                :|/? ) 
                        echo ${OPT}
                        usage
                        ;;
        esac
done

if [[ ${ENAVLE_S} != "t" ]]; then
	SERIAL=`adb devices | awk 'NR == 2 {print $1;}'`
fi
if [[ ${ENAVLE_F} != "t" ]]; then
	FILE=${SERIAL}.png
fi


COMMAND="monkeyrunner.bat ${MONKEY_SCREEN} ${SERIAL} ${FILE}"
echo $COMMAND
monkeyrunner.bat ${MONKEY_SCREEN} ${SERIAL} ${FILE}

mv ${ANDROID_HOME}/tools/${FILE} ./${FILE}

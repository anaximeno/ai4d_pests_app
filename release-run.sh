#!/bin/bash


TRY() {
    COMMAND=$* ; $COMMAND ; ERR=$?
    if [[ $ERR -ne 0 ]]
    then
        echo "Error ($ERR) while running '$COMMAND'"
        exit $ERR
    fi
}


HOSTNAME=0.0.0.0
PORT=52148

echo -e "*** Running AI4Pests Flutter Frontend in Release Mode ***\n"

TRY flutter pub get && flutter run --release -d web-server --web-hostname $HOSTNAME --web-port $PORT

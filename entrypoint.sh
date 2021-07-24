#!/bin/bash

if [[ ${ENVIRONMENT} == "dev" ]]; then
    echo "Lets go dev mode!"
else
    echo "Non dev mode is not yet implemented.Exiting..."
    exit 1
fi

/home/devops/.local/bin/flask run --host=0.0.0.0
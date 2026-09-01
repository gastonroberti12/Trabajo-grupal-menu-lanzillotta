#!/bin/bash
ENTRADA="$HOME/EPNro1/entrada/"
SALIDA="$HOME/EPNro1/salida/"
PROCESADO="$HOME/EPNro1/procesado/"


while true; do
    for archivo in "$ENTRADA"/*.txt; do
        if [ -f "$archivo" ]; then
            cat "$archivo" >> "$SALIDA/$FILENAME.txt"
            echo "$(date '+%d/%m/%Y %H:%M:%S') - Procesado archivo ${archivo##*/}" >> "$HOME/EPNro1/procesado.log"
            mv "$archivo" "$PROCESADO/" # dice los datos del archivo
        fi
    done
    sleep 5
done
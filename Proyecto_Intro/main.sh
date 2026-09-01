#!/bin/bash


if [ "$1" == "-d" ]; then
    echo "Borrando en entorno y los procesos en ejecucion"
    rm -rf $HOME/EPNro1/
    pkill -f consolidar.sh
else
    export FILENAME=$1
    
fi

OPCION=""

while [ "$OPCION" != "7" ]; do
    

    echo ""
    echo "Opción 1 - Crear entorno"
    echo "Opción 2 - Correr proceso"
    echo "Opción 3 - Listado de padrones ordenados"
    echo "Opción 4 - Listado de las 10 notas más altas"
    echo "Opción 5 - Buscar número de padrón"
    echo "Opción 6 - Visualizar log"
    echo "Opción 7 - Salir"
    echo ""
    read -p "Ingrese una opción: " OPCION
    echo ""
    
    case $OPCION in
       1) mkdir -p "$HOME/EPNro1/"{entrada,salida,procesado} 
            cp consolidar.sh "$HOME/EPNro1/"
            ;;

       2) bash "$HOME/EPNro1/consolidar.sh" &;;
       
       
       3) if [ -f  "$HOME/EPNro1/salida/$FILENAME.txt" ]; then
              sort -k1,1n "$HOME/EPNro1/salida/$FILENAME.txt"
          else
           echo "ERROR: no existe el archivo $HOME/EPNro1/salida/$FILENAME.txt"
          fi
          ;;

       4) if [ -f "$HOME/EPNro1/salida/$FILENAME.txt" ]; then
             sort -k5,5nr "$HOME/EPNro1/salida/$FILENAME.txt" | head -n 10
           else
            echo "ERROR: no existe el archivo $HOME/EPNro1/salida/$FILENAME.txt"
          fi
          ;;

        5) read -p "Ingrese un numero de padron: " PADRON
           grep "$PADRON" "$HOME/EPNro1/salida/$FILENAME.txt" 
          ;;

       6) cat "$HOME/EPNro1/procesado.log"
            ;;
    
       7) exit;;

       *) echo "Opción inválida, ingrese una de las opciones";; 
    esac

    
done
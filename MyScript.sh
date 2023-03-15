#!/bin/bash

while getopts "at" opt; do
  case ${opt} in
    a)
      echo "Seleccione una opción:"
      echo "1. SCRUM"
      echo "2. X.P."
      echo "3. Kanban"
      echo "4. Crystal"
      read option
      case ${option} in
        1)
          echo "Ha seleccionado SCRUM"
          section="SCRUM"
          ;;
        2)
          echo "Ha seleccionado X.P."
          section="X.P."
          ;;
        3)
          echo "Ha seleccionado Kanban"
          section="Kanban"
          ;;
        4)
          echo "Ha seleccionado Crystal"
          section="Crystal"
          ;;
        *)
          echo "Opción inválida: ${option}" >&2
          exit 1
          ;;
      esac

      if [ -n "$section" ]; then
        echo "Usted está en la sección ${section}, seleccione la opción que desea utilizar:"
        echo "1. Agregar información"
        echo "2. Buscar"
        echo "3. Eliminar información"
        echo "4. Leer base de información"
        read choice
        case $choice in
          1)
            echo "Ha seleccionado Agregar información"
            echo "Ingrese el identificador del concepto:"
            read identifier
            echo "Ingrese la definición del concepto:"
            read definition
            echo "[$identifier] .- $definition" >> "$section.inf"
            echo "Concepto agregado correctamente"
            ;;
          2)
            echo "Ha seleccionado Buscar"
            echo "Ingrese el identificador del concepto que desea buscar:"
            read identifier
            grep "^\[$identifier\]" "$section.inf" || echo "El concepto no existe"
            ;;
          3)
            echo "Ha seleccionado Eliminar información"
            echo "Ingrese el identificador del concepto que desea eliminar:"
            read identifier
            if grep -q "^\[$identifier\]" "$section.inf"; then
              sed -i "/^\[$identifier\]/d" "$section.inf"
              echo "Concepto eliminado correctamente"
            else
              echo "El concepto no existe"
            fi
            ;;
          4)
            echo "Ha seleccionado Leer base de información"
            cat "$section.inf" || echo "No hay información disponible"
            ;;
          *)
            echo "Opción inválida: ${choice}" >&2
            exit 1
            ;;
        esac
      fi
      ;;
    t)
      echo "Seleccione una opción:"
      echo "1. Cascada"
      echo "2. Espiral"
      echo "3. Modelo V"
      read option
      case ${option} in
        1)
          echo "Ha seleccionado Cascada"
          section="Cascada"
          ;;
        2)
          echo "Ha seleccionado Espiral"
          section="Espiral"
          ;;
        3)
          echo "Ha seleccionado Modelo V"
          section="Modelo V"
          ;;
        *)
          echo "Opción inválida: ${option}" >&2
          exit 1
          ;;
      esac

      if [ -n "$section" ]; then
        echo "Usted está en la sección ${section}, seleccione la opción que desea utilizar:"
        echo "1. Agregar información"
        echo "2. Buscar"
        echo "3. Eliminar información"
        echo "4. Leer base de información"
        read choice
        case $choice in
          1)
            echo "Ha seleccionado Agregar información"
            echo "Ingrese el identificador del concepto:"
            read identifier
            echo "Ingrese la definición del concepto:"
            read definition
            echo "[$identifier] .- $definition" >> "$section.inf"
            echo "Concepto agregado correctamente"
            ;;
          2)
            echo "Ha seleccionado Buscar"
            echo "Ingrese el identificador del concepto que desea buscar:"
            read identifier
            grep "^\[$identifier\]" "$section.inf" || echo "El concepto no existe"
            ;;
          3)
            echo "Ha seleccionado Eliminar información"
            echo "Ingrese el identificador del concepto que desea eliminar:"
            read identifier
            if grep -q "^\[$identifier\]" "$section.inf"; then
              sed -i "/^\[$identifier\]/d" "$section.inf"
              echo "Concepto eliminado correctamente"
            else
              echo "El concepto no existe"
            fi
            ;;
          4)
            echo "Ha seleccionado Leer base de información"
            cat "$section.inf" || echo "No hay información disponible"
            ;;
          *)
            echo "Opción inválida: ${choice}" >&2
            exit 1
            ;;
        esac
      fi
      ;;
    *)
      echo "Opción inválida: ${opt}" >&2
      exit 1
      ;;
  esac
done
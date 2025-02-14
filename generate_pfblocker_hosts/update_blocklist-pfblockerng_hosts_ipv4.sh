#!/bin/bash
# -------------------------------------------------------------------
# Script Name: update_blocklist-pfblockerng_hosts_ipv4.sh
# Description:
#   Este script actualiza la lista de bloqueos IPv4 para pfBlockerNG
#   copiando el archivo `pfblockerng_hosts_ipv4.txt` al destino configurado.
#
# Uso:
#   ./update_blocklist-pfblockerng_hosts_ipv4.sh
#
# Dependencias:
#   - Asegúrate de que el archivo de origen existe en el directorio actual.
#   - Permisos de escritura en el directorio de destino.
#
# Autor: Armando Ferrer (github:armando-ferrer) / Para: Arco Iris Laboratorio, C.A.
# Fecha: 14/02/2025
# -------------------------------------------------------------------

# Variables
SOURCE_FILE="pfblockerng_hosts_ipv4.txt"
DESTINATION_FILE="../blocklist-pfblockerng_hosts_ipv4.txt"

# Mensajes de inicio
echo -e "\n[INFO] Iniciando la actualización de la lista de bloqueos IPv4...\n"

# Verificar si el archivo de origen existe
if [[ ! -f "$SOURCE_FILE" ]]; then
  echo -e "\e[31m[ERROR] El archivo de origen '$SOURCE_FILE' no existe. Operación cancelada.\e[0m\n"
  exit 1
fi

# Copiar el archivo al destino
if cp "$SOURCE_FILE" "$DESTINATION_FILE"; then
  echo -e "\e[32m[✔] Archivo copiado con éxito.\e[0m"
  echo -e "Origen: $SOURCE_FILE"
  echo -e "Destino: $DESTINATION_FILE\n"
else
  echo -e "\e[31m[ERROR] Falló la copia del archivo.\e[0m\n"
  exit 1
fi

# Finalización
echo -e "\n[INFO] Proceso de actualización completado.\n"

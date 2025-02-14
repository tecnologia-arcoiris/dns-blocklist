#!/bin/bash

# -----------------------------------------------------------------------
# Title: generate_pfblocker_hosts
# Filename: generate_pfblocker_hosts.sh
# GitHub: https://github.com/tecnologia-arcoiris/dns-blocklist
# Date: 2025/02/14
# Author: Armando Ferrer / Arco Iris Laboratorio, C.A.
# -----------------------------------------------------------------------
# Script Name: generate_pfblocker_hosts.sh
# Description:
#   Este script extrae direcciones IP con el formato "X.X.X.X/32" desde
#   un archivo de texto, las ordena de menor a mayor y genera un archivo
#   de hosts compatible con pfBlockerNG de pfSense.
#
# Uso:
#   1. Coloca las direcciones IP en un archivo de texto (por ejemplo, datos_ips.txt).
#   2. Asegúrate de que este script tenga permisos de ejecución: chmod +x generate_pfblocker_hosts.sh
#   3. Ejecuta el script: ./generate_pfblocker_hosts.sh
#
# Entradas:
#   - Un archivo llamado "datos_ips.txt" (o modifica la variable INPUT_FILE para usar otro nombre).
#   - Cada línea del archivo debe contener al menos una dirección IP en formato X.X.X.X/32.
#
# Salidas:
#   - Un archivo llamado "pfblockerng_hosts.txt" con las IPs ordenadas.
#
# Dependencias:
#   - grep: Para extraer direcciones IP.
#   - sort: Para ordenar las direcciones IP.
#
# Archivo generado:
#   pfblockerng_hosts.txt
#     - Formato: lista de direcciones IP (una por línea) compatible con pfBlockerNG.
#     - Encabezado que incluye la fecha de generación.
#
# Ejemplo:
#   Entrada (datos_ips.txt):
#     192.168.1.1/32 Entry added Thu, 16 Nov 2023 15:06:26 -0400
#     10.0.0.1/32 Entry added Thu, 16 Nov 2023 15:07:00 -0400
#     172.16.0.1/32 Entry added Thu, 16 Nov 2023 15:08:10 -0400
#
#   Salida (pfblockerng_hosts_ipv4.txt):
#     # Generated hosts file for pfBlockerNG
#     # Fri, 14 Feb 2025
#     10.0.0.1/32
#     172.16.0.1/32
#     192.168.1.1/32
#
# Notas:
#   - El script genera un archivo temporal (temp_ips.txt) que se elimina
#     automáticamente al final.
#
# Autor: armando ferrer - github: armando-ferer - arma2.ferrer@gmail.com
# Fecha: 14/02/2025
# -------------------------------------------------------------------


# Archivo de entrada
INPUT_FILE="datos_ips.txt" # Nombre de tu archivo TXT que contiene las IPs

# Archivo temporal para las IPs ordenadas
SORTED_IPS="sorted_ips.txt"

# Archivo final para pfBlockerNG
OUTPUT_FILE="pfblockerng_hosts_ipv4.txt"

# Extraer solo las IPs con formato "X.X.X.X/32"
grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}/32' "$INPUT_FILE" > temp_ips.txt

# Ordenar las IPs de menor a mayor
sort -n -t '.' -k1,1 -k2,2 -k3,3 -k4,4 temp_ips.txt > "$SORTED_IPS"

# Crear archivo en formato compatible con pfBlockerNG
echo "# Generated hosts file for pfBlockerNG" > "$OUTPUT_FILE"
echo "# $(date)" >> "$OUTPUT_FILE"
cat "$SORTED_IPS" >> "$OUTPUT_FILE"

# Limpiar archivo temporal
rm temp_ips.txt

# Mensaje de éxito
echo -e "\n\e[32m[✔] Archivo generado con éxito:\e[0m $OUTPUT_FILE"
echo -e "\e[34mRuta del archivo:\e[0m $(pwd)/$OUTPUT_FILE"
echo -e "\n\e[33mNota:\e[0m Recuerda ejecutar 'git pull/push' para actualizar la lista en el repositorio de GitHub.\n"


# README: generate_pfblocker_hosts

## Descripción
`generate_pfblocker_hosts.sh` es un script en Bash diseñado para procesar un archivo de texto que contiene direcciones IP en el formato `X.X.X.X/32`. Extrae las direcciones IP, las ordena de menor a mayor y genera un archivo compatible con **pfBlockerNG** de pfSense.

Este script automatiza la preparación de listas de IPs para su uso en firewalls, simplificando el proceso y garantizando un formato adecuado.

---

## Uso

1. Coloca las direcciones IP en un archivo de texto (por ejemplo, `datos_ips.txt`).
2. Asegúrate de que el script tenga permisos de ejecución:
   ```bash
   chmod +x generate_pfblocker_hosts.sh
   ```
3. Ejecuta el script:
   ```bash
   ./generate_pfblocker_hosts.sh
   ```

---

## Entradas

- Un archivo llamado `datos_ips.txt` (puedes modificar la variable `INPUT_FILE` en el script para usar otro nombre).
- Cada línea del archivo debe contener al menos una dirección IP en el formato `X.X.X.X/32`.

---

## Salidas

- Un archivo llamado `pfblockerng_hosts_ipv4.txt` que contiene las direcciones IP ordenadas en un formato compatible con pfBlockerNG.

---

## Dependencias

El script utiliza las siguientes herramientas de línea de comandos:
- **grep**: Para extraer direcciones IP del archivo de texto.
- **sort**: Para ordenar las direcciones IP de menor a mayor.

Estas herramientas vienen preinstaladas en la mayoría de distribuciones de Linux.

---

## Archivo Generado

El archivo de salida (`pfblockerng_hosts_ipv4.txt`) tiene el siguiente formato:
- Lista de direcciones IP, una por línea.
- Encabezado que incluye la fecha de generación.

### Ejemplo:
Entrada (`datos_ips.txt`):
```
192.168.1.1/32 Entry added Thu, 16 Nov 2023 15:06:26 -0400
10.0.0.1/32 Entry added Thu, 16 Nov 2023 15:07:00 -0400
172.16.0.1/32 Entry added Thu, 16 Nov 2023 15:08:10 -0400
```

Salida (`pfblockerng_hosts_ipv4.txt`):
```
# Generated hosts file for pfBlockerNG
# Fri, 14 Feb 2025
10.0.0.1/32
172.16.0.1/32
192.168.1.1/32
```

---

## Notas

- El script genera un archivo temporal (`temp_ips.txt`) que se elimina automáticamente al finalizar.
- Si deseas cambiar el nombre del archivo de entrada o salida, modifica las variables `INPUT_FILE` y `OUTPUT_FILE` en el script.

---

# README: update_blocklist-pfblockerng_hosts_ipv4.sh

## Descripción:
`update_blocklist-pfblockerng_hosts_ipv4.sh` es un script que actualiza la lista de bloqueos IPv4 para pfBlockerNG copiando el archivo `pfblockerng_hosts_ipv4.txt` al destino configurado.

## Uso:
Asegúrate de que el archivo `pfblockerng_hosts_ipv4.txt` exista en el directorio actual.
Asegúrate de que el script tenga permisos de ejecución:

```bash
chmod +x update_blocklist-pfblockerng_hosts_ipv4.sh
```

## Ejecuta el script:

```bash
./update_blocklist-pfblockerng_hosts_ipv4.sh
```
## Ejemplo de salida en la terminal:
```
[INFO] Iniciando la actualización de la lista de bloqueos IPv4...

[✔] Archivo copiado con éxito.
Origen: pfblockerng_hosts_ipv4.txt
Destino: ../blocklist-pfblockerng_hosts_ipv4.txt

[INFO] Proceso de actualización completado.
```

# Autor

Armando Ferrer (gitgub: armando-ferrer) / Para: Arco Iris Laboratorio, C.A.  

Fecha de creación: 14/02/2025

---

# Licencia

Este proyecto está bajo la licencia [MIT](https://opensource.org/licenses/MIT). Puedes usarlo, modificarlo y distribuirlo libremente.
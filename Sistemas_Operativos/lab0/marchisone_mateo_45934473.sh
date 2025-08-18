#!/bin/bash

# EJERCICIO 1: Modelo del procesador
cat /proc/cpuinfo | grep '^model name' | head -n1 | grep -oP '^model name\s*:\s\K.*'
# Explicacion: con cat /proc/cpuinfo mostramos toda la informacion contenida en el archivo, despues con el grep filtramos las lineas que contienen el contenido model name
# ya que son esos los campos que contienen el nombre del procesador. Luego nos quedamos con la primera linea y luego con una regex, imprimimos lo restante despues de model name
# EJERCICIO 2: Número de unidades de ejecución (cores)
cat /proc/cpuinfo | grep '^model name' | grep -oP '^model name\s*:\s\K.*' | wc -l
# Explicacion: Usamos el comando anterior para obtener todos los cores, pero no hacemos head, y al final contamos cuantas lineas hay con wc -l y ese es el numero de cores
# EJERCICIO 3: Lista de nombres de usuarios para red social de superhéroes
sed "1d" datos/heroes.csv | cut -d ";" -f2 | grep -v -E "^$" | tr " " "_" | tr "[:upper:]" "[:lower:]" > ./superheroes_usuarios.txt
# Explicacion: con sed, borramos el header de la tabla, para que solo queden los valores que necesitamos. Luego con cut tomamos la segunda columna, teniendo en cuenta el delimitador
# ;. Luego con el grep descartamos las lineas vacias. Con el primer tr reemplazamos los espacios con _ y con el segundo las mayusculas por minusculas.
# Finalmente con > ./superheroes_usuarios.txt guardamos la salida en el archivo
# EJERCICIO 4A: Día de máxima temperatura en Córdoba
sort -k5 -nr datos/weather_cordoba.in | head -n 1 | awk '{printf "%04d-%02d-%02d\n",$1,$2,$3}'
# Explicacion: con sort ordenamos las lineas del archivo segun lo que hay en la 5ta columna, el orden es numericamente y reverso (mayor a menor). Tomamos la primera linea con head
# y con awk devolvemos la fecha con formato YYYY-MM-DD
# EJERCICIO 4B: Día de mínima temperatura en Córdoba
sort -k6 -nr datos/weather_cordoba.in | tail -n 1 | awk '{printf "%04d-%02d-%02d\n",$1,$2,$3}'
# Explicacion: Reutilizamos el comando anterior pero con tail para agarrar la ultiuma linea y devolvemos la fecha formateada
# EJERCICIO 5: Ordenar jugadores de tenis por ranking
sort -k3 -n datos/atpplayers.in
# Explicacion: Ordenamos las lineas segun la tercer columna numericamente
# EJERCICIO 6: Ordenar tabla de Superliga por puntos y diferencia de goles
awk '{print $0, $7-$8}' datos/superliga.in | sort -k2 -nr -k9 -nr
# Explicacion: Agregamos una novena columna con la diferencia de goles, luego ordenamos primero por puntos y luego por dif de goles
# EJERCICIO 7: MAC address de la placa WiFi del equipo
ip -br link show up | grep -E '^(en|eth)' | grep -m1 -oE '([[:xdigit:]]{2}:){5}[[:xdigit:]]{2}'
# Explicacion: listamos las interfaces de red y con -br las resumimos, up filtra las activas. Con grep quedan las lineas en las cuales la interfaz empieza con en o eth
# y el ultimo grep usa una regex para imprimir la la direccion mac -m1 frena con la primera coincidencia -o imprime solo lo que coincide con la direccion mac.
# EJERCICIO 8: Renombrar archivos de subtítulos
for f in datos/serie_prueba/*_es.srt; do mv "$f" "${f%_es.srt}.srt"; done
# Explicacion: con el for itera sobre todos los archivos en la carpteta serie_prueba que terminan con _es.srt. Luego mueve de la direccion original a la direccion pero
# removiendo _es.srt al final del nombre. Luego le vuelve a agregar la extension de archivo.
# EJERCICIO 9A: Recortar video con ffmpeg
echo no lo hice
# EJERCICIO 9B: Mezclar audio con ffmpeg
echo no lo hice

#!/bin/bash
# EJERCICIO 1: Modelo del procesador
grep -i -m 1 'model name' /proc/cpuinfo | cut -d: -f2- | cut -d' ' -f2-
# EJERCICIO 2: Número de unidades de ejecución (cores)
grep -i 'model name' /proc/cpuinfo | wc -l
# EJERCICIO 3: Lista de nombres de usuarios para red social de superhéroes
cut -d';' -f2 ./datos/heroes.csv | grep -v '^$' | tr '[:upper:]' '[:lower:]' | sed 's/ /_/g' | tail -n +2 > superheroes_usuarios.txt
# EJERCICIO 4A: Día de máxima temperatura en Córdoba
cut -d' ' -f1-3,5 ./datos/weather_cordoba.in | sort -k4 -nr | head -n1 | cut -d' ' -f1-3 | sed 's/ /-/g'
# EJERCICIO 4B: Día de mínima temperatura en Córdoba
cut -d' ' -f1-3,6 ./datos/weather_cordoba.in | sort -k4 -n | head -n1 | cut -d' ' -f1-3 | sed 's/ /-/g'
# EJERCICIO 5: Ordenar jugadores de tenis por ranking
sort -k3 -n ./datos/atpplayers.in
# EJERCICIO 6: Ordenar tabla de Superliga por puntos y diferencia de goles
awk '{diff = $7 - $8; print $0, diff}' ./datos/superliga.in | sort -k2 -k9 -nr | cut -d' ' -f1-8
# EJERCICIO 7: MAC address de la placa WiFi del equipo
ip -br link show up | grep -E '^(en|eth)' | grep -m1 -oE '([[:xdigit:]]{2}:){5}[[:xdigit:]]{2}'
# EJERCICIO 8: Renombrar archivos de subtítulos
for f in serie_prueba/*_es.srt; do mv "$f" "${f%_es.srt}.srt"; done
# EJERCICIO 9A: Recortar video con ffmpeg
ffmpeg -ss 5 -to 55 -i ./ffmpeg_files/test.mp4 -c copy ./ffmpeg_files/edited.mp4
# EJERCICIO 9B: Mezclar audio con ffmpeg
ffmpeg -i ./ffmpeg_files/ala_delta.mp3 -i ./ffmpeg_files/burn.mp3 -filter_complex "amix=inputs=2:duration=shortest:dropout_transition=2" ./ffmpeg_files/remix.mp3
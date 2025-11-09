#!/usr/bin/env bash

lat=
lon=

# Fetch current weather JSON
weather=$(curl -s "https://api.open-meteo.com/v1/forecast?latitude=${lat}&longitude=${lon}&current=temperature_2m,weather_code&timezone=auto")

# Extract temperature and weather code
temp_c=$(echo "$weather" | jq -r '.current.temperature_2m')
code=$(echo "$weather" | jq -r '.current.weather_code')

# Map weather codes to icons (based on Open-Meteo WMO codes)
case $code in
  0) icon="☀" ;;   # Clear sky
  1|2) icon="🌤" ;; # Mainly clear, partly cloudy
  3) icon="☁" ;;   # Overcast
  45|48) icon="🌫" ;; # Fog
  51|53|55|61|63|65|80|81|82) icon="🌧" ;; # Rain
  71|73|75|77|85|86) icon="❄" ;; # Snow
  95|96|99) icon="⛈" ;; # Thunderstorm
  *) icon="🌤" ;;
esac

# Print output
echo "$icon  ${temp_c}°C"


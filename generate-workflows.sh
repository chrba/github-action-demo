#!/bin/zsh

# Anzahl der Namen, die generiert werden sollen
TOTAL_NAMES=20

# Verzeichnis, in dem die Dateien erstellt werden sollen
OUTPUT_DIR="generated_files"

# Sicherstellen, dass das Verzeichnis existiert
mkdir -p "$OUTPUT_DIR"

# Wörterbuch mit technischen Namen
TECH_NAMES=(
  "Apollo" "Nimbus" "Zephyr" "Orion" "Quasar"
  "Pulsar" "Photon" "Astro" "Comet" "Lunar"
  "Voyager" "Horizon" "Eclipse" "Galaxy" "Nova"
  "Nebula" "Atlas" "Cosmos" "Stellar" "Fusion"
  "Inferno" "Vertex" "Vortex" "Titan" "Echo"
  "Spectra" "Quantum" "Aurora" "Solaris" "Aether"
  "Stratus" "Cumulus" "Circuit" "Pulse" "Stream"
  "Drift" "Flux" "Core" "Matrix" "Nexus"
  "Delta" "Magnet" "Catalyst" "Relay" "Beacon"
  "Summit" "Haven" "Arc" "Trail" "Spark"
)

# Hauptlogik zur Dateigenerierung
for ((i = 1; i <= $TOTAL_NAMES; i++)); do
  NAME=${TECH_NAMES[$((i % ${#TECH_NAMES[@]}))]} # Namen aus dem Wörterbuch auswählen
  SUBNAME_COUNT=$((RANDOM % 3 + 1)) # 1 bis 3 SUBNAMEs

  for ((j = 1; j <= $SUBNAME_COUNT; j++)); do
    SUBNAME=${TECH_NAMES[$(((i + j) % ${#TECH_NAMES[@]}))]} # Subnamen ebenfalls aus dem Wörterbuch
    FILENAME="$OUTPUT_DIR/${NAME}-${SUBNAME}.yaml"

    # Dateiinhalt generieren
    cat <<EOF > "$FILENAME"
name: ${NAME}-${SUBNAME}
on:
  workflow_dispatch:

permissions:
    id-token: write
    contents: read

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Hello
        run: echo "Hello, world"
EOF
  done

done

echo "${TOTAL_NAMES} Namen und ihre Subnamen wurden in ${OUTPUT_DIR} generiert."
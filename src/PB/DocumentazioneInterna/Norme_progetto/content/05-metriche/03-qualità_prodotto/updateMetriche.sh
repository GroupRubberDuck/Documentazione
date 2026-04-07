#!/bin/bash

# Interrompe lo script se uno dei comandi fallisce (sicurezza)
# set -e 

MANAGER="python3 scripts/use_case_generator/manager.py"
BASE_DIR="src/PB/DocumentazioneInterna/Norme_progetto/content/05-metriche"

echo "🚀 metriche MPD..."
$MANAGER $BASE_DIR/03-qualità_prodotto/MPD/config/config.yaml "$@"

echo "🚀 metriche MPC..."
$MANAGER $BASE_DIR/02-qualità_processo/MPC/config/config.yaml "$@"



echo "✅ Tutti i requisiti sono stati processati con successo!"

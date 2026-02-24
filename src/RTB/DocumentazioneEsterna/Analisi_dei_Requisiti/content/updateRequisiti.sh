#!/bin/bash

# Interrompe lo script se uno dei comandi fallisce (sicurezza)
set -e 

MANAGER="python3 scripts/use_case_generator/manager.py"
BASE_DIR="src/RTB/DocumentazioneEsterna/Analisi_dei_Requisiti/content/requisiti"

echo "🚀 Generazione Requisiti Obbligatori..."
$MANAGER $BASE_DIR/requisiti_obbligatori/config/config.yml "$@"

echo "🚀 Generazione Requisiti Desiderabili..."
$MANAGER $BASE_DIR/requisiti_desiderabili/config/config.yml "$@"

echo "🚀 Generazione Requisiti Opzionali..."
$MANAGER $BASE_DIR/requisiti_opzionali/config/config.yml "$@"

echo "✅ Tutti i requisiti sono stati processati con successo!"
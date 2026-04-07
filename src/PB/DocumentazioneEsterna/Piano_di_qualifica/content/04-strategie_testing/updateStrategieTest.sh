#!/bin/bash

# Interrompe lo script se uno dei comandi fallisce (sicurezza)
# set -e 

MANAGER="python3 scripts/use_case_generator/manager.py"
BASE_DIR="src/PB/DocumentazioneEsterna/Piano_di_qualifica/content/04-strategie_testing"

echo "🚀 Generazione test di sistema..."
$MANAGER $BASE_DIR/sistema/config/config.yml "$@"

echo "🚀 Generazione test di accettazione..."
$MANAGER $BASE_DIR/accettazione/config/config.yml "$@"

#!/bin/bash

# --- Configurazione ---
# Prende le cartelle passate come argomento, oppure usa quelle di default
INPUT_DIR=${1:-"./puml"}          # Default: cartella corrente se non specificata
OUTPUT_DIR=${2:-"./png"} # Default: cartella "immagini" se non specificata

# --- Controlli iniziali ---
# Controlla se la cartella di input esiste
if [ ! -d "$INPUT_DIR" ]; then
    echo "❌ Errore: La cartella di input '$INPUT_DIR' non esiste."
    exit 1
fi

# Crea la cartella di output se non esiste già (il flag -p evita errori se esiste)
mkdir -p "$OUTPUT_DIR"

# Converte la cartella di output in un percorso assoluto (PlantUML preferisce così)
ABS_OUTPUT_DIR=$(realpath "$OUTPUT_DIR")

echo "🚀 Inizio generazione diagrammi PlantUML..."
echo "📂 Cartella sorgente: $INPUT_DIR"
echo "📁 Cartella destinazione: $ABS_OUTPUT_DIR"
echo "------------------------------------------------"

contatore=0

# --- Ciclo di compilazione ---
# Cerca tutti i file .puml nella cartella di input
for file in "$INPUT_DIR"/*.puml; do
    
    # Se la cartella è vuota, bash restituisce la stringa "*.puml". Questo if lo previene.
    if [ ! -e "$file" ]; then
        echo "⚠️ Nessun file .puml trovato nella cartella sorgente."
        exit 0
    fi

    nome_file=$(basename "$file")
    echo "⏳ Compilazione di: $nome_file ..."

    # Il comando magico: -tpng genera il png, -o indica dove salvarlo
    plantuml -tpng "$file" -o "$ABS_OUTPUT_DIR"

    contatore=$((contatore+1))
done

echo "------------------------------------------------"
echo "✅ Fatto! $contatore diagrammi generati con successo in '$OUTPUT_DIR'."
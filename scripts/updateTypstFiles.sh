#!/bin/bash

# Colori per output console
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Directory base
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC_DIR="$BASE_DIR/src"
OUTPUT_DIR="$BASE_DIR/output"
LOG_FILE="$OUTPUT_DIR/build.log" # Definiamo il percorso del log

# Variabile per tracciare il successo globale
GLOBAL_SUCCESS=0

compile_typst() {
    local input_file="$1"
    local output_dir="$2"
    local filename=$(basename "$input_file" .typ)
    local output_pdf="$output_dir/$filename.pdf"
    local temp_error_log=$(mktemp) # File temporaneo per catturare l'errore corrente

    echo "---------------------------------------------------"    
    mkdir -p "$output_dir"

    echo -e "${YELLOW}↻ Ricompilo: $input_file${NC}"

    local relative_input="${input_file#$BASE_DIR/}"
    local rawVersionNumber=$(typst query "$input_file" "<versionNumber>" --field value --one --root "$BASE_DIR" 2>/dev/null)
    local versionNumber=$(echo "$rawVersionNumber" | tr -d '"')
    
    cd "$BASE_DIR"

    # Eseguiamo compilazione reindirizzando gli errori (stderr) nel file temporaneo
    if typst compile --font-path "$BASE_DIR/src/fonts" --root "$BASE_DIR" "$relative_input" "$output_pdf" 2> "$temp_error_log"; then
        
        # --- SUCCESSO ---
        echo -e "${GREEN}✓ Completato: $output_pdf${NC}"
        echo "[OK] $(date '+%H:%M:%S') - $relative_input" >> "$LOG_FILE"
        
        # Gestione versione
        if [ -n "$versionNumber" ]; then
            local new_name="${output_dir}/${filename}-v${versionNumber}.pdf"
            mv "$output_pdf" "$new_name"
            echo -e "${GREEN}✅ Versione rilevata ($versionNumber). Rinominato in:${NC} $(basename "$new_name")"
            echo "     -> Version: $versionNumber" >> "$LOG_FILE"
        fi
        
        rm "$temp_error_log" # Pulizia
        cd - > /dev/null
        return 0

    else
        # --- ERRORE ---
        echo -e "${RED}✗ Errore nella compilazione di: $input_file${NC}"
        
        # 1. Scriviamo nel log file
        echo "---------------------------------------------------" >> "$LOG_FILE"
        echo "[ERROR] $(date '+%H:%M:%S') - $relative_input" >> "$LOG_FILE"
        cat "$temp_error_log" >> "$LOG_FILE" # Incolla il motivo dell'errore nel log
        echo "---------------------------------------------------" >> "$LOG_FILE"
        
        # 2. Mostriamo l'errore anche in console per la GitHub Action
        cat "$temp_error_log"
        
        rm "$temp_error_log" # Pulizia
        cd - > /dev/null
        return 1
    fi
}

main() {
    echo -e "${GREEN}=== Typst Compiler ===${NC}"
    
    # Pulizia e preparazione
    if [ -d "$OUTPUT_DIR" ]; then
        rm -rf "$OUTPUT_DIR"
    fi
    mkdir -p "$OUTPUT_DIR"

    # Inizializzazione Log File
    echo "=== Build Log - $(date) ===" > "$LOG_FILE"
    echo "Source: $SRC_DIR" >> "$LOG_FILE"
    echo "========================================" >> "$LOG_FILE"

    if ! command -v typst &> /dev/null; then
        echo "CRITICAL: Typst not installed" >> "$LOG_FILE"
        echo -e "${RED}Errore: typst non è installato${NC}"
        exit 1
    fi

    # Loop sui file (usando process substitution per mantenere GLOBAL_SUCCESS)
    while IFS= read -r -d '' file; do
        local relative_path=$(dirname "${file#$SRC_DIR/}")
        local output_subdir="$OUTPUT_DIR/$relative_path"
        
        if ! compile_typst "$file" "$output_subdir"; then
            GLOBAL_SUCCESS=1
        fi
    done < <(find "$SRC_DIR" -type f -name "*.typ" \
        ! -path "*/content/*" \
        ! -path "*/TypstTemplate/*" \
        ! -name "config.typ" \
        ! -name "root.typ" \
        -print0)

    echo -e "\n---------------------------------------------------"
    
    if [ $GLOBAL_SUCCESS -ne 0 ]; then
        echo "Build FAILED at $(date)" >> "$LOG_FILE"
        echo -e "${RED}=== Compilazione fallita per uno o più documenti. Controlla build.log ===${NC}"
        exit 1
    else
        echo "Build SUCCESS at $(date)" >> "$LOG_FILE"
        echo -e "${GREEN}=== Tutti i documenti compilati con successo ===${NC}"
        exit 0
    fi
}

main "$@"
#!/bin/bash

# Colori per output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Directory base
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC_DIR="$BASE_DIR/src"
OUTPUT_DIR="$BASE_DIR/output"

compile_typst() {
    local input_file="$1"
    local output_dir="$2"
    local filename=$(basename "$input_file" .typ)
    local output_pdf="$output_dir/$filename.pdf"

    echo "---------------------------------------------------"    
    mkdir -p "$output_dir"

    echo -e "${YELLOW}↻ Ricompilo: $input_file${NC}"

    local relative_input="${input_file#$BASE_DIR/}"
    local rawVersionNumber=$(typst query $input_file "<versionNumber>" --field value --one --root $BASE_DIR 2>/dev/null)
    local versionNumber=$(echo "$rawVersionNumber" | tr -d '"')
    cd "$BASE_DIR"
    if typst compile --font-path "$BASE_DIR/src/fonts" --root "$BASE_DIR" "$relative_input" "$output_pdf"; then
        echo -e "${GREEN}✓ Completato: $output_pdf${NC}"
    else
        echo -e "${RED}✗ Errore nella compilazione di: $input_file${NC}"
        cd - > /dev/null
        return 1
    fi
    cd - > /dev/null
    if [ -n "$versionNumber" ]; then
        # Se la variabile $version non è vuota
        local new_name="${output_dir}/${filename}-v${versionNumber}.pdf"
        
        mv "$output_pdf" "$new_name"
        echo -e "${GREEN}✅ Versione rilevata ($versionNumber). Rinominato in:${NC} $(basename "$new_name")"
    else
        # Se non c'è versione
        echo -e "${YELLOW}ℹ️  Nessuna versione trovata. Mantenuto:${NC} $(basename "$output_pdf")"
    fi
}

main() {
    echo -e "${GREEN}=== Typst Compiler ===${NC}"
    echo "Sorgente: $SRC_DIR"
    echo "Output:   $OUTPUT_DIR"
# --- INIZIO MODIFICA: Pulizia ---
    if [ -d "$OUTPUT_DIR" ]; then
        echo -e "${YELLOW}🗑️  Pulisco la directory di output...${NC}"
        rm -rf "$OUTPUT_DIR"
    fi
    mkdir -p "$OUTPUT_DIR"
    # --- FINE MODIFICA ---
    if ! command -v typst &> /dev/null; then
        echo -e "${RED}Errore: typst non è installato o non è nel PATH${NC}"
        exit 1
    fi

    find "$SRC_DIR" -type f -name "*.typ" \
        ! -name "config.typ" \
        ! -name "root.typ" \
        ! -path "*/TypstTemplate/*" -print0 |
    while IFS= read -r -d '' file; do
        local relative_path=$(dirname "${file#$SRC_DIR/}")
        local output_subdir="$OUTPUT_DIR/$relative_path"
        compile_typst "$file" "$output_subdir"
    done

    echo -e "\n${GREEN}=== Compilazione completata ===${NC}"
}

main "$@"

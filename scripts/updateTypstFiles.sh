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
CONFIG_FILES=("$SRC_DIR/config.typ" "$SRC_DIR/root.typ")
TEMPLATE_DIR="$SRC_DIR/TypstTemplate"

# Controlla se il PDF deve essere aggiornato
needs_recompile() {
    local input_file="$1"
    local output_pdf="$2"

    # Se il PDF non esiste
    if [ ! -f "$output_pdf" ]; then
        return 0
    fi

    # Se il file principale è più recente
    if [ "$input_file" -nt "$output_pdf" ]; then
        return 0
    fi

    # Se uno dei file config è più recente
    for cfg in "${CONFIG_FILES[@]}"; do
        if [ -f "$cfg" ] && [ "$cfg" -nt "$output_pdf" ]; then
            return 0
        fi
    done

    # Se un template è più recente
    if find "$TEMPLATE_DIR" -type f -name "*.typ" -newer "$output_pdf" | grep -q .; then
        return 0
    fi

    # Tutto aggiornato
    return 1
}

compile_typst() {
    local input_file="$1"
    local output_dir="$2"
    local filename=$(basename "$input_file" .typ)
    local output_pdf="$output_dir/$filename.pdf"

    mkdir -p "$output_dir"

    if ! needs_recompile "$input_file" "$output_pdf"; then
        echo -e "${GREEN}✓ PDF già aggiornato: $output_pdf${NC}"
        return 0
    else
        echo -e "${YELLOW}↻ Ricompilo: $input_file${NC}"
    fi

    local relative_input="${input_file#$BASE_DIR/}"

    cd "$BASE_DIR"
    if typst compile --font-path "$BASE_DIR/src/fonts" --root "$BASE_DIR" "$relative_input" "$output_pdf"; then
        echo -e "${GREEN}✓ Completato: $output_pdf${NC}"
    else
        echo -e "${RED}✗ Errore nella compilazione di: $input_file${NC}"
        cd - > /dev/null
        return 1
    fi
    cd - > /dev/null
}

main() {
    echo -e "${GREEN}=== Typst Compiler ===${NC}"
    echo "Sorgente: $SRC_DIR"
    echo "Output:   $OUTPUT_DIR"

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

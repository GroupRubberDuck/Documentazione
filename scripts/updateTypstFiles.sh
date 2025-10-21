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
echo $BASE_DIR
echo $SRC_DIR
echo $OUTPUT_DIR

compile_typst() {
    local input_file="$1"
    local output_dir="$2"
    local filename=$(basename "$input_file" .typ)
    echo $filename
    echo -e "${YELLOW}Compilando: $input_file${NC}"
    
    mkdir -p "$output_dir"
    
    # Calculate relative path from BASE_DIR to input file
    local relative_input="${input_file#$BASE_DIR/}"
    
    # Compile from the base directory with root flag
    cd "$BASE_DIR"
    if typst compile --root "$BASE_DIR" "$relative_input" "$output_dir/$filename.pdf"; then
        echo -e "${GREEN}✓ Completato: $output_dir/$filename.pdf${NC}"
    else
        echo -e "${RED}✗ Errore nella compilazione di: $input_file${NC}"
        cd - > /dev/null
        return 1
    fi
    cd - > /dev/null
}

# Funzione principale
main() {
    echo -e "${GREEN}=== Typst Compiler ===${NC}"
    echo "Directory sorgente: $SRC_DIR"
    echo "Directory output: $OUTPUT_DIR"
    
    # Verifica che typst sia installato
    if ! command -v typst &> /dev/null; then
        echo -e "${RED}Errore: typst non è installato o non è nel PATH${NC}"
        exit 1
    fi
    
    # # Compila tutti i file typst ricorsivamente
    # find "$SRC_DIR" -type f -name "*.typ" | while read -r file; do
    #     local relative_path=$(dirname "${file#$SRC_DIR/}")
    #     local output_subdir="$OUTPUT_DIR/$relative_path"
    #     compile_typst "$file" "$output_subdir"
    # done
    
    find "$SRC_DIR" -type f -name "*.typ" \
    ! -name "config.typ" \
    ! -name "root.typ" \
    ! -path "*/TypstTemplate/*" | while read -r file; do
    local relative_path=$(dirname "${file#$SRC_DIR/}")
    local output_subdir="$OUTPUT_DIR/$relative_path"
    compile_typst "$file" "$output_subdir"
done


    echo -e "\n${GREEN}=== Compilazione completata ===${NC}"
}

# Esegui la funzione principale
main "$@"

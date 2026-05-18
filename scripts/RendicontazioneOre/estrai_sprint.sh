#!/bin/bash

# Spostati in automatico nella cartella principale del progetto Git
cd "$(git rev-parse --show-toplevel)"

REPO_DOC="$(pwd)"
REPO_POC="$(dirname "$REPO_DOC")/MVP"

# Chiede in input i dati dello Sprint
read -p "Inserisci il nome dello Sprint (es. Sprint1): " NOME_SPRINT
read -p "Inserisci la data di INIZIO sprint (YYYY-MM-DD): " DATA_INIZIO
read -p "Inserisci la data di FINE sprint (YYYY-MM-DD): " DATA_FINE

# Creazione della cartella di destinazione (se non esiste già)
DIR_DESTINAZIONE="scripts/RendicontazioneOre/Output"
mkdir -p "$DIR_DESTINAZIONE"

FILE_OUTPUT="$DIR_DESTINAZIONE/estrazione_commit_${NOME_SPRINT}.csv"

echo "Data|Autore|Hash|Messaggio|Aggiunte|Tolte" > "$FILE_OUTPUT"

extract_commits() {
    local REPO_PATH="$1"

    if [ ! -d "$REPO_PATH" ]; then
        echo "Attenzione: la cartella '$REPO_PATH' non esiste, salto."
        return
    fi

    git -C "$REPO_PATH" log --all --no-merges \
        --since="$DATA_INIZIO 00:00:00" --until="$DATA_FINE 23:59:59" \
        --date=short --pretty=format:"%ad|%an|%h|%s|%H" | while IFS='|' read -r data autore hash msg fullhash; do

        # FILTRO BOT
        if [[ "$autore" == "GitHub Action" || "$autore" == *"bot"* ]]; then
            continue
        fi

        # STANDARDIZZAZIONE NOMI
        case "$autore" in
            "aldobettega"|"aldobettega-unipd") autore="Aldo" ;;
            "Ana Maria"|"Ana Maria Draghici") autore="Ana" ;;
            "Davide") autore="Testolin" ;;
            "FelicianNek") autore="Felix" ;;
            "genos36"|"D-lore-unipd") autore="Lorenzon" ;;
            "unluckypippo") autore="Filippo" ;;
        esac

        # FILTRO MERGE MANUALI
        case "$msg" in
            [Mm]erge*) continue ;;
        esac

        # ESTRAZIONE RIGHE SOLO PER FILE SPECIFICI
        stats=$(git -C "$REPO_PATH" show --shortstat --format="" $fullhash -- "*.typ" "*.py" "*.html" "*.sh" "*.md")

        aggiunte=$(echo "$stats" | grep -Eo '[0-9]+ insertion' | grep -Eo '[0-9]+')
        tolte=$(echo "$stats" | grep -Eo '[0-9]+ deletion' | grep -Eo '[0-9]+')

        aggiunte=${aggiunte:-0}
        tolte=${tolte:-0}

        if [[ "$aggiunte" -eq 0 && "$tolte" -eq 0 ]]; then
            continue
        fi

        echo "$data|$autore|$hash|$msg|$aggiunte|$tolte"

    done
}

{
    extract_commits "$REPO_DOC"
    extract_commits "$REPO_POC"
} | sort -t'|' -k1,1 >> "$FILE_OUTPUT"

echo "Fatto! File salvato con successo in: $FILE_OUTPUT"
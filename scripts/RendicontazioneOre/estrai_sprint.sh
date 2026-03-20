#!/bin/bash

# Spostati in automatico nella cartella principale del progetto Git
cd "$(git rev-parse --show-toplevel)"

# Chiede in input i dati dello Sprint
read -p "Inserisci il nome dello Sprint (es. Sprint1): " NOME_SPRINT
read -p "Inserisci la data di INIZIO sprint (YYYY-MM-DD): " DATA_INIZIO
read -p "Inserisci la data di FINE sprint (YYYY-MM-DD): " DATA_FINE

# Creazione della cartella di destinazione (se non esiste già)
DIR_DESTINAZIONE="scripts/RendicontazioneOre/Output"
mkdir -p "$DIR_DESTINAZIONE"

# Creazione del nome file dinamico
FILE_OUTPUT="$DIR_DESTINAZIONE/estrazione_commit_${NOME_SPRINT}.csv"

# Crea l'intestazione del file (sovrascrivendo se esiste già)
echo "Data|Autore|Hash|Messaggio|Aggiunte|Tolte" > "$FILE_OUTPUT"

echo "Estrazione dei commit dal $DATA_INIZIO al $DATA_FINE in corso..."

# Scorre tutti i branch filtrando per le date dello Sprint
# Aggiungiamo 00:00:00 all'inizio e 23:59:59 alla fine per prendere i giorni interi
git log --all --no-merges --since="$DATA_INIZIO 00:00:00" --until="$DATA_FINE 23:59:59" --date=short --pretty=format:"%ad|%an|%h|%s|%H" | while IFS='|' read -r data autore hash msg fullhash; do
    
    # FILTRO BOT -> toglie le githubaction
    if [[ "$autore" == "GitHub Action" || "$autore" == *"bot"* ]]; then
        continue
    fi

    # STANDARDIZZAZIONE NOMI AUTORI
    case "$autore" in
        "aldobettega"|"aldobettega-unipd") autore="Aldo" ;;
        "Ana Maria"|"Ana Maria Draghici") autore="Ana" ;;
        "Davide") autore="Testolin" ;;
        "FelicianNek") autore="Felix" ;;
        "genos36"|"D-lore-unipd") autore="Lorenzon" ;;
        "unluckypippo") autore="Filippo" ;;
    esac

    # FILTRO MANUALE DEI MERGE -> toglie i commit di merge
    case "$msg" in
        [Mm]erge*) continue ;;
    esac

    # ESTRAZIONE RIGHE SOLO PER FILE SPECIFICI -> seleziona modifiche solo sui file con le seguenti estensioni
    stats=$(git show --shortstat --format="" $fullhash -- "*.typ" "*.py" "*.html" "*.sh" "*.md")
    
    aggiunte=$(echo "$stats" | grep -Eo '[0-9]+ insertion' | grep -Eo '[0-9]+')
    tolte=$(echo "$stats" | grep -Eo '[0-9]+ deletion' | grep -Eo '[0-9]+')
    
    aggiunte=${aggiunte:-0}
    tolte=${tolte:-0}
    
    # ELIMINAZIONE RIGHE INUTILI -> elimina commit che hanno 0 insert e 0 remove
    if [[ "$aggiunte" -eq 0 && "$tolte" -eq 0 ]]; then 
        continue 
    fi
    
    # SALVATAGGIO 
    echo "$data|$autore|$hash|$msg|$aggiunte|$tolte"
    
done >> "$FILE_OUTPUT"

echo "Fatto! File salvato con successo in: $FILE_OUTPUT"
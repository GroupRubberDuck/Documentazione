#!/bin/bash

# si sposta alla radice del progetto per far andare i percorsi relativi
cd "$(git rev-parse --show-toplevel)"

# Chiede in input il percorso relativo della cartella
read -p "Inserisci il percorso relativo della cartella del documento: " CARTELLA

# Controllo di sicurezza: verifica se la cartella inserita esiste
if [ ! -d "$CARTELLA" ]; then
    echo "Errore: La cartella '$CARTELLA' non esiste. Controlla di aver scritto bene il percorso."
    exit 1
fi

# Imposta l'estensione e il percorso di salvataggio
ESTENSIONE="typ"

# Creazione della cartella di destinazione (se non esiste già)
DIR_DESTINAZIONE="scripts/RendicontazioneOre/Output"
mkdir -p "$DIR_DESTINAZIONE"

# Creazione del nome file dinamico
NOME_CARTELLA=$(basename "$CARTELLA")
FILE_OUTPUT="$DIR_DESTINAZIONE/estrazione_$NOME_CARTELLA.csv"

echo "Data|Autore|Hash|Messaggio|Aggiunte|Tolte" > "$FILE_OUTPUT"

echo "Estrazione in corso da '$CARTELLA' per i file .$ESTENSIONE..."

# git log cerca SOLO in quella cartella e SOLO i file con quell'estensione
git log --all --no-merges --date=short --pretty=format:"%ad|%an|%h|%s|%H" -- "$CARTELLA/**/*.$ESTENSIONE" "$CARTELLA/*.$ESTENSIONE" | while IFS='|' read -r data autore hash msg fullhash; do
    
    # Filtro Bot
    if [[ "$autore" == "GitHub Action" || "$autore" == *"bot"* ]]; then
        continue
    fi

    # Standardizzazione Nomi
    case "$autore" in
        "aldobettega"|"aldobettega-unipd") autore="Aldo" ;;
        "Ana Maria"|"Ana Maria Draghici") autore="Ana" ;;
        "Davide") autore="Testolin" ;;
        "FelicianNek") autore="Felix" ;;
        "genos36"|"D-lore-unipd") autore="Lorenzon" ;;
        "unluckypippo") autore="Filippo" ;;
    esac

    # Filtro Merge manuali
    case "$msg" in
        [Mm]erge*) continue ;;
    esac

    # git show conta le righe aggiunte/tolte ESCLUSIVAMENTE per quei file specifici
    stats=$(git show --shortstat --format="" $fullhash -- "$CARTELLA/**/*.$ESTENSIONE" "$CARTELLA/*.$ESTENSIONE")
    
    aggiunte=$(echo "$stats" | grep -Eo '[0-9]+ insertion' | grep -Eo '[0-9]+')
    tolte=$(echo "$stats" | grep -Eo '[0-9]+ deletion' | grep -Eo '[0-9]+')
    
    aggiunte=${aggiunte:-0}
    tolte=${tolte:-0}
    
    # Se in questo commit non sono state toccate vere righe di codice per l'estensione scelta, saltalo
    if [[ "$aggiunte" -eq 0 && "$tolte" -eq 0 ]]; then 
        continue 
    fi
    
    echo "$data|$autore|$hash|$msg|$aggiunte|$tolte"
    
done >> "$FILE_OUTPUT"

echo "Fatto! File salvato con successo in: $FILE_OUTPUT"
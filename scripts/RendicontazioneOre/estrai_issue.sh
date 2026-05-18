#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$(git rev-parse --show-toplevel)"
REPO_ROOT="$(pwd)"
TEMP_ALL="$REPO_ROOT/temp_all_issues.txt"
TEMP_FILTERED="$REPO_ROOT/temp_filtered_issues.txt"

read -p "Inserisci il nome dello Sprint (es. Sprint1): " NOME_SPRINT
read -p "Inserisci la data di INIZIO sprint (YYYY-MM-DD): " DATA_INIZIO
read -p "Inserisci la data di FINE sprint (YYYY-MM-DD): " DATA_FINE

OWNER="GroupRubberDuck"

DIR_DESTINAZIONE="scripts/RendicontazioneOre/Output"
mkdir -p "$DIR_DESTINAZIONE"
FILE_OUTPUT="$DIR_DESTINAZIONE/estrazione_issue_${NOME_SPRINT}.csv"

echo "Title|URL|Autore|Verificatore|Start date|End date|Size" > "$FILE_OUTPUT"

# Pulisco il file temporaneo principale (nel caso esista da esecuzioni precedenti)
> "$TEMP_ALL"

# === FUNZIONE PER SCARICARE I DATI DI UN PROGETTO ===
fetch_project_issues() {
    local project_number=$1
    local project_name=$2
    echo "Scaricamento dati da $project_name (board $project_number)..."

    gh api graphql --paginate -f query='
    query($endCursor: String) {
      organization(login: "'"$OWNER"'") {
        projectV2(number: '"$project_number"') {
          items(first: 100, after: $endCursor) {
            pageInfo { hasNextPage endCursor }
            nodes {
              content {
                ... on Issue {
                  title
                  url
                  body
                  createdAt
                  closedAt
                  assignees(first: 10) { nodes { login } }
                }
              }
              fieldValues(first: 20) {
                nodes {
                  ... on ProjectV2ItemFieldSingleSelectValue {
                    name
                    field { ... on ProjectV2SingleSelectField { name } }
                  }
                  ... on ProjectV2ItemFieldDateValue {
                    date
                    field { ... on ProjectV2Field { name } }
                  }
                }
              }
            }
          }
        }
      }
    }' | jq -r -f "$SCRIPT_DIR/jq_filter.jq" >> "$TEMP_ALL"
}
# ====================================================

# Eseguo il fetch per tutte le board richieste
fetch_project_issues 2 "Documentazione"
fetch_project_issues 7 "PoC"
fetch_project_issues 9 "Nuova Board (Progetto 9)"

NUM_ISSUE=$(wc -l < "$TEMP_ALL")
echo "Scaricamento completato: $NUM_ISSUE issue totali elaborate."

# Standardizzazione nomi utente
python3 "$SCRIPT_DIR/normalizza_nomi.py" "$TEMP_ALL"

# Filtraggio per date sprint e ordinamento per numero issue
awk -F'|' -v start="$DATA_INIZIO" -v end="$DATA_FINE" '{
    if ($5 <= end && ($6 == "-" || $6 >= start)) {
        n=split($2, arr, "/");
        print arr[n] "|" $0
    }
}' "$TEMP_ALL" | sort -t'|' -k1,1n | cut -d'|' -f2- > "$TEMP_FILTERED"

NUM_FILTRATE=$(wc -l < "$TEMP_FILTERED")
echo "Di queste, $NUM_FILTRATE risultano attive nello $NOME_SPRINT."

cat "$TEMP_FILTERED" >> "$FILE_OUTPUT"
rm "$TEMP_ALL" "$TEMP_FILTERED"

echo "Fatto! File salvato con successo in: $FILE_OUTPUT"
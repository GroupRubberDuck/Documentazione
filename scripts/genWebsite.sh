#!/bin/bash
#Script utilizzato per generare le liste di verbali nel sito
months=(Gennaio Febbraio Marzo Aprile Maggio Giugno Luglio Agosto Settembre Ottobre Novembre Dicembre)

websiteUrl="https://grouprubberduck.github.io/Documentazione/"

# Usage: replaceInFile "<pdf_path>" "<delimiter_name>"
replaceInFile() {
    out="<!--%BEGIN_$2%-->"
    for f in $(ls -1r "$1"*.pdf); do
        name="$(echo $f | rev | cut -d '/' -f 1 | rev)"
        version="$(echo $name | grep -oE 'v[0-9]+\.[0-9]+\.[0-9]+')"
        title="$(echo $name | cut -d '_' -f 1)"
        type="$(echo $name | cut -d '_' -f 2- | cut -d '-' -f 1 | cut -d '_' -f 1)"
        if [ ! "$type" = "Verbale" ] && [ ! "$type" = "Diario" ]; then
            title="$(echo $name | cut -d '-' -f 1 | tr '_' ' ')"
        fi
        if [ "$type" = "Diario" ] && [ "$version" = "" ]; then
            version="v1.0"
        fi
        # Aggiunge un elemento alla lista nel buffer
        out="$out        <li><a href=\"$websiteUrl$f\" target=\"_blank\">$title</a> - <span class=\"file-version\">$version</span></li>\n"
    done
    out="$out<!--%END_$2%-->"
    # Rimpiazza i due delimitatori e il loro contenuto con il buffer creato
    sed -z -i "s#<!--%BEGIN_$2%-->.*<!--%END_$2%-->#$out#g" index.html
}

# PB
replaceInFile "output/PB/DocumentazioneEsterna/VerbaliEsterni/" "PB_VERBALI_ESTERNI"
replaceInFile "output/PB/DocumentazioneInterna/VerbaliInterni/" "PB_VERBALI_INTERNI"
replaceInFile "output/PB/DocumentazioneEsterna/Analisi_dei_Requisiti/" "PB_ADR"
replaceInFile "output/PB/DocumentazioneEsterna/Manuale_Utente/" "PB_MU"
replaceInFile "output/PB/DocumentazioneEsterna/Piano_di_Progetto/" "PB_PDP"
replaceInFile "output/PB/DocumentazioneEsterna/Piano_di_qualifica/" "PB_PDQ"
replaceInFile "output/PB/DocumentazioneInterna/Norme_progetto/" "PB_NDP"

# RTB
replaceInFile "output/RTB/DocumentazioneEsterna/VerbaliEsterni/" "RTB_VERBALI_ESTERNI"
replaceInFile "output/RTB/DocumentazioneInterna/VerbaliInterni/" "RTB_VERBALI_INTERNI"
replaceInFile "output/RTB/DocumentazioneEsterna/Analisi_dei_Requisiti/" "RTB_ADR"
replaceInFile "output/RTB/DocumentazioneEsterna/Piano_di_Progetto/" "RTB_PDP"
replaceInFile "output/RTB/DocumentazioneEsterna/Piano_di_qualifica/" "RTB_PDQ"
replaceInFile "output/RTB/DocumentazioneInterna/Norme_progetto/" "RTB_NDP"

# Candidatura
replaceInFile "output/Candidatura/" "CANDIDATURA_VERBALI"
replaceInFile "output/Candidatura/DocumentazioneInterna/" "CANDIDATURA_VERBALI_INTERNI"
replaceInFile "output/Candidatura/DocumentazioneEsterna/" "CANDIDATURA_VERBALI_ESTERNI"

# Diario di bordo
replaceInFile "output/DiariDiBordo/" "DIARIO_DI_BORDO"

# Disattivato dato che ora il glossario viene gestito in un altro modo
# BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# SRC_DIR="$BASE_DIR/src"
# path_dizionario="$SRC_DIR/RTB/DocumentazioneInterna/dizionario.typ"
# typst query --root "$BASE_DIR" --format json --field value --one "$path_dizionario" "<dizionario>" | python3 ./scripts/genGlossario.py > glossario.html 
#!/bin/bash
#Script utilizzato per generare le liste di verbali nel sito
months=(Gennaio Febbraio Marzo Aprile Maggio Giugno Luglio Agosto Settembre Ottobre Novembre Dicembre)

websiteUrl="https://grouprubberduck.github.io/Documentazione/"

# Usage: replaceInFile "<pdf_path>" "<delimiter_name>""
replaceInFile() {
    out="<!--%BEGIN_$2%-->"
    for f in $(ls -1r "$1"*.pdf); do
        # Estrae la data dal verbale dal nome del PDFpdf. Il PDF deve essere nominato 'Nome_Completo_YYYY_MM_DD.pdf'.
        name="$(echo $f | rev | cut -d '/' -f 1 | rev)"
        version="$(echo $name | cut -d '-' -f 4)"
        version="${version::-4}"
        date="$(echo $name | cut -d '_' -f 1)"
        name="$(echo $name | cut -d '_' -f 2- | cut -d '-' -f 1)"
        # Aggiunge un elemento alla lista nel buffer
        out="$out        <li><a href=\"$websiteUrl$f\" target=\"_blank\">$date</a> - <span class=\"file-version\">$version</span></li>\n"
    done
    out="$out<!--%END_$2%-->"
    # Rimpiazza i due delimitatori e il loro contenuto con il buffer creato
    sed -z -i "s#<!--%BEGIN_$2%-->.*<!--%END_$2%-->#$out#g" index.html
}

# RTB
replaceInFile "output/RTB/DocumentazioneEsterna/VerbaliEsterni/" "RTB_VERBALI_ESTERNI"
replaceInFile "output/RTB/DocumentazioneInterna/VerbaliInterni/" "RTB_VERBALI_INTERNI"

# Candidatura
# replaceInFile "output/Candidatura/" "CANDIDATURA_VERBALI"
replaceInFile "output/Candidatura/DocumentazioneInterna/" "CANDIDATURA_VERBALI_INTERNI"
replaceInFile "output/Candidatura/DocumentazioneEsterna/" "CANDIDATURA_VERBALI_ESTERNI"

# Diario di bordo
replaceInFile "output/DiariDiBordo/" "DIARIO_DI_BORDO"

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC_DIR="$BASE_DIR/src"
path_dizionario="$SRC_DIR/RTB/DocumentazioneInterna/dizionario.typ"
typst query --root "$BASE_DIR" --format json --field value --one "$path_dizionario" "<dizionario>" | python3 ./scripts/genGlossario.py > glossario.html 
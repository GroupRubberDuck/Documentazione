#!/bin/bash
#Script utilizzato per generare le liste di verbali nel sito

websiteUrl="https://grouprubberduck.github.io/Documentazione/"

# Usage: replaceInFile "<pdf_path>" "<delimiter_name>""
replaceInFile() {
    out="<!--%BEGIN_$2%-->"
    for f in $(ls -1 "$1"*.pdf); do
        # Estrae la data dal verbale dal nome del PDFpdf. Il PDF deve essere nominato 'Nome_Completo_YYYY_MM_DD.pdf'.
        name="$(echo $f | rev | cut -d '/' -f 1 | rev)"
        # Aggiunge un elemento alla lista nel buffer
        out="$out        <li><a href="$websiteUrl$f" target="_blank">${name::-4}</a></li>\n"
    done
    out="$out<!--%END_$2%-->"
    # Rimpiazza i due delimitatori e il loro contenuto con il buffer creato
    sed -z -i "s#<!--%BEGIN_$2%-->.*<!--%END_$2%-->#$out#g" index.html
}

replaceInFile "output/Candidatura/" "VERBALI_CANDIDATURE"

replaceInFile "output/DiariDiBordo/" "DIARIO_DI_BORDO"

replaceInFile "output/DocumentazioneInterna/Candidatura/VerbaliRiunioni/" "VERBALI_INTERNI"

replaceInFile "output/DocumentazioneEsterna/" "VERBALI_ESTERNI"
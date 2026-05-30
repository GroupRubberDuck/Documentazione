1. Aggiornare sistema:
    sudo apt update
2. Installare i pacchetti necessari:
    sudo apt install default-jre graphviz
3. Installazione dell'estensione plantuml (quella con più download)
4. Aprire le Impostazioni di VsCode (Ctrl + ,) e cercare:
    plantuml.exportOutDir
5. inserire percorso relativo (serve a dire dove compilare l'output) scrivendo:
    src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/uml/png
6. cercare anche:
    plantuml export include folder hierarchy
   e disabilitare la spunta
7. cercare anche:
    plantuml export sub folder
   e disabilitare la spunta
8. creare il diagramma in uml/puml
9. Aprire il file .puml desiderato e digitare Ctrl + Shift + P selezionando il comandon di compilazione:
    PlantUML: Export Current Diagram
   e selezionare .png

ora si ha il png da inserire nel doc nella cartella uml/png



# Alternativa con script

se si ha plantuml installato da terminale
e lo script ha il permesso di esecuzione

chmod +x compile_puml.sh

basta lanciare da terminale lo script :
src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/uml/compile_puml.sh

questo legge tutti i file nella cartella :
src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/uml/puml

come png nella cartella:
src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/uml/png







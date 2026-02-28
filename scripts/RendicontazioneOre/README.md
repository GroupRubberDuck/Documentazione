Questa è una guida per usare gli script di estrazione dati per la rendicontazione ore.

Per utilizzare le API di github occorre far andare sulla propria macchina
    $ sudo apt install gh
    $ gh auth login
    $ gh auth refresh -s read:project
Senza di essi gli script non funzionano

Per generare il csv con le informazioni di *commit dello sprint*, posizionarsi su questa cartella e fare
    
    $ ./estrai_sprint.sh

richiederà in input nome dello sprint, inizio e fine. Risulta importante rispettare il formato richiesto dell'input.

Andare sul foglio google commit_sprint e duplicare il template per lo sprint nuovo.
Selezionare la riga A10, dove verrà importato il csv creato.
Importare con File > Importa > Carica
Selezionare come Destinazione dell'importazione la cella selezionata.
Prima di importare i dati selezionare il tipo di separatore su Personalizzato e inserire la pipe "|".

Per generare il csv con le informazioni di *issue dello sprint*, far andare lo script con

    $ ./estrai_issue.sh

E ripetere l'operazione di importazione sul foglio, selezionando la cella H10.

Risulta necessario aggiungere la colonna Tipo nella colonna O inserendo P per un'attività produttiva e NP per un'attività di palestra non produttiva.

IMPORTANTE
Va verificata la consistenza dei dati in modo attento, verificando soprattutto nelle issue riga per riga che gli autori delle attività e la loro size corrisponda con la realtà.






#import "@preview/cheq:0.3.0": checklist
== *Processo di Qualifica (Verifica e Validazione)*
=== Introduzione
Il processo di Qualifica ha lo scopo di stabilire se un prodotto del progetto (documento, software o deliverable) possa essere considerato *concluso e idoneo al rilascio*.
Esso rappresenta la fase finale di verifica e validazione, successiva alle attività di Accertamento Qualità.

=== Scopo del processo

- Assicurare la *conformità dei prodotti* alle specifiche tecniche e funzionali.

- *Ridurre errori e incoerenze* attraverso attività di verifica e validazione.

- Documentare in modo chiaro l’esito delle *attività di verifica e validazione*.

- Definire criteri oggettivi di completamento tramite la *Definition of Done (DoD)*.

=== Attività principali
Le attività principali del processo di Qualifica comprendono:

- *Revisione finale dei deliverable* rispetto ai requisiti e agli standard;

- *Validazione* dei documenti e dei prodotti software;

- *Verifica del soddisfacimento* dei criteri di completamento;

- *Approvazione finale* dei deliverable qualificati.



=== Procedure operative
Durante il processo di Qualifica vengono applicate le seguenti procedure:

- Verifica del rispetto della *Definition of Done*;

- *Controllo della tracciabilità* delle modifiche e delle approvazioni su GitHub;

- *Aggiornamento del versionamento* dei documenti tramite Typst;

- *Rilascio del deliverable* solo al soddisfacimento di tutti i criteri previsti.

==== Definition of Done

La *Definition of Done (DoD)* è un elemento molto importante nello sviluppo software, perché definisce le azioni che devono essere completate affinché i requisiti — espressi tramite un *Product Backlog Item (PBI)* — siano considerati conclusi. \
I criteri che la compongono devono essere concreti, verificabili e di dimensione ridotta, e hanno l’obiettivo di garantire un livello minimo di qualità per ogni rilascio o incremento del prodotto.

Di seguito viene riportata la Definition of Done per la fase RTB:

#show: checklist.with(marker-map: (" ": sym.ballot, "x": sym.ballot.cross, "-": sym.bar.h, "/": sym.slash.double))

- [ ] Controllare a livello semantico e grammaticale che tutto sia corretto (grammatica, punteggiatura, sintassi, rivedere frasi ripetute/ mal espresse)

- [ ] Controllare di aver incluso tutte le sezioni definite del WoW nel documento su cui si lavora 

- [ ] *Nei verbali*: Controllare di aver aggiornato nello status TAB: 
  - stato
  - versione
  - ruoli
- [ ] Controllare di aver aggiunto le ultime modifiche anche sulla “tabella delle modifiche del documento”
- [ ] *Nei verbali*: controllare di aver aggiornato la versione nel nome del file
- [ ] *Nei verbali*, controllare che tutte le decisioni corrispondano a issue specifiche nell'issue template.
- [ ] Un documento (o una sua sezione) è considerato completato quando:
  - È stato scritto;
  - È stato verificato;
  - È stata aggiunta una riga nelle tabelle documentarie con il validatore finale.

- [ ] Quando il documento/prodotto è completato, chiudere la issue con #block(
  fill: rgb("#f9f9f9"), // Colore di sfondo (grigio chiaro)
  stroke: 1pt + black, // Bordo nero da 1 punto
  inset: 10pt          // Padding interno di 10 punti
)[`git commit -m "commento. Close #numero_issue"`] Verificare poi effettivamente la chiusura nel Projects Board.

- [ ] Quando tutti i punti sopra sono completati e tutte le issue sono spostate in “Done”:
- Il branch develop può essere unito a main
- Controllare l’incremento dello sprint corrispondente ( e il website)
  
La seguente *Definition of Done* non è statica, ma dinamica: evolve in base alle esigenze del team di sviluppo.

=== Strumenti a supporto

- *Typst* → gestione dei documenti, versionamento e inserimento automatico di metadati.

- *GitHub* → repository condiviso, issue tracking e tracciamento delle modifiche.

- *Automazioni* → script e workflow per calcolare metriche di qualità, generare report automatici, notificare approvazioni.




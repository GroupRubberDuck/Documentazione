#import "@preview/cheq:0.3.0": checklist


== Gestione del Processo
=== Ruoli di Progetto
La seguente sezione descrive le fasi della progettazione software.
All’interno del team, per garantire coerenza, efficienza e qualità, ogni ruolo ha compiti specifici e interviene in momenti diversi del progetto.

Nel contesto del corso di Ingegneria del Software, tutti i membri del team devono ricoprire almeno una volta ciascun ruolo definito.

La tabella sottostante riassume in maniera chiara i compiti associati a ciascun ruolo.
 
// -------- TIMELINE VISIVA --------
#align(center)[
  *Fasi di progetto*\
  #v(6pt)
  #sym.bar.h ● *Analisi* #sym.arrow.r ● *Progettazione* #sym.arrow.r ● *Implementazione* #sym.arrow.r ● *Verifica*
#{
  show table.cell: set text(size: 11pt)
  table(
    columns: 3,
    align: horizon,
    table.header([*Ruolo*],[*Compiti*],[*Presenza*]),

    [Responsabile], "- Coordinamento piani e scadenze\n- Approvazione release\n- Comunicazione col committente\n- Uso efficiente delle risorse\n- Redazione documenti", [Tutto il progetto],

    [Amministratore], "- Garanzia efficienza strumenti\n- Gestione tecnologie di supporto\n- Verifica procedure secondo norme", [Tutto il progetto],

    [Verificatore], "- Testing e validazione\n- Controllo qualità deliverable\n- Conformità ai requisiti", [Tutto il progetto],

    [Analista], "- Analisi dei requisiti\n- Definizione bisogni del sistema\n- Redazione specifiche funzionali", [Fase iniziale],

    [Progettista], "- Progetta architettura sistema\n- Design e modellazione\n- Traduzione requisiti in struttura tecnica", [Dopo analisi],

    [Programmatore], "- Codifica software\n- Implementazione design\n- Sviluppo funzionalità", [Implementazione],
  )
}

]
=== Rendicontazione delle ore <Rendicontazione_delle_ore> 
La pianificazione e il monitoraggio delle ore produttive del progetto sono gestiti tramite il documento "Piano di progetto", in cui vengono registrate sia le ore previste sia quelle effettivamente svolte per ciascun ruolo e membro del gruppo.

 La ripartizione oraria è accompagnata dai relativi costi, consentendo una visione completa delle risorse economiche impiegate. Per facilitare l'analisi e garantire trasparenza durante l'eventuale rotazione dei ruoli, il gruppo utilizza inoltre un foglio di calcolo Google Sheet in cui ogni componente può rendicontare e consultare le proprie ore, sia pianificate sia effettive.  Questa organizzazione strutturata favorisce una gestione chiara, trasparente e collaborativa della distribuzione dei ruoli all'interno del team.
== Assegnazione Ruolo-Documento
La seguente sezione chiarisce i documenti associati a ciascun ruolo.\
L’assegnazione viene rappresentata tramite una *legenda* e una *tabella riassuntiva*. \

*Legenda* :\
Azioni:
- R = Redazione.
- V = Verifica.
- A = Approvazione.
- C = Contribuente.
Ruoli:
- Responsabile = RESP.
- Amministratore = AMM.
- Analista = ANL.
- Progettista = PRG.
- Programmatore = PGRmm.
- Verificatore = VRF.

#{
  show table.cell: set text(size: 11pt)
  table(
    columns: 7,
    align: horizon,
    table.header([*Documento*],[*RESP*],[*AMM*],[*ANL*],[*PRG*],[*PRGmm*],[*VRF*]),
  [Norme di Progetto (NdP)],[R/A],[R],[-],[-],[-],[V],
  [Analisi dei Requisiti (AdR)],[A],[-],[R],[-],[-],[V],
  [Piano di Progetto (PdP)],[R/A],[-],[C (supporto rischi)],[-],[-],[V],
  [Piano di Qualifica (PdQ)],[A],[R],[-],[-],[-],[V],
  [Design Document (DD)],[A],[-],[C (per coerenza requisiti)],[R],[C],[V],
  [Manuale Utente (MU)],[A],[-],[-],[R],[C],[V],
  [Verbali interni],[R/A],[R],[-],[-],[-],[V],
  [Verbali esterni],[R/A],[R],[-],[-],[-],[V],
  [Test Report (TR)],[A],[-],[-],[C],[R],[V],
  [Documentazione tecnica interna],[A],[R (per strumenti e template)],[R],[C],[-],[V],
  )
}

== Definition of Done (DoD)

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

#link("https://www.atlassian.com/agile/project-management/definition-of-done")[Definition-of-done-Guide]
== Issue tracking System – Guida Operativa
L'*Issue Tracking System* è lo strumento utilizzato dal nostro team di sviluppo per tracciare in maniera efficiente tutte le issue da svolgere e il loro stato di completamento.
Il sistema è accessibile a tutti i membri del gruppo attraverso la repository GitHub, dove è disponibile un *template di issue condiviso e centrale*, in modo da evitare incongruenze o confusione.

// stati dell'issue -> quando si avrà immagine del workflow
=== Creazione di una nuova issue
A seguito di verbali interni o esterni, il gruppo decide le attività su cui concentrarsi. 
L'*amministratore* ha il compito di creare le issue nel sistema utilizzando il *template condiviso*.

Ogni nuova issue deve includere:

+ *Assegnatario/i* \ Generalmente è preferibile assegnare la issue a una sola persona. Tuttavia, per attività di formazione o esercitazioni ("palestra") si possono assegnare più persone o l'intero gruppo. 

+ *Descrizione*\ Una spiegazione dettagliata e specifica delle azioni da svolgere.

+ *Scopo*\ Indica cosa ci si aspetta di ottenere al termine dell'issue e dove andrà documentato il risultato (ad esempio, in quale documento o sezione del repository).

+ *Autore*\ La persona che deve svolgere la issue.
+ *Verificatore*\ La persona incaricata di verificare che la issue sia stata risolta correttamente, in base alla Definition of Done. Il verificatore, a meno di eccezioni, è diversa dall'autore.

+ *Label (ambito/destinazione)*\ #[Questa classificazione consente di organizzare le issue in base al loro ambito o posizione all’interno del progetto: 
- Analisi dei requisiti 
- Piano di progetto 
- Piano di qualifica 
- Norme progetto
- Verbale
- Diario di bordo
- Glossario 
- Generale -> attività che non rientrano nei documenti sopra: studio di materiale aziendale, lavori sul sito web, gestione repository, attività varie fuori dai documenti principali]
+ *Tipo di issue (Type)*\ #[
Permette di distinguere la natura delle attività:
- Palestra -> ore formative non rendicontate, attività di ricerca o di studio 
- Produttivo -> ore rendicontate con risultati concreti, come la scrittura di documenti da presentare  
- Bug -> errori o malfunzionamenti nel codice;
- Correzione -> interventi su documenti o materiali già prodotti per migliorarli, aggiornarli o correggere inesattezze; 

#link("https://docs.github.com/en/issues/tracking-your-work-with-issues/using-issues/managing-issue-types-in-an-organization")[Tracking-your-work-with-issue-Guide]
 ]
+ *Priorità : Bassa, Media, Alta * \ #[
Questa suddivisione ha due scopi:
- ragionare sull'importanza della issue che si sta scrivendo
- comunicare all'assegnatario con quale tempestività dovrà svolgere la issue
]
+ *Dimensione : ExtraSmall, Small, Medium, Large * \ Serve per stimare la mole di lavoro necessaria per portare a termine quella issue.
+ *Data di scadenza*\ Normalmente coincide con la fine dello sprint di riferimento. 

=== Flusso operativo

+ L’amministratore crea una nuova issue tramite il template condiviso.
+ Si assegnano autore/i e verificatore/i.
+ Si compilano descrizione, scopo, label, type, priorità, dimensione, scadenza. 
+ La issue viene inserita nello stato iniziale Backlog e segue il flusso fino a Done.



== Versionamento
In questa sezione viene spiegata la logica di versionamento dei documenti.
=== Codice di versione

Ogni modifica apportata a un documento genera automaticamente una nuova versione, identificata tramite un codice nel formato:

#align(center, block[
  #set align(left)
  *X.Y.Z*
])

dove ciascuna componente rappresenta uno stato diverso del processo di validazione:

#pad(left: 1em)[
- *X – Versione stabile approvata*  
- 
  Indica l’ultima versione ufficialmente approvata dal Responsabile.  
  Il suo incremento segnala una revisione sostanziale o una modifica di grande rilievo.  
  L’incremento di X comporta l’azzeramento automatico di Y e Z.

- *Y – Feature proposta / Approvazione generale*  
  
  Rappresenta l’ultima approvazione da parte di un Verificatore.  
  Il suo incremento indica l’introduzione o modifica di una nuova funzionalità o sezione del documento.  
  L’incremento di Y comporta l’azzeramento di Z.

- *Z – Patch della feature proposta / Modifica verificata*  
  
  Indica l’ultima modifica di dettaglio verificata (correzioni minori, refusi, aggiustamenti formali).  
  L’incremento di Z rappresenta cambiamenti minori.
]

==== Regole di incremento

#pad(left: 1em)[
- Ogni approvazione genera un incremento della cifra di versione stabile.  
- Nel versionamento X.Y.Z, maggiore è il cambiamento, più significativa è la cifra che viene incrementata: X ha un peso maggiore di Y, e Y maggiore di Z

- L’incremento di una cifra comporta sempre l’azzeramento delle cifre alla sua destra, mantenendo coerenza nella progressione delle versioni.
]
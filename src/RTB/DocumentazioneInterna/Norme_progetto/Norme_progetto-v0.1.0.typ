#import "/src/config.typ": *
#import template_dir + "/frontPage.typ": frontPage, frontPageSenzaData
#import template_dir + "/setUpPageLayout.typ": *
#import "@preview/cheq:0.3.0": checklist
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/utilityTable.typ": getCode, utilityTable
#import template_dir + "/statusTab.typ": statusTab
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3": chart
#import "/src/RTB/DocumentazioneInterna/Glossario.typ" : dict
#set text(size: 13pt)
// #set par(justify: true)

#set text(lang: "it")
#set heading(numbering: "1.1)")
#set footnote.entry(indent: 0em)
#show ref: body => underline()[*#body*]
#show link: body => {set text(fill:blue); underline()[#body]}

#let doc="Norme di Progetto"

#frontPageSenzaData(doc)

#insertRomanNumberedPagesSenzaData(PageTitle: "Stato del documento", documentType: doc)[
  #statusTab(
    stato: "In progress",
    versione: "0.6.0",
    autori: ("Davide Lorenzon", "Aldo Bettega", "Guerra Filippo", "Ana Maria Draghici"),
    verificatori: ("Ana Maria Draghici", "Davide Lorenzon" ),
    uso: "Interno",
    destinatari: ("Tutto il gruppo",),
  )
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Registro modifiche", documentType: doc)[


#let header=("Versione","Data","Descrizione","Autore","Revisore","Validatore")
#let modifiche=(

  ([0.1.0],[2025-11-],[Davide Lorenzon],[Ana Maria Draghici],[Stesura iniziale]),
  ([0.2.0],[2025-11-11],[Davide Lorenzon],[Ana Maria Draghici],[Aggiunta struttura dei documenti (come stabilito da verbale 2025-11-10)]),
  ([0.3.0],[2025-11-11],[Ana Maria Draghici],[-],[Aggiunta sezione 4.8.1 struttura Analisi Requisiti ]),
  ([0.4.0],[2025-11-29],[Guerra	Filippo],[Ana Maria Draghici],[Aggiunta sezione 5.2 "ruolo-documento"]),
  ([0.5.0],[2025-11-30],[Ana Maria Draghici],[-],[Aggiunta sezione 5.3 e 5.4, rispettivamente  "Definition of Done" e "Issue tracking System"]),
  ([0.6.0],[2025-12-02],[Ana Maria Draghici],[-],[Aggiunta sezione 4.8 "struttura specifica dei documenti" e relative sottosezioni, aggiunto sezione 5.4.3 "Versionamento"]),
  ([0.6.1],[2025-12-02],[Davide Lorenzon],[-],[implementato il registro delle modifiche e apportate modifiche di ordine nella sottosezione documentazione]),


  
)
#registroModifiche(modifiche)
// #utilityTable(modifiche,header:header,columns:(auto,auto,2fr,1fr,1fr,1.1fr))

]

#insertRomanNumberedPagesSenzaData(PageTitle: "Indice", documentType: doc)[
  #outline(title: "Indice")
]
#context counter(page).update(1)
#insertArabicNumberedPagesSenzaData(PageTitle: "Introduzione", documentType: doc)[
  = Introduzione
  == Scopo del documento

In questo documento il gruppo definisce e mantiene traccia del proprio way of working, ovvero l’insieme di pratiche e convenzioni adottate per organizzare e svolgere il lavoro di progetto.

La stesura del documento avviene in modo incrementale, evolvendosi parallelamente all’avanzamento delle attività. Nel corso del progetto potrà essere soggetto ad aggiunte, modifiche o rimozioni, derivate dal processo di apprendimento e sperimentazione del team.

Tali aggiornamenti nascono dall’analisi e dall’evoluzione delle best practices comuni nell’ingegneria del software, che il gruppo studia, applica e adatta in funzione delle esigenze del team e del contesto progettuale.

  == Scopo del prodotto
Il prodotto sviluppato è un’applicazione software progettata per verificare in modo automatico la conformità alla norma EN 18031, lo standard tecnico europeo che definisce i requisiti di sicurezza informatica per i dispositivi radio wireless (es. Wi-Fi, LTE, Bluetooth, IoT wireless).

L’obiettivo dell’applicazione è supportare e guidare l’utente nella valutazione dei requisiti di cybersecurity, eseguendo in autonomia i percorsi decisionali tramite decision tree (alberi di decisione).
Questo approccio permette di accelerare, standardizzare e rendere più affidabile il processo di verifica della conformità, con la generazione automatica della documentazione tecnica richiesta a supporto dell’assessment. 
  == Glossario
  Per garantire precisione terminologica senza compromettere la leggibilità, in questo documento viene adottato un approccio ibrido alla gestione dei riferimenti al Glossario.
  I termini tecnici possono essere presentati secondo 2 modalità:

  - *Footnote al primo utilizzo*: applicata ai concetti critici o potenzialmente ambigui, permette un accesso immediato alla definizione senza interrompere il flusso logico del testo.

  - *Marcatura tramite pedice “G” (termine #sub()[G])*: utilizzata per termini ricorrenti o già contestualizzati, indica semplicemente la presenza del termine nel Glossario.

// da definire bene meglio una volta che effettivamente viene usato per bene
  


]

#insertArabicNumberedPagesSenzaData(PageTitle: "Riferimenti", documentType: doc)[
  = Riferimenti
== Riferimenti normativi
  - #link("https://galileodiscovery.unipd.it/discovery/fulldisplay?docid=alma9938989417806046&context=L&vid=39UPD_INST:VU1&lang=it&search_scope=catalogo_no_external&adaptor=Local%20Search%20Engine&tab=Everything&query=title,contains,Software%20Engineering,AND&query=creator,contains,Ian%20Sommerville,AND&mode=advanced")[Software Engineering, Ian Sommerville]
  - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/PD1.pdf")[Regolamento progetto]
  - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1.pdf")[Capitolato d'appalto Automated EN18031
Compliance Verification di BlueWind]
- #link("https://www.iso.org/standard/63712.html")[Standard ISO 12207:2017]
== Riferimenti informativi

- #link("https://docs.github.com/en/issues/tracking-your-work-with-issues/using-issues/managing-issue-types-in-an-organization") 
- #link("https://www.agileway.it/definition-of-done-dod-cose-cosa-serve/")
- #link("https://www.atlassian.com/agile/project-management/definition-of-done")




]

#insertArabicNumberedPagesSenzaData(PageTitle: "Processi Primari", documentType: doc)[
  = Processi Primari
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Processi di Supporto", documentType: doc)[
= Processi di Supporto

#include "content/04-processi_supporto/index.typ"


]





#insertArabicNumberedPagesSenzaData(PageTitle: "Processi Organizzativi", documentType: doc)[
= Processi Organizzativi
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

- [ ] Controllare di aver aggiornato la versione, lo stato e gli autori ( “status TAB” ), per includere le ultime modifiche
- [ ] Controllare di aver aggiunto le ultime modifiche anche sulla “tabella delle modifiche del documento”
- [ ] Nei verbali, controllare che tutte le decisioni corrispondano a issue specifiche nell’issue template.
- [ ] Un documento ( o una sua sezione) è considerato completato quando:
- È stato scritto;
- È stato verificato;
- È stata aggiunta una riga nelle tabelle documentarie con il validatore finale.

- [ ] Quando il documento/prodotto è completato, chiudere l’issue con #block(
  fill: rgb("#f9f9f9"), // Colore di sfondo (grigio chiaro)
  stroke: 1pt + black, // Bordo nero da 1 punto
  inset: 10pt          // Padding interno di 10 punti
)[`git commit -m "commento. Close #numero_issue"`] Verificare poi effettivamente la chiusura nel Projects Board.

- [ ] Quando tutti i punti sopra sono completati e tutte le issue sono spostate in “Done”:
- Il branch develop può essere unito a main
- Controllare l’incremento dello sprint corrispondente ( e il website)
  
La seguente *Definition of Done* non è statica, ma dinamica: evolve in base alle esigenze del team di sviluppo.

== Issue tracking System – Guida Operativa
L'*Issue Tracking System* è lo strumento utilizzato dal nostro team di sviluppo per tracciare in maniera efficiente tutte le issue da svolgere e il loro stato di completamento.
Il sistema è accessibile a tutti i membri del gruppo attraverso la repository Github, dove è disponibile un *template di issue condiviso e centrale*, in modo da evitare incongruenze o confusione.

// stati dell'issue -> quando si avrà immagine del workflow
=== Creazione di una nuova issue
A seguito di verbali interni o esterni, il gruppo decide le attività su cui concentrarsi. 
L'*amministratore* ha il compito di creare le issue nel sistema utilizzando il *template condiviso*.

Ogni nuova issue deve includere:

*1. Assegnatario/i* \
Generalmente è preferibile assegnare la issue a una sola persona. Tuttavia, per attività di formazione o esercitazioni ("palestra") si possono assegnare più persone o l'intero gruppo. 

*2. Descrizione*\
Una spiegazione dettagliata e specifica delle azioni da svolgere.

*3. Scopo*\
Indica cosa ci si aspetta di ottenere al termine dell'issue e dove andrà documentato il risultato (ad esempio, in quale documento o sezione del repository).

*4. Autore*\
La persona che ha ideato l'issue (solitamente l'amministratore).

*5. Verificatore*\
La persona incaricata di controllare e approvare l'issue quando viene spostata nello stato di verifica.

*6. Label (ambito/destinazione)*\
Questa classificazione consente di organizzare le issue in base al loro ambito o posizione all’interno del progetto: 
- Analisi dei requisiti 
- Piano di progetto 
- Piano di qualifica 
- Norme progetto
- Glossario 
- Generale -> attività che non rientrano nei documenti sopra: studio di materiale aziendale, lavori sul sito web, gestione repository, attività varie fuori dai documenti principali
*7. Tipo di issue (Type)*\
Permette di distinguere la natura delle attività:
- Palestra -> ore formative non rendicontate, attività di ricerca o di studio 
- Produttivo -> ore rendicontate con risultati concreti, come la scrittura di documenti da presentare  
- Bug -> errori o malfunzionamenti rilevati in documenti o applicazioni, che richiedono correzione e tracciamento
- Correzione -> interventi su documenti o materiali già prodotti per migliorarli, aggiornarli o correggere inesattezze
*8. Priorità : Bassa, Media, Alta * \
Il gruppo concentra le proprie energie prima sulle issue ad alta priorità.

*9. Dimensione : ExtraSmall, Small, Medium, Large * \
Serve per stimare la complessità o l'impegno richiesto.

*10. Data di scadenza*\
Normalmente coincide con la fine dello sprint di riferimento. 

=== Flusso operativo

1. L’amministratore crea una nuova issue tramite il template condiviso.
   
2. Si assegnano autore, verificatore e assegnatario/i.

3. Si compilano descrizione, scopo, label, type, priorità, dimensione, scadenza. 

4. La issue viene inserita nello stato iniziale Backlog e segue il flusso fino a Done.



=== Versionamento

==== Codice di versione

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
- Ogni approvazione genera un incremento della cifra di versione pertinente.  
- Più rilevante è il cambiamento, maggiore è la cifra da incrementare (da destra verso sinistra).  
- L’incremento di una cifra comporta sempre l’azzeramento delle cifre alla sua destra, mantenendo coerenza nella progressione delle versioni.
]
]
#insertArabicNumberedPagesSenzaData(PageTitle: "Metriche e standard per la Qualità", documentType: doc)[
= Metriche e standard per la Qualità
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Metriche di Qualità del Processo", documentType: doc)[
= Metriche di Qualità del Processo
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Metriche di Qualità del Prodotto", documentType: doc)[
= Metriche di Qualità del Prodotto
]



#set text(lang: "IT")

#import "/src/config.typ": *
#import template_dir + "/frontPage.typ": frontPage
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/statusTab.typ": statusTab
#import template_dir + "/utilityTable.typ": getCode, utilityTable

#show link: body => {
  set text(fill: blue)
  underline()[#body]
}
#show ref: body => { underline()[#strong(body)] }

#set text(size: 12pt)
#set heading(numbering: "1.1)")
#show heading.where(level: 1): set text(size: 18pt)
#show heading.where(level: 2): set text(size: 16pt)


//
//Info del documento
//
#let currentVersion = (
  major: 1,
  minor: 0,
  patch: 0,
)
//converte dizionario in stringa
#let versionNumber = currentVersion.values().map(n => { str(n) }).join(".")
#metadata(versionNumber)<versionNumber>

#let giornoRiunione = datetime(year: 2026, month: 03, day: 10)
#let doctype = "Verbale interno"
#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages("Stato del documento", doctype, giornoRiunione)[
  #statusTab(
    stato: "Approvato",
    versione: versionNumber,
    autori: (persone.ANA,),
    verificatori: (persone.FELIX,),
    uso: "Interno",
    destinatari: ("Tutto il gruppo",),
  )
]

#insertRomanNumberedPages("Registro Modifiche", doctype, giornoRiunione)[

  #let modifiche = (
    ([0.1.0], [2026-03-10], persone.ANA, persone.FELIX,[Stesura del verbale]),
    ([1.0.0], [2026-03-11], persone.ANA, persone.ANA,[Approvazione]),
  )

  #registroModifiche(modifiche)
]

#insertRomanNumberedPages("Indice", "Verbale interno", giornoRiunione)[
  #outline(depth: 2, title: "Indice")
]

#pagebreak()
#context counter(page).update(1)


#insertArabicNumberedPages("Informazioni generali", "Verbale interno", giornoRiunione)[
  = Informazioni generali
  - *Tipo di riunione*: Interno
  - *Motivazione*: Riunione di fine sprint
  - *Data*: #giornoRiunione.display()
  - *Luogo*: Riunione su Discord
  - *Ora inizio*: 15:00
  - *Ora fine*: 16:10
  - *Scriba*: #persone.ANA
  - *Partecipanti*:#align(left)[
      #set list(marker: [--])
      - Aldo Bettega
      - Ana Maria Draghici
      - Davide Lorenzon
      - Davide Testolin
      - Felician Mario Necsulescu
      - Filippo Guerra
      \
    ]
]

#insertArabicNumberedPages("Ordine del giorno", "Verbale interno", giornoRiunione)[
  = Ordine del giorno
  - Stato di avanzamento dei documenti e gestione delle verifiche/merge.
  - Pianificazione del nuovo Sprint (ruoli, ore e issue).
  - Avanzamento del Proof of Concept (POC) e discussione sull'architettura dei dati (SQLite vs MongoDB).
  - Definizione delle strategie di testing per il Piano di Qualifica.
]


#insertArabicNumberedPages("Riassunto della riunione", "Verbale interno", giornoRiunione)[
  = Riassunto della riunione
  Durante la riunione si è fatto il punto sullo stato dei documenti e sul workflow di verifica, si è pianificato il nuovo sprint assegnando i ruoli, si è discusso dell'avanzamento del PoC con particolare attenzione alla scelta del database, e si sono definite le strategie di testing per il Piano di Qualifica.

  == Gestione Documenti e Workflow di Verifica <documentazione>
  Si è discusso di come gestire i branch separati, le pull request e i merge sul branch `main` e `develop`. È stato chiarito che i verbali, una volta scritti, necessitano della linea di approvazione per essere pubblicati sul develop. Le modifiche agli altri documenti (Piano di Progetto, Piano di Qualifica e Norme) possono invece essere spostate direttamente in "done" dal verificatore, senza passare per la colonna di approvazione esplicita. Il gruppo si è suddiviso i documenti da aggiornare e verificare.

  == Pianificazione dello Sprint <sprint>
  Davide Testolin ricoprirà il ruolo di responsabile. Felician  agirà come amministratore e si occuperà di creare le issue sulla project board. Le issue di questo sprint riguarderanno principalmente il completamento dei casi d'uso, l'inizio della stesura dei requisiti e il completamento del PoC. Si è discusso inoltre del conteggio delle ore e dell'assegnazione delle ore da programmatore (per il POC) e da progettista. Le vecchie issue relative alla ricerca tecnologica e allo sviluppo/deploy verranno assegnate e spostate direttamente in "done", poiché la fase di studio è da considerarsi conclusa.

  == Avanzamento POC e Architettura Dati <POC>
  Il team si è diviso le pagine da sviluppare (Import, Decision Tree, Report) e ha testato con successo l'esportazione dei PDF. La discussione principale si è concentrata sulla scelta del database: si sta valutando il passaggio da SQLite a MongoDB. MongoDB risulta vantaggioso in quanto salva i dati in formato BSON (simil-JSON) nativamente, adattandosi perfettamente alla struttura ad albero nidificata dei dati del progetto, senza richiedere traduttori o complesse query JOIN tipiche dei database relazionali. Il passaggio è considerato favorevole a condizione che semplifichi effettivamente il lavoro e permetta un agevole scarico dei file JSON, liberando la RAM durante le query.

  == Strategie di Testing <testing>
  È stata presentata una prima bozza delle strategie di testing per il Piano di Qualifica. I test saranno suddivisi in: test di sistema (un test per ogni caso d'uso implementato), test di accettazione (scenari generali) e una tabella di tracciamento che associa i test ai requisiti corrispondenti. Verrà inoltre redatto un cruscotto di valutazione per riassumere i risultati ottenuti.
]


#insertArabicNumberedPages("Decisioni", "Verbale interno", giornoRiunione)[
  = Decisioni
  #let contatoreDecisioni = counter("decisioni")
  #contatoreDecisioni.update(1)
  #let prefisso = "VI.17."

  #let decisioni = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Redigere il verbale interno del 2026-03-10],
      [Il verbale deve essere disponibile a tutti i membri del gruppo prima del merge su `main`],
      [-],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Assegnare le issue di ricerca tecnologica e spostarle in "done"],
      [La fase di studio su ricerca tecnologica e sviluppo/deploy è conclusa; le issue corrispondenti vanno chiuse senza ulteriori attività],
      [@sprint],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Integrare MongoDB nel POC in sostituzione di SQLite e verificarne il funzionamento],
      [MongoDB gestisce nativamente dati BSON (simil-JSON), adattandosi alla struttura ad albero nidificata del progetto ed eliminando la necessità di query JOIN complesse],
      [@POC],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Verificare i documenti presenti su `develop` e aggiornare il Piano di Qualifica con le strategie di testing],
      [I documenti Piano di Progetto e Glossario sono pronti per la verifica; le strategie di testing (test di sistema, accettazione e tabella di tracciamento) devono essere inserite nel Piano di Qualifica],
      [@testing, @documentazione],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Finalizzare la stesura dei casi d'uso e ultimare la determinazione dei requisiti],
      [Completare l'analisi dei requisiti è prerequisito fondamentale per completare in modo strutturato lo sviluppo del POC e per poter aggiornare l'azienda proponente sull'avanzamento dei lavori],
      [@sprint],
    ),
  )

  #utilityTable(decisioni, header: ("Codice", "Descrizione", "Motivazioni", "Ref."), columns: (auto, 2fr, 2fr, auto))
]



#insertArabicNumberedPages("TODO", "Verbale interno", giornoRiunione)[

  = TODO

  #let prefisso = "TD.21."
  #let contatoreTodo = counter("todo")
  #contatoreTodo.update(1)
  I TODO sorti da questa riunione sono i seguenti:

  #let TODO = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.ANA],
      [Redigere il verbale interno della riunione svoltasi il 2026-03-10],
      [VI.17.1],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.FELIX,\  #persone.FILIPPO],
      [Verificare i documenti pronti sul branch `develop`  e spostare le issue in "done"],
      [VI.17.4],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.ANA],
      [Aggiornare il Piano di Qualifica con le tabelle delle strategie di testing (test di sistema, accettazione e tracciamento requisiti)],
      [VI.17.4],
    ),

    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.FILIPPO,\  #persone.DT, \  #persone.ALDO],
      [Integrare MongoDB (o altri tipi di database) nel POC e testarne il funzionamento definitivo],
      [VI.17.3],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.DL, \  #persone.FELIX],
      [Finalizzare la stesura dei casi d'uso e ultimare la determinazione dei requisiti],
      [VI.17.5],
    ),
  )
  #utilityTable(
    TODO,
    header: ("Codice", "Assegnatari", "Task", "Decisione di riferimento"),
    columns: (auto, auto, 1fr, auto),
  )

]

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

#let giornoRiunione = datetime(year: 2026, month: 02, day: 24)
#let doctype = "Verbale interno"
#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages("Stato del documento", doctype, giornoRiunione)[
  #statusTab(
    stato: "Approvato",
    versione: versionNumber,
    autori: (persone.ANA,),
    verificatori: (persone.ALDO,),
    uso: "Interno",
    destinatari: ("Tutto il gruppo",),
  )
]

#insertRomanNumberedPages("Registro Modifiche", doctype, giornoRiunione)[


  #let modifiche = (
    ([0.1.0], [2026-02-24], persone.ANA, persone.ALDO, [Stesura del verbale]),
    ([1.0.0], [2026-02-30], persone.ANA, persone.ANA,[Approvazione]),
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
  - *Motivazione*: Riunione interna programmata
  - *Data*: #giornoRiunione.display()
  - *Luogo*: Riunione su Discord
  - *Ora inizio*: 15:30
  - *Ora fine*: 17:00
  - *Scriba*: #persone.ANA
  - *Partecipanti*:#align(left)[
      #set list(marker: [--])
      - Filippo Guerra
      - Davide Lorenzon
      - Ana Maria Draghici
      - Felician Mario Necsulescu
      - Aldo Bettega
      - Davide Testolin
      \
    ]
]

#insertArabicNumberedPages("Ordine del giorno", "Verbale interno", giornoRiunione)[
  = Ordine del giorno
  - Revisione dei casi d'uso e dei requisiti.
  - Aggiornamento del Piano di Progetto (PdP) e dei grafici nel Piano di Qualifica (PdQ).
  - Discussione e definizione delle taglie per le issue e tracciamento delle ore.
  - Nuovo workflow Git (gestione dei branch).
  - Strategia, ricerca e test delle tecnologie per il Proof of Concept (PoC).
]


#insertArabicNumberedPages("Riassunto della riunione", "Verbale interno", giornoRiunione)[
  = Riassunto della riunione
  Durante la riunione si è discusso del carico di lavoro attuale e della pianificazione.
  \  È stata ribadita l'importanza della gestione del rischio relativo agli impegni imprevisti, con l'obiettivo di migliorare la pianificazione complessiva. \ È stato inoltre sottolineato l'utilizzo di branch separati per documento, al fine di evitare merge tardivi nel main o eventuali conflitti. \ Il gruppo ha discusso dei casi d'uso e dei requisiti in via di ultimazione, ai quali è stata attribuita maggiore priorità.\  È stato assegnato l'avvio dello sviluppo del PoC, con particolare enfasi sulla configurazione dell'ambiente di sviluppo.\  Infine, sono stati presentati e discussi i grafici delle metriche raccolte nel PdQ; il gruppo ha concordato che tali metriche verranno monitorate e analizzate più approfonditamente in seguito.

  == Pianificazione e Documenti (Issue Aperte)
  Il team deve concentrarsi sulle issue attualmente aperte, in particolare sulla revisione dei casi d'uso e sulla revisione dei requisiti. È inoltre strettamente necessario aggiornare il Piano di Progetto (PdP) inserendo i dati a consuntivo dell'ultimo sprint e la fase di preventivo per lo sprint in corso. Per quanto riguarda il Piano di Qualifica (PdQ), è stata confermata l'aggiunta dei grafici generati direttamente tramite codice Typst, soluzione che garantisce una migliore manutenibilità rispetto all'inserimento manuale o all'utilizzo di altri strumenti.

  == Definizione Taglie Issue e Tracciamento Ore
  Per migliorare la stima del lavoro, il gruppo ha standardizzato le taglie delle issue — già presenti nell'issue tracking system — basandosi su un tempo stimato:

  - XS: Attività rapide, sotto l'ora (es. merge o piccoli fix).
  - S: Tra 1 e 2 ore.
  - M: Circa 3 ore.
  - L: Oltre le 3 ore (es. task complesse per il PoC).

  Questo tracciamento rappresenta una stima iniziale: qualora il tempo risultasse sottostimato o sovrastimato, la stima verrà progressivamente affinata attraverso feedback interni. \
  Per ottenere un tracciamento oggettivo delle ore di orologio e delle ore produttive, è stato deciso di adottare uno spreadsheet condiviso su Google Drive, al fine di facilitare la raccolta dei dati e la successiva generazione di metriche. Il team manterrà una rotazione dei ruoli, con la flessibilità necessaria a permettere a ciascun membro di completare il monte ore richiesto.

  == Nuovo Workflow Git
  Per evitare conflitti, è stato stabilito un nuovo workflow: non si scriverà più direttamente sul branch `develop`. Per ogni documento o nuova task verrà creato un branch dedicato (es. `feature/nome-documento`), che verrà mergiato in `develop` solo a lavoro concluso e revisionato.

  == Workflow e Setup per il PoC
  Si è stabilito di creare una repository dedicata esclusivamente al PoC, nettamente separata dalla documentazione e dal prodotto finale. Il workflow per il PoC prevede una prima fase denominata "Ricerca e test delle tecnologie" . Prima di scrivere codice, il team (in particolare Filippo Guerra e Davide Testolin) configurerà l'ambiente di sviluppo utilizzando Docker, e sperimentando invece l'uso anche di Poetry (gestione dipendenze), MyPy/BearType e Ruff (formatter).
]


#insertArabicNumberedPages("Decisioni", "Verbale interno", giornoRiunione)[
  = Decisioni
  #let contatoreDecisioni = counter("decisioni")
  #contatoreDecisioni.update(1)
  #let prefisso = "VI.15."

  #let decisioni = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Tracciamento delle ore tramite Google Spreadsheet condiviso.],
      [Garantire un log centralizzato e oggettivo per distinguere ore di orologio e ore produttive, facilitando la raccolta dati e la generazione di metriche.],
      [Sez. 3.2],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Creazione di una repository dedicata esclusivamente al PoC, separata dalla documentazione e dal prodotto finale e setup dell'ambiente di sviluppo],
      [Mantenere il codice di test isolato e garantire un ambiente di sviluppo containerizzato e riproducibile (Docker, Poetry, MyPy/BearType, Ruff).],
      [Sez. 3.4],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Aggiornamento del Piano di Progetto (PdP) con i dati a consuntivo dell'ultimo sprint e il preventivo dello sprint in corso.],
      [Mantenere la documentazione di progetto aggiornata e allineata all'avanzamento reale del lavoro.],
      [Sez. 3.1],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Inserimento dei grafici delle metriche nel Piano di Qualifica (PdQ).],
      [Garantire una migliore manutenibilità e coerenza stilistica rispetto all'inserimento manuale o all'uso di strumenti esterni.],
      [Sez. 3.1],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Prioritizzazione della revisione dei casi d'uso e dei requisiti.],
      [I documenti di analisi sono in via di ultimazione e costituiscono una dipendenza per le fasi successive di sviluppo.],
      [Sez. 3.1],
    ),
  )

  #utilityTable(decisioni, header: ("Codice", "Descrizione", "Motivazioni", "Ref."), columns: (auto, 2fr, 2fr, auto))]

#insertArabicNumberedPages("TODO", "Verbale interno", giornoRiunione)[
  = TODO

  #let prefisso = "TD.19."
  #let contatoreTodo = counter("todo")
  #contatoreTodo.update(1)
  I TODO sorti da questa riunione sono i seguenti:

  #let TODO = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.ANA],
      [Stesura del verbale interno del 2026-02-24.],
      [-],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [Amministratori],
      [Aggiungere i grafici delle metriche nel PdQ],
      [VI.15.4],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [Amministratori],
      [Aggiornare il PdP],
      [VI.15.3],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [Amministratori],
      [Configurare e condividere con il team lo spreadsheet su Google Drive per il tracciamento delle ore.],
      [VI.15.1],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.DL, \ #persone.FELIX],
      [Revisione e ultimazione dei casi d'uso.],
      [VI.15.5],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.DL, \ #persone.FELIX],
      [Revisione e ultimazione dei requisiti.],
      [VI.15.5],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.DT, \ #persone.FILIPPO],
      [PoC: Creazione della repository dedicata e configurazione dell'ambiente di sviluppo.],
      [VI.15.2],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.DT,\  #persone.FILIPPO],
      [PoC: Avvio della fase di ricerca e test delle tecnologie selezionate.],
      [VI.15.2],
    ),
  )
  #utilityTable(
    TODO,
    header: ("Codice", "Assegnatari", "Task", "Decisione di riferimento"),
    columns: (auto, auto, 1fr, auto),
  )

]


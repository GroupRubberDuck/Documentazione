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

// Info documento
#let currentVersion = (
  major: 0,
  minor: 1,
  patch: 0,
)

#let versionNumber = currentVersion.values().map(n => { str(n) }).join(".")
#metadata(versionNumber)<versionNumber>

#let giornoRiunione = datetime(year: 2026, month: 05, day: 11)
#let doctype = "Verbale interno"

#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages("Stato del documento", doctype, giornoRiunione)[
  #statusTab(
    stato: "In verifica",
    versione: versionNumber,
    autori: (persone.FILIPPO,),
    verificatori: ("-"),
    uso: "Interno",
    destinatari: ("Tutto il gruppo",),
  )
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
  - *Ora inizio*: 16.00
  - *Ora fine*: 17.05
  - *Scriba*: Filippo Guerra
  - *Partecipanti*:#align(left)[
      #set list(marker: [--])
      - Aldo Bettega
      - Davide Testolin
      - Felician Mario Necsulescu
      - Filippo Guerra
      - Ana Maria Draghici
      - Davide Lorenzon
      \
    ]
]

#insertArabicNumberedPages("Ordine del giorno", "Verbale interno", giornoRiunione)[
  = Ordine del giorno

  - Aggiornamento sulle attività di codifica.
  - Discussione problemi tecnici riscontrati.
  - Chiarimento sulla gestione dello standard nel processo di import.
  - Retrospettiva dello sprint e redicontazione delle ore.
]

#insertArabicNumberedPages("Riassunto della riunione", "Verbale interno", giornoRiunione)[
  = Riassunto della Riunione

  La riunione ha avuto inizio con un aggiornamento individuale sulle attività di codifica completate durante lo sprint. Ogni membro ha illustrato i propri contributi, evidenziando le funzionalità implementate sia lato backend che frontend.
  È emerso un problema tecnico significativo legato alla scomparsa del file viteconfig.js dal repository, causata involontariamente da un commit di pulizia dei test.
  Questo ha comportato la necessità per diversi membri di ricreare il file in modo indipendente, portando a tre approcci differenti per l'integrazione di Vue nel progetto. Il gruppo ha concordato di uniformare l'approccio nella prossima iterazione.
  È stato discusso il meccanismo di gestione dell'ID dello standard durante l'import dei dispositivi, stabilendo che tale identificativo deve essere fornito esternamente solo alla creazione.
  La seconda parte della riunione è stata dedicata alla retrospettiva dello sprint, con rendicontazione delle ore per ciascun ruolo e definizione dei compiti per lo sprint 14, che include il completamento dell'MVP, la redazione del manuale utente e l'aggiornamento della Specifica Tecnica.
]

#insertArabicNumberedPages("Contenuto riunione", "Verbale interno", giornoRiunione)[
  = Codifica <cod>

  È stato chiarito il meccanismo di gestione dell'ID dello standard durante l'import dei dispositivi:
    - L'ID dello standard deve essere fornito esternamente soltanto alla creazione del dispositivo.
    - In tutti gli altri casi, l'ID viene letto e gestito direttamente dal backend.
    - Per la fase MVP, è stato deciso di inserire il file dello standard (IEC 62443) nella cartella examples/ del repository e di guidare l'utente all'importazione tramite Mongo Express, specificando l'URL di accesso e le istruzioni nel manuale utente.
    - È stata valutata l'aggiunta di un comando diretto di MongoDB per l'importazione da file, da includere nelle istruzioni di setup nel docker-compose di produzione.

    È stato inoltre riscontrato un problema tecnico durante la codifica del frontend, in quanto diversi membri hanno evidenziato la mancanza del file viteconfig.js (causato da un'involontaria eliminazione durante una pulizia dei test). Questo ha costretto i componenti del gruppo a ricreare il file autonomamente, producendo diverse versioni con approcci differenti per il mount dei componenti Vue.
  
= Retrospettiva Sprint <rt>

  Durante la retrospettiva è stata effettuata la rendicontazione delle ore per ciascun membro del gruppo. È emerso che una parte significativa del lavoro svolto ha riguardato la comprensione e l'apprendimento delle tecnologie utilizzate, in particolare per il frontend (Vue, Vite).
  È stato aggiornato lo script di raccolta delle issue dal Project Board, che non includeva correttamente tutte le issue del progetto.
  Il gruppo ha concordato infine di mantenere il totale delle ore per ciascun membro entro il limite di 95 ore complessive, effettuando gli aggiustamenti necessari nel piano di progetto.

= Pianificazione Sprint 14 <sprint>
  Per lo sprint 14 sono stati definiti i seguenti obiettivi:
    - Completamento del frontend MVP: navigazione del decision tree (valutazione), dashboard e funzionalità di export dei dispositivi.
    - Redazione del manuale utente: il documento includerà istruzioni di installazione, configurazione di Docker e guida operativa all'utilizzo dell'applicazione.
    - Aggiornamento della Specifica Tecnica: revisione dei diagrammi delle classi per renderli coerenti con il codice prodotto. I diagrammi più complessi saranno migrati da PlantUML a draw.io.
    - Test di integrazione: verifica delle interazioni tra i componenti principali e il database MongoDB.
    - Riunione con l'azienda: presentazione dello stato dell'MVP in ottica di UAT, con indicazione delle funzionalità ancora mancanti.

]

#insertArabicNumberedPages("Decisioni", "Verbale interno", giornoRiunione)[
  = Decisioni

  #let contatoreDecisioni = counter("decisioni")
  #contatoreDecisioni.update(1)
  #let prefisso = "VI.27."

  #let decisioni = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Uniformare l'approccio Vue nel frontend],
      [Tre implementazioni diverse richiedono standardizzazione],
      [@cod],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [L'ID dello standard è fornito solo alla creazione del dispositivo],
      [Chiarimento del flusso di gestione dei dati nel processo di import],
      [@cod],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Includere istruzioni di import dello standard nel manuale utente tramite Mongo Express],
      [Necessità di guidare l'utente nella configurazione iniziale dell'applicazione],
      [@cod],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Migrare i diagrammi complessi da PlantUML a draw.io],
      [Migliorare la leggibilità dei diagrammi con molte entità],
      [@sprint],
    ),
  )

  #utilityTable(decisioni, header: ("Codice", "Descrizione", "Motivazioni", "Ref."), columns: (auto, 2fr, 2fr, auto))
]

#insertArabicNumberedPages("TODO", "Verbale interno", giornoRiunione)[
  = TODO

  #let prefisso = "TD.32."
  #let contatoreTodo = counter("todo")
  #contatoreTodo.update(1)

  I TODO sorti da questa riunione sono i seguenti:

  #let TODO = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.FILIPPO, \ #persone.DT],
      [Redigere il manuale utente (installazione, configurazione Docker, guida operativa)],
      [VI.27.3],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.ALDO, \ #persone.DT, \ #persone.FILIPPO],
      [Aggiornare la Specifica Tecnica e i diagrammi delle classi coerentemente con il codice; migrare i diagrammi complessi su draw.io],
      [VI.27.4],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.ANA, \ #persone.FELIX],
      [Completare il frontend MVP (navigazione decision tree, dashboard, export dispositivi, uniformazione approccio Vue)],
      [VI.27.1],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.DL],
      [Completare la verifica del backend e predisporre i test di integrazione con MongoDB],
      [-],
    ),
  )

  #utilityTable(
    TODO,
    header: ("Codice", "Assegnatari", "Task", "Decisione di riferimento"),
    columns: (auto, auto, 1fr, auto),
  )
]
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
  major: 1,
  minor: 0,
  patch: 0,
)

#let versionNumber = currentVersion.values().map(n => { str(n) }).join(".")
#metadata(versionNumber)<versionNumber>

#let giornoRiunione = datetime(year: 2026, month: 05, day: 18)
#let doctype = "Verbale interno"

#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages("Stato del documento", doctype, giornoRiunione)[
  #statusTab(
    stato: "Approvato",
    versione: versionNumber,
    autori: (persone.FILIPPO,),
    verificatori: ("Felician Mario Necsulescu",),
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
  - *Ora inizio*: 11.00
  - *Ora fine*: 12.10
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

  - Retrospettiva dello sprint e redicontazione delle ore.
  - Pianificazione delle approvazioni dei documenti e dei merge su develop.
  - Discussione problemi tecnici riscontrati.
  
]

#insertArabicNumberedPages("Riassunto della riunione", "Verbale interno", giornoRiunione)[
  = Riassunto della Riunione

  La riunione ha avuto inizio con un aggiornamento individuale sulle attività completate durante lo sprint, dove ogni membro ha illustrato i propri contributi.
  Si è poi parlato della distribuzione della modifica, verifica e approvazione dei documenti in vista della riunione di PB con il professor Cardin. 
]

#insertArabicNumberedPages("Contenuto riunione", "Verbale interno", giornoRiunione)[
  = Specifica Tecnica <st>

  È stata discussa una revisione della sezione relativa alla gestione degli errori, con l’obiettivo di migliorarne la chiarezza e l’allineamento con l’implementazione attuale.
  Si è inoltre deciso di procedere con la rimozione delle parti non più utilizzate, la pulizia dei pattern architetturali e l’aggiornamento dei diagrammi di attività e di sequenza.
  È stata infine evidenziata la necessità di un riallineamento della documentazione rispetto alle modifiche introdotte nel frontend.

  = Norme di Progetto <ndp>
  È stato confermato lo spostamento del ciclo PDCA nella sezione corretta del documento, al fine di garantire maggiore coerenza strutturale.

  = Piano di Progetto <pdp>
  Il documento verrà aggiornato con i dati relativi allo sprint 14; contestualmente verrà effettuata una revisione degli sprint precedenti per assicurare coerenza e continuità.
  È stata inoltre prevista una revisione della sezione di pianificazione a lungo termine.

  = Piano di Qualifica <pdq>
  È stata discussa una revisione del Piano di Qualifica, con particolare attenzione alle metriche, alcune delle quali saranno rimosse in quanto riferite esclusivamente al frontend.
  Il documento verrà inoltre aggiornato con il nuovo file di test di inclusione e con l’integrazione dei test relativi al frontend.

  = Analisi dei Requisiti <adr>
  È stata approvata la rimozione della precondizione di sessione dalle schermate di lista dispositivi e dettaglio dispositivo, al fine di semplificare il flusso applicativo e ridurre le dipendenze tra le componenti.
]
#insertArabicNumberedPages("Decisioni", "Verbale interno", giornoRiunione)[
  = Decisioni

  #let contatoreDecisioni = counter("decisioni")
  #contatoreDecisioni.update(1)
  #let prefisso = "VI.28."

  #let decisioni = (
    (
    [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
    [Completamento e approvazione finale dei documenti],
    [Completare le ultime modifiche ai documenti e procedere con le approvazioni necessarie al fine di sostenere il colloquio con Cardin e Vardanega],
    [-],
  ),

  )

  #utilityTable(decisioni, header: ("Codice", "Descrizione", "Motivazioni", "Ref."), columns: (auto, 2fr, 2fr, auto))
]

#insertArabicNumberedPages("TODO", "Verbale interno", giornoRiunione)[
  = TODO

  #let prefisso = "TD.35."
  #let contatoreTodo = counter("todo")
  #contatoreTodo.update(1)

  I TODO sorti da questa riunione sono i seguenti:

  #let TODO = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.FILIPPO],
      [PdP: tenere aggiornato (Sprint 14)],
      [VI.28.1],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.FILIPPO],
      [
      PdQ: aggiornare con il nuovo file di test ],
      [VI.28.1],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.ALDO],
      [ST: aggiornare sezione gestione errori, rimuovere sezioni non usate, pulizia pattern, pulizia diagrammi attività-sequenza, pulizia tecnologie;],
      [VI.28.1],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.ALDO],
      [Preparare presentazione per riunione con Cardin],
      [VI.28.1],
    ),

    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.ANA],
      [NdP: spostare ciclo PDCA],
      [VI.28.1],
    ),

    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.ANA],
      [
       PdQ: test di frontend, aggiornare metriche precedenti],
      [VI.28.1],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.DL],
      [ST: aggiornare parte del frontend],
      [VI.28.1],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.FELIX],
      [AdR: rimuovere precondizione sessione da lista dispositivi e dettaglio dispositivi ],
      [VI.28.1],
    ),
  )

  #utilityTable(
    TODO,
    header: ("Codice", "Assegnatari", "Task", "Decisione di riferimento"),
    columns: (auto, auto, 1fr, auto),
  )
]
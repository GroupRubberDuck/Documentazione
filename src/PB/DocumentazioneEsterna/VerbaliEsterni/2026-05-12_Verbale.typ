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
  major: 0,
  minor: 1,
  patch: 0,
)
#let versionNumber = currentVersion.values().map(n => { str(n) }).join(".")
#metadata(versionNumber)<versionNumber>
#let giornoRiunione = datetime(year: 2026, month: 05, day: 05)
#let doctype = "Verbale esterno"
#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages("Stato del documento", doctype, giornoRiunione)[
  #statusTab(
    stato: "In verifica",
    versione: versionNumber,
    autori: (persone.FILIPPO,),
    verificatori: ("-",),
    uso: "Esterno",
    destinatari: ("Tutto il gruppo",),
  )
]

#insertRomanNumberedPages("Indice", "Verbale esterno", giornoRiunione)[
  #outline(depth: 2, title: "Indice")
]

#pagebreak()
#context counter(page).update(1)


#insertArabicNumberedPages("Informazioni generali", "Verbale esterno", giornoRiunione)[
  = Informazioni generali
  - *Tipo di riunione*: Esterno
  - *Motivazione*: Aggiornamento della proponente sullo stato di avanzamento del progetto e dimostrazione delle funzionalità sviluppate.
  - *Data*: #giornoRiunione.display()
  - *Luogo*: Riunione su Zoom
  - *Ora inizio*: 15.00
  - *Ora fine*: 15.15
  - *Scriba*: Filippo Guerra
  - *Partecipanti*:#align(left)[
      #set list(marker: [--])
      - Filippo Guerra
      - Davide Testolin
      - Aldo Bettega
      - Davide Lorenzon
      - Ana Maria Draghici
      - Felician Mario Necsulescu \
      #set list(marker: [#set text(fill: blue)
        •
      ])
      - Tobia Fiorese
    ]
]
#insertArabicNumberedPages("Ordine del giorno", "Verbale esterno", giornoRiunione)[
= Ordine del giorno
  - Dimostrazione delle funzionalità sviluppate finora.
  - Discussione del problema di gestione della sessione di valutazione.
  - Chiarimento sullo stato del backend e dell'integrazione con il frontend.
]

#insertArabicNumberedPages("Riassunto della riunione", "Verbale esterno", giornoRiunione)[
= Riassunto della Riunione
  La riunione ha riguardato l'aggiornamento sullo stato di avanzamento del progetto tramite una dimostrazione live delle funzionalità front-end sviluppate. È stato discusso un problema tecnico relativo alla gestione della sessione di valutazione e sono state definite le funzionalità ancora mancanti. 

]

#insertArabicNumberedPages("Contenuto riunione", "Verbale esterno", giornoRiunione)[
= Contenuto riunione

== Aggiornamento sullo stato di avanzamento
  Il back-end è stato completamente sviluppato. Il front-end è ancora in fase di completamento a causa di ritardi nel debugging. Durante la dimostrazione sono state mostrate le seguenti funzionalità già operative:
    - Lista dispositivi con creazione tramite form, visualizzazione del dettaglio e modifica.
    - Esportazione del dispositivo nei formati JSON, XML e CSV.
    - Importazione del dispositivo da file.
    - Avviso preventivo prima dell'eliminazione di un dispositivo, con possibilità di esportare la valutazione associata.
    - Salvataggio e chiusura della sessione di valutazione.
  La copertura dei test è pari all'88%, con test di unità e un test di integrazione (verifica che i file esportati siano reimportabili). I test di integrazione principali sono ancora da completare.

== Gestione della Sessione <ses>
  Il sistema consente una sola sessione di valutazione attiva alla volta: non è possibile avviare la valutazione di un nuovo dispositivo se ne è già in corso una. La sessione viene salvata sul database e può essere ripresa in seguito. \
  È emerso un problema: se l'utente naviga all'indietro tramite le frecce del browser senza chiudere esplicitamente la sessione, questa rimane aperta nel database. In questo stato non è possibile avviare né riprendere alcuna valutazione senza riavviare il database. Il front-end mostra già un avviso che invita l'utente a salvare e chiudere la sessione prima di uscire, ma l'utente può comunque ignorarlo.\ 
  Il referente aziendale ha suggerito di aggiungere nella lista dispositivi un componente che mostri un riferimento diretto alla sessione attiva, permettendo all'utente di riprenderla senza navigare manualmente tramite URL. Il gruppo ha concordato di implementare questa funzionalità e di aggiornare di conseguenza l'analisi dei requisiti.

== Funzionalità da implementare <implementazione>
  Le funzionalità ancora mancanti, confermate dal referente aziendale, sono le seguenti:
    - Collegamento degli asset al front-end: la gestione lato back-end è già pronta ma non ancora integrata nella UI.
    - Visualizzazione della lista degli asset nel dettaglio del dispositivo.
    - Aggiunta di asset durante la sessione di valutazione.
    - Valutazione per ciascun asset inserito e relativa esportazione.
    - Completamento e test del widget del decision tree (attualmente in bozza).
    - Pulsante "Riprendi valutazione" nella lista dispositivi con riferimento alla sessione attiva.
]

#insertArabicNumberedPages("Decisioni", "Verbale esterno", giornoRiunione)[
= Decisioni
#let contatoreDecisioni = counter("decisioni")
#contatoreDecisioni.update(1)
#let prefisso = "VE.8."

#let decisioni = (
(
[#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
[Aggiungere un pulsante "Riprendi valutazione" nella lista dispositivi],
[La sessione salvata non è raggiungibile dall'URL, rendendo necessario un accesso diretto dalla lista dispositivi],
[@ses],
),
)

#utilityTable(decisioni, header: ("Codice", "Descrizione", "Motivazioni", "Ref."), columns: (auto, 2fr, 2fr, auto))
]

#insertArabicNumberedPages("TODO", "Verbale esterno", giornoRiunione)[
= TODO

#let prefisso = "TD.33."
#let contatoreTodo = counter("todo")
#contatoreTodo.update(1)

#let TODO = (

(
[#getCode(prefisso: prefisso, contatore: contatoreTodo)],
[Programmatori],
[Collegare la gestione degli asset al front-end e completare la visualizzazione nel dettaglio dispositivo],
[-],
),
(
[#getCode(prefisso: prefisso, contatore: contatoreTodo)],
[Programmatori],
[Implementare il pulsante "Riprendi valutazione" nella lista dispositivi con riferimento alla sessione attiva],
[VE.8.1],
),
(
[#getCode(prefisso: prefisso, contatore: contatoreTodo)],
[Progettisti],
[Aggiornare l'analisi dei requisiti per includere la gestione della sessione attiva nella lista dispositivi],
[-],
),
)
#utilityTable(
TODO,
header: ("Codice", "Assegnatari", "Task", "Decisione di riferimento"),
columns: (auto, auto, 1fr, auto),
)
]

// #insertArabicNumberedPages("Approvazione esterna ", "Verbale esterno", giornoRiunione)[
//   = Approvazione esterna
//   La presente sezione documenta la conferma e la validazione del verbale da parte del proponente esterno.
//   Il confronto avvenuto durante la riunione ha permesso di chiarire dubbi e punti critici, rappresentando un'importante occasione di condivisione e collaborazione tra le parti.

//   Con la firma riportata in seguito, il proponente esterno *attesta l'approvazione del documento* nella sua versione corrente.

// ]

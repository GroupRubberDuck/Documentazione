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
#let giornoRiunione = datetime(year: 2026, month: 05, day: 18)
#let doctype = "Verbale esterno"
#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages("Stato del documento", doctype, giornoRiunione)[
  #statusTab(
    stato: "In approvazione",
    versione: versionNumber,
    autori: ("Felician Mario Necsulescu",),
    verificatori: (persone.FILIPPO,),
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
  - *Motivazione*: Presentazione del Minimum Viable Product alla proponente
  - *Data*: #giornoRiunione.display()
  - *Luogo*: Riunione su Zoom
  - *Ora inizio*: 14.00
  - *Ora fine*: 14.45
  - *Scriba*: Felician Mario Necsulescu
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
      - Alessandro Zappia
    ]
]
#insertArabicNumberedPages("Ordine del giorno", "Verbale esterno", giornoRiunione)[
= Ordine del giorno

  - Presentazione del prodotto e dimostrazione tramite test di accettazione.
  - Valutazione e riscontro da parte della proponente.
  - Conferma del soddisfacimento dei requisiti obbligatori.
]


#insertArabicNumberedPages("Riassunto della riunione", "Verbale esterno", giornoRiunione)[
= Riassunto della Riunione
  La riunione ha riguardato la presentazione dello stato di avanzamento del sistema e la dimostrazione delle principali funzionalità implementate, con particolare riferimento ai flussi di gestione dei dispositivi e di valutazione degli asset.

]

#insertArabicNumberedPages("Contenuto riunione", "Verbale esterno", giornoRiunione)[
= Contenuto riunione 

== Dimostrazione stato del sistema (MVP)
Il team ha illustrato lo stato attuale dell’applicazione, presentando le principali funzionalità implementate e il relativo flusso di utilizzo.

È stata eseguita una dimostrazione in ambiente di test del sistema, durante la quale sono stati mostrati i principali casi d’uso. In particolare sono state illustrate le funzionalità di gestione dei dispositivi, che includono creazione, importazione, modifica ed eliminazione, oltre alla consultazione del dettaglio e all’esportazione dei dati nei formati previsti (JSON, XML e CSV).

È stato successivamente presentato il processo di valutazione, che prevede la selezione degli asset e la verifica dei requisiti tramite un flusso decisionale. Sono stati mostrati i possibili esiti delle valutazioni (pass, fail e non applicabile), includendo la gestione della giustificazione nei casi richiesti.

È stata inoltre presentata la gestione della sessione di valutazione, comprensiva delle funzionalità di salvataggio, ripresa e chiusura della sessione, oltre alla generazione automatica del report finale in formato PDF.

Nel corso della dimostrazione è stato discusso anche il comportamento del sistema in caso di modifica di dispositivi o asset già valutati. È stato chiarito che le modifiche di tipo anagrafico non comportano l’invalidazione automatica delle valutazioni già effettuate.

 Il referente aziendale ha verificato il corretto funzionamento del sistema durante l’esecuzione dei test di accettazione.



== Accettazione del Minimum Viable Product
Il referente aziendale ha preso visione della dimostrazione del sistema, riscontrandone la coerenza con le funzionalità previste e con gli obiettivi concordati per il Minimum Viable Product. È stato confermato il soddisfacimento dei requisiti obbligatori ed espresso parere positivo sul risultato finale del progetto.

L’accettazione del Minimum Viable Product viene formalizzata tramite firma del presente verbale.
]



#insertArabicNumberedPages("TODO", "Verbale esterno", giornoRiunione)[
= TODO

#let prefisso = "TD.37."
#let contatoreTodo = counter("todo")
#contatoreTodo.update(1)

#let TODO = (

(
[#getCode(prefisso: prefisso, contatore: contatoreTodo)],
[#persone.FELIX],
[Redazione verbale esterno della riunione del 18/05/2026],
[-],
),
)
#utilityTable(
TODO,
header: ("Codice", "Assegnatari", "Task", "Decisione di riferimento"),
columns: (auto, auto, 1fr, auto),
)
]

#insertArabicNumberedPages("Approvazione esterna ", "Verbale esterno", giornoRiunione)[
   = Approvazione esterna
   La presente sezione documenta la conferma e la validazione del verbale da parte del proponente esterno.
   Il confronto avvenuto durante la riunione ha permesso di chiarire dubbi e punti critici, rappresentando un'importante occasione di condivisione e collaborazione tra le parti.

   Con la firma riportata in seguito, il proponente esterno *attesta l'approvazione del documento* nella sua versione corrente.
  //#place(right)[#image(images_dir+"/approvazione_Bluewind_Tobia.png")]

]

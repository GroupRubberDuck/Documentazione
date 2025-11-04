#import "/src/config.typ": *
#import template_dir + "/frontPage.typ": frontPage
#import template_dir + "/setUpPageLayout.typ": insertArabicNumberedPages, insertRomanNumberedPages
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/utilityTable.typ": getCode, utilityTable

#set text(size: 12pt)
#show heading.where(level: 1): set text(size: 18pt)
#show heading.where(level: 2): set text(size: 16pt)
#let giornoRiunione = datetime(year: 2025, month: 10, day: 23)

#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages("Registro Modifiche", "Verbale Interno", giornoRiunione)[
  #registroModifiche((
    ([0.1], [2025-10-23], [Prima stesura], [Ana Maria Draghici], []),
    ([0.2], [2025-10-28], [Aggiunto registro modifiche, codice per TODO e decisioni], [Ana Maria Draghici], []),
    ([0.3], [2025-10-28], [Sistemato stato del documento], [Davide Testolin], []),
    ([1.0], [2025-10-28], [Verifica e approvazione], [], [Davide Testolin]),
  ))
]

#insertRomanNumberedPages("Indice", "Verbale Interno", giornoRiunione)[
  #outline(depth: 2, title: "Indice")
]

#pagebreak()
#context counter(page).update(1)

#insertArabicNumberedPages("Informazioni generali", "Verbale Interno", giornoRiunione)[
  = Informazioni generali
  - *Tipo di riunione* : Interno
  - *Data*: #giornoRiunione.display()
  - *Luogo*: Riunione su Discord
  - *Ora inizio*: 17:00
  - *Ora fine*: 18:20
  - *Scriba*: Ana Maria Draghici
  - *Partecipanti*:#align(left)[
      #set list(marker: [--])
      - Davide Lorenzon
      - Ana Maria Draghici
      - Felician Mario Necsulescu
      - Davide Testolin
      - Filippo Guerra
      - Aldo Bettega

    ]
]

#insertArabicNumberedPages("Ordine del giorno", "Verbale Interno", giornoRiunione)[
  = Ordine del giorno

  #align()[
    #set text(weight: "bold")
    #list(
      marker: [‣],
    )[Ridiscussione e riconferma delle preferenze dei capitolati][Discussione e presa in considerazione di ulteriori capitolati][Struttura e revisione dei documenti][Scelta del way of working e modalità di collaborazione][Definizione dei TODO e pianificazione delle attività imminenti]
  ]
]

#insertArabicNumberedPages("Riassunto della riunione ", "Verbale Interno", giornoRiunione)[
  = Riassunto della riunione
  La riunione del gruppo si è concentrata principalmente sulla valutazione dei capitolati proposti e sulla definizione delle modalità di lavoro e documentazione.

  #list(marker: [—])[
    È stata effettuata una *ridiscussione complessiva delle preferenze* sui capitolati principali (C7, C1, C8), alla luce delle informazioni raccolte negli incontri formativi con le aziende. Durante il confronto, sono stati evidenziati vantaggi, criticità e possibili ambiti di approfondimento per ciascuna proposta.
  ][
    È stata *proposta la considerazione del capitolato C5 (Nexum)*, con l’obiettivo di valutare se possa costituire un’alternativa valida ai tre già analizzati.
  ][
    Il gruppo ha discusso la *struttura dei documenti ufficiali* e la necessità di uniformare i template per migliorarne la leggibilità e la coerenza.
  ][
    Si è condivisa l’intenzione di *utilizzare GitHub come piattaforma di riferimento* per la gestione del progetto e della documentazione, integrando *Typst* come strumento di redazione e automazione del layout dei documenti.
  ][
    È stata avviata una discussione sul *way of working* da adottare, con preferenza per un approccio *Agile* basato su incontri settimanali di coordinamento.
  ][
    Infine, il gruppo ha individuato alcune *aree di miglioramento* e ha definito i *prossimi passi operativi*, che saranno formalizzati nella sezione “Decisioni” e nel relativo “TODO”.
  ]
]

#insertArabicNumberedPages("Decisioni", "Verbale Interno", giornoRiunione)[
  = Decisioni
  #let contatoreDecisioni = counter("decisioni")
  #contatoreDecisioni.update(1)

  #let decisioni = (
    (
      [#getCode(prefisso: "VI.2.", contatore: contatoreDecisioni)],
      [ Si conferma la preferenza primaria per il *Capitolato C7* (M31) e come seconda preferenza il *Capitolato C1* (BlueWind) con stesura dei relativi verbali],
    ),
    (
      [#getCode(prefisso: "VI.2.", contatore: contatoreDecisioni)],
      [Rimane aperta la valutazione del Capitolato C5 (Nexum)],
    ),
    (
      [#getCode(prefisso: "VI.2.", contatore: contatoreDecisioni)],
      [Si approva l'adozione di GitHub e Typst come strumenti ufficiali per la gestione della documentazione],
    ),
    (
      [#getCode(prefisso: "VI.2.", contatore: contatoreDecisioni)],
      [Si decide di rivedere e finalizzare i templati documentali],
    ),
    (
      [#getCode(prefisso: "VI.2.", contatore: contatoreDecisioni)],
      [Si stabilisce di adottare un approccio di lavoro Agile],
    ),
    (
      [#getCode(prefisso: "VI.2.", contatore: contatoreDecisioni)],
      [Si pianifica l'aggiornamento della project board e la definizione delle priorità di sviluppo],
    ),
  )

  #utilityTable(decisioni, header: ("Codice", "Descrizione"), columns: (1fr, 3fr))

]


#insertArabicNumberedPages("TODO", "Verbale Interno", giornoRiunione)[

  = TODO
  #let contatoreTodo = counter("todo")
  #contatoreTodo.update(1)
  I punti da approfondire nelle prossime riunioni o in vista di esse individuati sono stati i seguenti:
  #let TODO = (
    (
      [#getCode(prefisso: "TD.2.", contatore: contatoreTodo)],
      [Aldo Bettega],
      [Redazione del diario di bordo relativo al prossimo incontro],
      [-],
    ),
    (
      [#getCode(prefisso: "TD.2.", contatore: contatoreTodo)],
      [Davide Testolin],
      [Redazione del verbale C7 (M31) ],
      [VI.2.1],
    ),
    (
      [#getCode(prefisso: "TD.2.", contatore: contatoreTodo)],
      [Felician Mario Necsulescu],
      [Redazione del verbale C1 (BlueWind)],
      [VI.2.1],
    ),
    (
      [#getCode(prefisso: "TD.2.", contatore: contatoreTodo)],
      [Aldo Bettega],
      [Contattare l'azienda Nexum (C5) per fissare incontro formativo],
      [VI.2.2],
    ),
    (
      [#getCode(prefisso: "TD.2.", contatore: contatoreTodo)],
      [Tutti],
      [Aggiornare template documentali, integrando le modifiche concordate in riunione],
      [VI.2.4],
    ),
    (
      [#getCode(prefisso: "TD.2.", contatore: contatoreTodo)],
      [Davide Lorenzon],
      [Creare la project board su GitHub, con pianificazione dei TODO a breve termine],
      [VI.2.6],
    ),
  )
  #utilityTable(
    TODO,
    header: ("Codice", "Assegnatari", "Task", "Decisione di riferimento"),
    columns: (1fr, 1fr, 1fr, 1fr),
  )

]

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

#set text(size: 12pt)
#set heading(numbering: "1.1)")
#show heading.where(level: 1): set text(size: 18pt)
#show heading.where(level: 2): set text(size: 16pt)




//
//Info del documento
//
#let currentVersion = (
  major: 0, //manca approvazione bluewind
  minor: 1,
  patch: 0,
)
//converte dizionario in stringa
#let versionNumber = currentVersion.values().map(n => { str(n) }).join(".")
#metadata(versionNumber)<versionNumber>
#let doctype = "Verbale esterno"
#let giornoRiunione = datetime(year: 2026, month: 01, day: 13)



#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages("Stato del documento", doctype, giornoRiunione)[
  #statusTab(
    stato: "In lavorazione",
    versione: versionNumber,
    autori: (persone.ALDO,),
    verificatori: ("Filippo Guerra",),
    uso: "Esterno",
    destinatari: ("Tutto il gruppo", "BlueWind srl"),
  )
]
#insertRomanNumberedPages("Registro Modifiche", doctype, giornoRiunione)[


  #let modifiche = (
    ([0.1.0], [2026-01-14], persone.ALDO, [Filippo Guerra], [Stesura del verbale]),
    ([1.0.0], [2026-01-14], persone.ALDO, persone.ALDO, [Approvazione]),
  )

  #registroModifiche(modifiche)
]

#insertRomanNumberedPages("Indice", "Verbale esterno", giornoRiunione)[
  #outline(depth: 2, title: "Indice")
]

#pagebreak()
#context counter(page).update(1)


#insertArabicNumberedPages("Informazioni generali", "Verbale esterno", giornoRiunione)[
  = Informazioni generali
  - *Tipo di riunione*: Esterno
  - *Motivazione*: Allineamento sui requisiti prodotti
  - *Data*: #giornoRiunione.display()
  - *Luogo*: Riunione su Zoom
  - *Ora inizio*: 16:00
  - *Ora fine*: 16:45
  - *Scriba*: Aldo Bettega
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
      - Alessandro Zappia
      - Tobia Fiorese
    ]
]

#insertArabicNumberedPages("Ordine del giorno", "Verbale esterno", giornoRiunione)[
  = Ordine del giorno
  - Esposizione dubbi su specifici requisiti
  - Esposizione di possibili soluzioni in ambito architetturale e di tecnologie utilizzabili
  - Definizione delle modalità operative per le fasi successive
]

#insertArabicNumberedPages("Riassunto della riunione", "Verbale esterno", giornoRiunione)[
  = Riassunto della riunione

  == Analisi dei requisiti

  === Editor di testo
  Durante la stesura dei requisiti è emersa la necessità di due differenti "editor" all'interno del sistema: uno per gli alberi decisionali, uno per la modifica dei documenti nella fase di importazione.
  BlueWind ha rassicurato che questo secondo editor non dovrebbe presentare difficoltà implementative significative.

  === Requisiti di performance
  Si è discusso della loro necessità, arrivando alla conclusione che non sono di primaria importanza, data la natura del capitolato.
  Infatti l'unica operazione che potrebbe avere necessità di tali requisiti è il caricamento degli alberi: per rendere la user experience più fluida è stato consigliato di caricare tutti gli alberi in un primo momento (aumentando il tempo di caricamento iniziale), per poi averli tutti a disposizione.

  == Tecnologie e architettura
  È stata esposta una lista di possibili tecnologie utilizzabili. BlueWind ha consigliato l'uso di strict doc ed è stato detto che sono disponibili varie librerie Python per quanto riguarda il backend.
  Per quanto riguarda il database è necessario che sia relazionale.
  Per l'architettura di sistema ci sono due opzioni: layered architecture con strati MVC (semplice, efficace per il problema e conosciuta dai membri del gruppo) oppure architettura esagonale (più sofisticata ma difficile da implementare).

  == Come procedere
  Nel prossimo periodo sarà necessario creare un prototipo dimostrativo esponibile all'azienda, affinché si mostri di essere in grado di utilizzare le tecnologie scelte e si affrontino le problematiche trovate.
  È stato consigliato di partire dal caricamento dell'albero e la sua navigazione.

]


#insertArabicNumberedPages("Decisioni", "Verbale esterno", giornoRiunione)[
  = Decisioni
  #let contatoreDecisioni = counter("decisioni")
  #contatoreDecisioni.update(1)
  #let prefisso = "VE.4."

  #let decisioni = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Creazione di prototipo dimostrativo],
      [Avere un esempio da mostrare e iniziare a trovare soluzioni a problemi di implementazione],
      [-],
    ),
  )

  #utilityTable(decisioni, header: ("Codice", "Descrizione", "Motivazioni", "Ref."), columns: (auto, 2fr, 2fr, auto))

]


#insertArabicNumberedPages("TODO", "Verbale esterno", giornoRiunione)[

  = TODO
  #let prefisso = "TD.16."
  #let contatoreTodo = counter("todo")
  #contatoreTodo.update(1)
  I TODO sorti da questa riunione sono i seguenti:
  #let TODO = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.ALDO],
      [Redazione di questo verbale],
      [VE.4.1],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [-],
      [Creazione di prototipo dimostrativo],
      [VE.4.1],
    ),
  )
  #utilityTable(
    TODO,
    header: ("Codice", "Assegnatari", "Task", "Decisione di riferimento"),
    columns: (auto, auto, 2fr, auto),
  )
]

#insertArabicNumberedPages("Approvazione esterna ", "Verbale esterno", giornoRiunione)[
  = Approvazione esterna
  La presente sezione documenta la conferma e la validazione del verbale da parte del proponente esterno.
  Il confronto avvenuto durante la riunione ha permesso di chiarire dubbi e punti critici, rappresentando un'importante occasione di condivisione e collaborazione tra le parti.

  Con la firma riportata in seguito, il proponente esterno *attesta l'approvazione del documento* nella sua versione corrente.
  /*#place(right)[#image(images_dir+"/approvazione_Bluewind.png")]*/

]


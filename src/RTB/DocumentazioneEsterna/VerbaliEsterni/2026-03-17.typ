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
#let giornoRiunione = datetime(year: 2026, month: 03, day: 17)



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
  - *Ora inizio*: 
  - *Ora fine*: 
  - *Scriba*:
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
  - Revisione dell'analisi dei requisiti
    - Optato per una rappresentazione sempre interna (Simile alla gestione dei contatti)
        - Sia per i dispositivi che per i modelli (nell'eventualità che vengano implementati i casi d'uso relativi all'editing dello standard)
  - Esposizione del POC

]


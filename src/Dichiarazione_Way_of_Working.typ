#import "/src/config.typ": *
#import template_dir + "/frontPage.typ": frontPage, frontPageSenzaData
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/utilityTable.typ": getCode, utilityTable
#import template_dir + "/statusTab.typ": statusTab
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3": chart
#set text(size: 13pt)
// #set par(justify: true)
#set heading(numbering: "1.1)")

#let doc="Dichiarazione di Way of Working"

#frontPageSenzaData(doc)

#insertRomanNumberedPagesSenzaData(PageTitle: "Stato del documento", documentType: doc)[
  #statusTab(
    stato: "In review",
    versione: "1.1",
    autori: ("Davide Lorenzon",),
    revisori:("-",),
    verificatori: ("-",),
    uso: "Interno",
    destinatari: ("Tutto il gruppo",),
  )
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Registro modifiche", documentType: doc)[


#let header=("Versione","Data","Descrizione","Autore","Revisore","Validatore")
#let modifiche=(

  ([1.0],[2025-11-05],[Stesura del verbale],[Davide Lorenzon],[-],[-]),
  
)
#registroModifiche(modifiche)
// #utilityTable(modifiche,header:header,columns:(auto,auto,2fr,1fr,1fr,1.1fr))


]

#insertRomanNumberedPagesSenzaData(PageTitle: "Indice", documentType: doc)[
  #outline(title: "Indice")
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Introduzione", documentType: doc)[
  = Introduzione
  In questo documento si tiene traccia e si definisce il way of working adottato dal gruppo. \

  Ogni documento è coerente con la versione del way of working definita fino a quel momento, attività antecedenti a una versione del way of working potrebbero non essere coerenti con la versione attuale.

  Questo way of working si applica alle attività che vanno dal #strong("23-10-2025") fino all'approvazione della successiva versione del Way of Working

  == Area per cui è stato stabilito un way of working:

  Attualmente il gruppo si è dato delle regole sulle attività relative ai seguenti ambiti:
  - *Area documentale*, quale documentazione produrre, come e chi la produce.
  - *Area del prodotto software*, suddivisione dei ruoli.
  - *Regolamento delle riunioni*, come si svolgono le riunioni.
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Introduzione", documentType: doc)[
  = Area documentale
  == Ruoli:
  Dall'analisi svolta dal gruppo basandosi sulla propria esperienza corrente e dall'osservazione di alcune best practices, sono stati delineati i ruoli necessari allo sviluppo adeguato della documentazione.

  - *Autore* #list(
    [Si occupa di scrivere la prima verisone del documento.]
    )
  - *Revisore* #list(
    [Raffina il lavoro svolto dall'autore.],
    [Applica le opportune correzioni sul contenuto#footnote()[L'efficacia del documento, la capacità di soddisfare le finalità del documento], sulla forma #footnote()[La correzione di errori grammaticali e di sintassi] e sul layout #footnote()[Il rispetto delle convenzioni stabilite per la forma dei documenti]]
    )
  - *Validatore* #list(
    [Ruolo di guardia.],
    [Controlla la qualità del lavoro svolto],
    )
  valuta il lavoro svolto sul documento ed eventualmente approva lo spostamento in done. \ Se non viene approvato, deve fornire una lista di correzioni da apportare.

]
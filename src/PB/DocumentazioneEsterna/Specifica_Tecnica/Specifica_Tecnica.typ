#import "/src/config.typ": *
#import template_dir + "/frontPage.typ": frontPageSenzaData
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/statusTab.typ": statusTab
#import template_dir + "/utilityTable.typ": getCode, utilityTable
#import template_dir + "/PdP/tabellaRischi.typ": tabellaRischiTecnologici
#import template_dir + "/PdP/tabellaAtt.typ": tabellaAtt
#import template_dir + "/PdQ/tabellaMetriche.typ": tabellaMetriche
#import glossario: dict
#set text(size: 13pt)
#set par(justify: true)


#set text(lang: "it")
#set heading(numbering: "1.1)")
#show ref: body => underline()[*#body*]
#show link: body => {
  set text(fill: blue)
  underline()[#body]
}


//
//Info del documento
//
#let doc = "Specifica Tecnica"

#let currentVersion = (
  major: 0,
  minor: 0,
  patch: 1,
)
//converte dizionario in stringa
#let versionNumber = currentVersion.values().map(n => { str(n) }).join(".")
#metadata(versionNumber)<versionNumber>


#frontPageSenzaData(doc)

#insertRomanNumberedPagesSenzaData(PageTitle: "Stato del documento", documentType: doc)[
  #statusTab(
    stato: "In progress",
    versione: versionNumber,
    autori: ( persone.DL, ),
    verificatori: ( ),
    uso: "Esterno",
    destinatari: ("Prof. Tullio Vardanega", "Prof. Riccardo Cardin", "BlueWind srl"),
  )
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Registro modifiche", documentType: doc)[



  #let modifiche = (
    (
      [0.0.1],
      [2026-04-08],
      [Davide Lorenzon ],
      [],
      [Creazione del documento e stesura iniziale.],
    ),

  )
  #registroModifiche(modifiche)
  // #utilityTable(modifiche,header:header,columns:(auto,auto,2fr,1fr,1fr,1.1fr))


]

#insertRomanNumberedPagesSenzaData(PageTitle: "Indice", documentType: doc)[
  #outline(title: "Indice")

]#insertRomanNumberedPagesSenzaData(PageTitle: "Lista delle tabelle", documentType: doc)[
  #outline(
    title: [Lista delle tabelle],
    target: figure.where(kind: table),
  )

]
#insertRomanNumberedPagesSenzaData(PageTitle: "Lista delle immagini", documentType: doc)[
  #outline(
    title: [Lista delle immagini],
    target: figure.where(kind: image),
  )
]
#context counter(page).update(1)
#insertArabicNumberedPagesSenzaData(PageTitle: "Introduzione", documentType: doc)[
  = Introduzione <introduzione>

  #include "content/01-introduzione.typ"
]
#insertArabicNumberedPagesSenzaData(PageTitle: "Tecnologie", documentType: doc)[
  = Tecnologie <tecnologie>

  #include "content/02-tecnologie.typ"
]
#insertArabicNumberedPagesSenzaData(PageTitle: "Architettura di Sistema ", documentType: doc)[
  = Architettura di Sistema <architettura-sistema>

  #include "content/03-architettura-sistema.typ"
]
#insertArabicNumberedPagesSenzaData(PageTitle: "Design Patterns", documentType: doc)[
  = Design Patterns <design-patterns>

  #include "content/04-design-pattern.typ"
]
#insertArabicNumberedPagesSenzaData(PageTitle: "Diagrammi delle classi", documentType: doc)[
  = Diagrammi delle classi<diagrammi-classi>

  #include "content/05-diagrammi-classi.typ"
]
#insertArabicNumberedPagesSenzaData(PageTitle: "Tracciamento", documentType: doc)[
  = Tracciamento <tracciamento>

  #include "content/06-tracciamento.typ"
]
#insertArabicNumberedPagesSenzaData(PageTitle: "Qualità architetturale", documentType: doc)[
  = Qualità architetturale <qualita-architetturale>

  #include "content/07-qualita-architetturale.typ"
]
#insertArabicNumberedPagesSenzaData(PageTitle: "Gestione Errori e Logging", documentType: doc)[
  = Gestione Errori e Logging <gestione-errori-logging>


  #include "content/08-gestione-errori.typ"
]
#insertArabicNumberedPagesSenzaData(PageTitle: "Sicurezza", documentType: doc)[
  = Sicurezza <sicurezza>

  #include "content/09-sicurezza.typ"
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Performance e Scalabilità", documentType: doc)[
  = Performance e Scalabilità <Performance-Scalabilita>

 #include "content/10-performance-scalabilita.typ"
]

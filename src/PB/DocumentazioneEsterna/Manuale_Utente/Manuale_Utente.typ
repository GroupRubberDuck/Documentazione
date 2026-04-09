#import "/src/config.typ": *
#import template_dir + "/frontPage.typ": frontPageSenzaData
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/statusTab.typ": statusTab
#import template_dir + "/PdP/tabellaRischi.typ": tabellaRischiTecnologici
#import template_dir + "/PdP/tabellaRischi.typ": tabellaRischiPersonali
#import template_dir + "/PdP/tabellaRischi.typ": tabellaRischiOrganizzativi
#import template_dir + "/PdP/tabellaAtt.typ": tabellaAtt
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

// ---------------------------------------------------------
// Info del documento e Versione
// ---------------------------------------------------------

#let doc = "Manuale Utente"

#let currentVersion = (
  major: 0,
  minor: 1,
  patch: 0,
)
#let versionNumber = currentVersion.values().map(n => { str(n) }).join(".")
#metadata(versionNumber)<versionNumber>


// ---------------------------------------------------------
// Pagine Iniziali (Frontespizio, Stato, Modifiche, Indici)
// ---------------------------------------------------------

#frontPageSenzaData(doc)

#insertRomanNumberedPagesSenzaData(PageTitle: "Stato del documento", documentType: doc)[
  #statusTab(
    stato: "In lavorazione",
    versione: versionNumber,
    autori: (persone.DT,),
    verificatori: (),
    uso: "Esterno",
    destinatari: ("Prof. Tullio Vardanega", "Prof. Riccardo Cardin", "BlueWind srl"),
  )
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Registro modifiche", documentType: doc)[
  #let header = ("Versione", "Data", "Descrizione", "Autore", "Revisore", "Validatore")
  #let modifiche = (
    (
      [0.1.0],
      [2026-04-09],
      persone.DT,
      [],
      [Stesura iniziale],
    ),
  )
  #registroModifiche(modifiche)
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Indice", documentType: doc)[
  #outline(title: "Indice")
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Lista delle tabelle", documentType: doc)[
  #outline(
    title: [Lista delle tabelle],
    target: figure.where(kind: table),
  )
]

// ---------------------------------------------------------
// Contenuto del Documento
// ---------------------------------------------------------
#context counter(page).update(1)

#insertArabicNumberedPagesSenzaData(PageTitle: "Introduzione", documentType: doc)[
  = Introduzione
  #include "content/01-introduzione/index.typ"
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Requisiti", documentType: doc)[
  = Requisiti <Requisiti>
  #include "content/02-requisiti/index.typ"
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Installazione", documentType: doc)[
  = Installazione <Installazione>
  #include "content/03-installazione/index.typ"
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Istruzioni d'uso", documentType: doc)[
  = Istruzioni d'uso <Istruzioni_uso>
  #include "content/04-istruzioni_uso/index.typ"
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Supporto tecnico", documentType: doc)[
  = Supporto tecnico <Supporto_tecnico>
  #include "content/05-supporto_tecnico/index.typ"
]
#import "/src/config.typ": *
#import template_dir + "/frontPage.typ": frontPageSenzaData
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/statusTab.typ": statusTab
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
  major: 1,
  minor: 0,
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
    stato: "Approvato",
    versione: versionNumber,
    autori: (persone.DT, persone.FILIPPO),
    verificatori: (persone.ANA,persone.DL,),
    uso: "Esterno",
    destinatari: ("Utenti finali",),
  )
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Registro modifiche", documentType: doc)[
  #let header = ("Versione", "Data", "Descrizione", "Autore", "Revisore", "Validatore")
  #let modifiche = (
    (
      [0.1.0],
      [2026-04-09],
      persone.DT,
      persone.DL,
      [Stesura iniziale],
    ),
    (
      [0.2.0],
      [2026-04-10],
      persone.FILIPPO,
      persone.DL,
      [Stesura bozza iniziale @intro],
    ),
    (
      [0.3.0],
      [2026-04-13],
      persone.DT,
      persone.DL,
      [Stesura @Requisiti],
    ),
    (
      [0.4.0],
      [2026-05-14],
      persone.DT,
      [Ana Maria Draghici],
      [Stesura @Installazione],
    ),
    (
      [0.5.0],
      [2026-05-16],
      [#persone.DT,\ #persone.FILIPPO],
      [Ana Maria Draghici],
      [Stesura @Istruzioni_uso],
    ),
    (
      [1.0.0],
      [2026-05-18],
      [#persone.FILIPPO],
      [#persone.ANA],
      [Approvazione],
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

#insertRomanNumberedPagesSenzaData(PageTitle: "Lista delle immagini", documentType: doc)[
  #outline(
    title: [Lista delle immagini],
    target: figure.where(kind: image),
  )
]

// ---------------------------------------------------------
// Contenuto del Documento
// ---------------------------------------------------------
#context counter(page).update(1)

#insertArabicNumberedPagesSenzaData(PageTitle: "Introduzione", documentType: doc)[
  = Introduzione <intro>
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

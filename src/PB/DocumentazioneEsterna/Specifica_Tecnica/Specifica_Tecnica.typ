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

#let doc = "Piano di Progetto"

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
    autori: (persone.ALDO, persone.DL),
    verificatori: (),
    uso: "Esterno",
    destinatari: ("Prof. Tullio Vardanega", "Prof. Riccardo Cardin", "BlueWind srl"),
  )
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Registro modifiche", documentType: doc)[
  #let header = ("Versione", "Data", "Descrizione", "Autore", "Revisore", "Validatore")
  #let modifiche = (
    (
      [0.0.1],
      [2026-04-08],
      [Davide Lorenzon,\ Aldo Bettega ],
      [-],
      [Creazione del documento],
    ),
    (
      [0.1.0],
      [2026-04-08],
      [Aldo Bettega],
      [-],
      [Creazione del documento e stesura introduzione],
    ),
    (
      [0.1.1],
      [2026-04-08],
      [Davide Lorenzon],
      [-],
      [Bozza iniziale della  Tecnologie.
      ],
    ),
    (
      [0.1.2],
      [2026-04-09],
      [#persone.DL],
      [-],
      [Bozza iniziale della @deployment Architettura di deployment.
      ],
    ),
    (
      [0.1.3],
      [2026-04-10],
      [#persone.ALDO],
      [#persone.DL],
      [Stesura della @prem e @archlog]
    ),
    (
      [0.1.4],
      [2026-04-15],
      [#persone.ALDO],
      [#persone.DL],
      [Stesura della @vista_din, vista dinamica]
    ),
    (
      [0.1.5],
      [2026-04-16],
      [#persone.DL],
      [-],
      [Stesura della @vista-dati, vista dati]
    )

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
  = Introduzione <introduzione>

  #include "content/01-introduzione/_index.typ"
]
#insertArabicNumberedPagesSenzaData(PageTitle: "Tecnologie", documentType: doc)[
  = Tecnologie <tecnologie>

  #include "content/02-tecnologie/_index.typ"
]
#insertArabicNumberedPagesSenzaData(PageTitle: "Architettura di Sistema ", documentType: doc)[
  = Architettura di Sistema <architettura-sistema>

  #include "content/03-architettura/_index.typ"
]
#insertArabicNumberedPagesSenzaData(PageTitle: "Design Patterns", documentType: doc)[
  = Design Patterns <design-patterns>

  #include "content/04-design-pattern/_index.typ"
]
#insertArabicNumberedPagesSenzaData(PageTitle: "Diagrammi delle classi", documentType: doc)[
  = Diagrammi delle classi<diagrammi-classi>

  #include "content/05-diagrammi-classi/_index.typ"
]
#insertArabicNumberedPagesSenzaData(PageTitle: "Tracciamento", documentType: doc)[
  = Tracciamento <tracciamento>

  #include "content/06-tracciamento/_index.typ"
]
#insertArabicNumberedPagesSenzaData(PageTitle: "Qualità architetturale", documentType: doc)[
  = Qualità architetturale <qualita-architetturale>


]

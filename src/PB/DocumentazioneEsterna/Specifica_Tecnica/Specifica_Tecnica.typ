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
  minor: 12,
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
    autori: (persone.ALDO, persone.DL,persone.ANA, persone.FILIPPO, persone.FELIX.replace("\n",""), persone.DT),
    verificatori: (persone.DL,persone.FILIPPO,persone.FELIX.replace("\n","")),
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
      [#persone.FILIPPO],
      [Bozza iniziale della @deployment Architettura di deployment.
      ],
    ),
    (
      [0.2.0],
      [2026-04-10],
      [#persone.ALDO],
      [#persone.DL],
      [Stesura della @prem e @archlog]
    ),
    (
      [0.3.0],
      [2026-04-15],
      [#persone.ALDO],
      [#persone.DL],
      [Stesura della @vista_din]
    ),
    (
      [0.4.0],
      [2026-04-16],
      [#persone.ALDO],
      [#persone.DL],
      [Stesura diagramma dominio e @classe_disp]
    ),
    (
      [0.5.0],
      [2026-04-16],
      [#persone.ANA],
      [#persone.DL],
      [Stesura vista_dati @vista-dati ]
    ),
    (
      [0.6.0],
      [2026-04-17],
      [#persone.FILIPPO],
      [#persone.DL],
<<<<<<< HEAD
      [Stesura vista_dati  ]
=======
      [Stesura vista_dati]
>>>>>>> 592aadfa (Chore: refactoring struttura della directory delle classi)
    ),
    (
      [0.6.1],
      [2026-04-17],
      [#persone.FILIPPO],
      [#persone.ALDO],
      [Bozza della classe valutazione @classe_valutazione ]
    ),
<<<<<<< HEAD
=======
    (
      [0.6.2],
      [2026-04-19],
      [#persone.DL],
      [#persone.ALDO],
      [Bozza delle classi relative a import ed export tramite file di dispositivo e modello]
    ),
    (
      [0.6.3],
      [2026-04-19],
      [#persone.DL],
      [#persone.ALDO],
      [Bozza delle classi relative alla generazione del report di conformità]
    ),
    (
      [0.6.4],
      [2026-04-19],
      [#persone.DL],
      [#persone.ALDO],
      [Revisione architetturale della sezione relativa alla modifica degli asset]
    ),
>>>>>>> 9d4ff2f5 (doc: classi device/asset/session st)

    (
      [0.7.0],
      [2026-04-19],
      [#persone.FELIX],
      [#persone.DL],
      [Stesura dei principi di design
      ]
    ),
    (
      [0.7.1],
      [2026-04-19],
      [#persone.FELIX],
      [#persone.DL],
      [Stesura dei design pattern: creazionali e strutturali @design-pattern-creazionali, @design-pattern-strutturali]
    ),
    (
      [0.7.2],
      [2026-04-20],
      [#persone.FELIX],
      [#persone.DL],
<<<<<<< HEAD
      [Stesura dei design pattern comportamentali e architetturali
      @design-pattern-comportamentali,      
=======
      [Stesura dei design pattern comportamentali e architetturali  
>>>>>>> d11d5c91 (Sezione gestione errori.#204)
      ]
    ),
    (
      [0.7.3],
      [2026-04-22],
      [#persone.DT],
      [Ana Maria Draghici],
      [Migliorata sezione @vista-dati]
    ),
    (
      [0.8.0],
      [2026-05-03],
      [Ana Maria Draghici],
      [#persone.ALDO],
      [Scomposizione sezioni a partire dalla @classe_disp: Device, Asset e Session ]
    ),
    (
      [0.9.0],
      [2026-05-06],
      [Ana Maria Draghici],
      [#persone.ALDO],
      [Scomposizione sezioni a partire dalla @classe_disp: Import, ValutazioneRequisiti, Dashboard,Export e Frontend ]
    ),
    (
      [0.10.0],
<<<<<<< HEAD
      [2026-05-14],
      [#persone.ALDO],
      [],
      [Riviste le parti di device e asset]
    ),
<<<<<<< HEAD

    (
      [0.11.0],
      [2026-05-12],
      [#persone.FELIX],
      [],
      [Riviste le parti di sessione e valutazione: @classe_valutazione e @Valutazione]
=======
      [2026-05-12],
      [#persone.FELIX],
      [#persone.ALDO],
      [Riviste classi di sessione e valutazione:@classe_valutazione e @Valutazione]
>>>>>>> 55b24103 (Terminata revisione dei diagrammi e creazione diagrammi per report)
    ),
    (
      [0.11.0],
      [2026-05-14],
      [#persone.FELIX],
<<<<<<< HEAD
      [],
      [Riviste le parti di importazione ed esportazione: @import e @export]
    ),
=======
    (
      [0.11.0],
      [2026-05-14],
      [#persone.ALDO],
      [],
      [Riviste classi di session]
=======
      [#persone.ALDO],
      [Riviste classi di importazione ed esportazione: @import e @export]
    ),
    (
      [0.12.0],
      [2026-05-16],
      [#persone.ALDO],
      [],
      [Rivisitazione complessiva dei diagrammi e creazione dei diagrammi di dominio, asset, device e generazione report]
>>>>>>> 55b24103 (Terminata revisione dei diagrammi e creazione diagrammi per report)
    )
>>>>>>> 202d7847 (Fix: riviste classi di session)

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
<<<<<<< HEAD
#insertArabicNumberedPagesSenzaData(PageTitle: "Qualità architetturale", documentType: doc)[
  = Qualità architetturale <qualita-architetturale>


=======
#insertArabicNumberedPagesSenzaData(PageTitle: "Gestione Errori e Logging", documentType: doc)[
  = Gestione degli Errori <gestione-errori>
  #include "content/07-gestione-errori/_index.typ"
>>>>>>> d11d5c91 (Sezione gestione errori.#204)
]

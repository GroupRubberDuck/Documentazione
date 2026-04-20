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

#let doc = "Piano di Progetto"

#let currentVersion = (
  major: 1,
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
    stato: "Approvato",
    versione: versionNumber,
    autori: (persone.DT, persone.FELIX, persone.ANA, persone.ALDO),
    verificatori: (persone.ALDO, persone.ANA, persone.DT, persone.FILIPPO, persone.FELIX),
    uso: "Esterno",
    destinatari: ("Prof. Tullio Vardanega", "Prof. Riccardo Cardin", "BlueWind srl"),
  )
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Registro modifiche", documentType: doc)[
  #let header = ("Versione", "Data", "Descrizione", "Autore", "Revisore", "Validatore")
  #let modifiche = (
    (
      [0.1.0],
      [2025-11-12],
      [Davide Lorenzon],
      [Aldo Bettega],
      [Stesura iniziale e redazione Sprint 1],
    ),
    (
      [0.2.0],
      [2025-11-12],
      [Davide Lorenzon],
      [Aldo Bettega],
      [Layout per la pianificazione di lungo periodo.],
    ),
    (
      [0.2.1],
      [2025-12-10],
      [Davide Lorenzon],
      [Ana Maria\ Draghici],
      [Modificata la struttura del documento, organizzazione del progetto incluso nell'introduzione @orgProgetto, aggiunto preventivo iniziale @Preventivo. \ Pianificazione di breve e lungo periodo promosse a sezioni.],
    ),
    (
      [0.3.0],
      [2025-12-12],
      [Felician Mario\ Necsulescu],
      [Ana Maria\ Draghici],
      [Stesura analisi dei rischi @Analisi-dei-rischi. ],
    ),
    (
      [0.4.0],
      [2025-12-14],
      [Ana Maria\ Draghici],
      [Davide Testolin],
      [Aggiunta @Pianificazione e completata scrittura Sprint 2],
    ),
    (
      [0.4.1],
      [2025-12-20],
      [Ana Maria\ Draghici],
      [Davide Testolin],
      [Riviste alcune sezione di @Pianificazione, aggiunto per completezza alcuni punti su retrospettiva e rischi su Sprint 1 e Sprint 2],
    ),
    (
      [0.5.0],
      [2026-02-17],
      [#persone.ALDO],
      [#persone.FILIPPO],
      [Rivisto sprint 3, Scritto sprint 4, aggiunta notazione ROAM nei rischi],
    ),
    (
      [0.6.0],
      [2026-03-04],
      [#persone.ALDO],
      [#persone.FILIPPO],
      [Corrette e aggiornate le tabelle delle attività dei documenti, aggiunto sprint 5],
    ),
    (
      [0.7.0],
      [2026-03-05],
      [#persone.ALDO],
      [#persone.FILIPPO],
      [Aggiunta parte di classicazione e gestione rischi ROAM],
    ),
    (
      [0.8.0],
      [2026-03-11],
      [Felician Mario\ Necsulescu],
      [#persone.DT],
      [Scritto Sprint 6],
    ),
    (
      [0.9.0],
      [2026-03-25],
      [#persone.DT],
      [Felician Mario\ Necsulescu],
      [Scritto Sprint 7],
    ),
    (
      [0.10.0],
      [2026-03-25],
      [#persone.ALDO],
      [#persone.DT],
      [Stesura di preventivo attività e rischi per lo sprint 8],
    ),
    (
      [1.0.0],
      [2026-03-30],
      [#persone.DT],
      [#persone.ALDO],
      [Approvazione],
    ),
    (
      [1.1.0],
      [2026-04-08],
      [#persone.ALDO],
      [#persone.ANA],
      [Stesura retrospettiva sprint 8],
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

#insertArabicNumberedPagesSenzaData(PageTitle: "Analisi dei rischi", documentType: doc)[
  = Analisi dei rischi <Analisi-dei-rischi>
  #include "content/02-analisi_rischi/index.typ"
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Metodologia di pianificazione", documentType: doc)[
  = Metodologia di pianificazione <Pianificazione>
  #include "content/03-metodologia_pianificazione/index.typ"
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Pianificazione di lungo periodo", documentType: doc)[
  = Pianificazione di lungo periodo <Pianificazione_di_lungo_periodo>
  #include "content/04-pianificazione_lungo_periodo/index.typ"
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Dettaglio degli Sprint", documentType: doc)[
  = Pianificazione di breve periodo<Pianificazione_di_breve_periodo>
  #include "content/05-pianificazione_breve_periodo/index.typ"
]
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

#let doc = "Piano di progetto"

#let currentVersion = (
  major: 0,
  minor: 7,
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
    stato: "In progress",
    versione: versionNumber,
    autori: ("Davide Lorenzon, Felician Mario Necsulescu, Ana Maria Draghici, Aldo Bettega",),
    verificatori: ("Aldo Bettega, Ana Maria Draghici, Davide Testolin",),
    uso: "Esterno",
    destinatari: ("Prof. Tullio Vardanega", "Prof. Riccardo Cardin", "BlueWind srl"),
  )
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Registro modifiche", documentType: doc)[
  #let header = ("Versione", "Data", "Descrizione", "Autore", "Revisore", "Validatore")
  #let modifiche = (
    ( [0.1.0], [2025-11-12], [Davide Lorenzon], [Aldo Bettega], [Stesura iniziale e edazione Sprint 1], ),
    ( [0.2.0], [2025-11-12], [Davide Lorenzon], [Aldo Bettega], [Layout per la pianificazione di lungo periodo.], ),
    ( [0.2.1], [2025-12-10], [Davide Lorenzon], [Ana Maria\ Draghici], [Modificata la struttura del documento, organizzazione del progetto incluso nell'introduzione @orgProgetto, aggiunto preventivo iniziale @Preventivo. \ Pianificazione di breve e lungo periodo promosse a sezioni.], ),
    ( [0.3.0], [2025-12-12], [Felician Mario\ Necsulescu], [Ana Maria\ Draghici], [Stesura analisi dei rischi @Analisi-dei-rischi. ], ),
    ( [0.4.0], [2025-12-14], [Ana Maria\ Draghici], [Davide Testolin], [Aggiunta @Pianificazione e completata scrittura Sprint 2], ),
    ( [0.4.1], [2025-12-20], [Ana Maria\ Draghici], [Davide Testolin], [Riviste alcune sezione di @Pianificazione, aggiunto per completezza alcuni punti su retrospettiva e rischi su Sprint 1 e Sprint 2], ),
    ( [0.5.0], [2026-02-17], [#persone.ALDO], [-], [Rivisto sprint 3, Scritto sprint 4, aggiunta notazione ROAM nei rischi], ),
    ( [0.6.0], [2026-03-04], [#persone.ALDO], [-], [Corrette e aggiornate le tabelle delle attività dei documenti, aggiunto sprint 5], ),
    ( [0.7.0], [2026-03-05], [#persone.ALDO], [-], [Aggiunto @ROAM di classicazione e gestione rischi ROAM], ),
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

<<<<<<< HEAD

=== Preventivo <Preventivo>
Il gruppo di lavoro prevede di completare il progetto entro e non oltre il *30 aprile 2026*, nel rispetto di un  *budget complessivo pari a 11610€*.

Il dettaglio della pianificazione e del budget stimato è consultabile nel documento di candidatura disponibile al seguente link: 
#link("https://grouprubberduck.github.io/Documentazione/output/Candidatura/Dichiarazione_Impegni-v2.0.0.pdf")[
Dichiarazione degli Impegni – versione 2.0.0
]

Di seguito viene riportata la *tabella riepilogativa dei costi*, già inclusa nella *Dichiarazione degli Impegni*. La tabella rappresenta la stima economica elaborata in fase di candidatura e costituisce il riferimento principale per la pianificazione, il monitoraggio e il controllo dei costi lungo l'intero ciclo di vita del progetto.
  #let ruoli = (
    (nome: "Responsabile", costo: 30, oreIndividuali: 11),
    (nome: "Amministratore", costo: 20, oreIndividuali: 9),
    (nome: "Analista", costo: 25, oreIndividuali: 19),
    (nome: "Progettista", costo: 25, oreIndividuali: 17),
    (nome: "Programmatore", costo: 15, oreIndividuali: 17),
    (nome: "Verificatore", costo: 15, oreIndividuali: 18),
  )
  #let acc = (nome: "Totali", oreIndividualiTotali: 0, oreTotali: 0, placeholder: "", costoTot: 0)


  #let analisiImpegni = ()

  #for ruolo in ruoli {
    let oreTot = ruolo.at("oreIndividuali") * 6
    analisiImpegni.push((
      ruolo.at("nome"),
      str(ruolo.at("oreIndividuali")),
      str(oreTot),
      str(ruolo.at("costo")),
      str(ruolo.at("costo") * oreTot),
    ))

    acc.at("oreIndividualiTotali") += ruolo.at("oreIndividuali")
    acc.at("oreTotali") += oreTot
    acc.at("costoTot") += ruolo.at("costo") * oreTot

  }

  #analisiImpegni.push((
    acc.at("nome"),
    str(acc.at("oreIndividualiTotali")),
    str(acc.at("oreTotali")),
    acc.at("placeholder"),
    str(acc.at("costoTot")),
  ))
    #set table(
      stroke: (_, y) => if y == 7 { (top: 1.5pt) },
      // gutter: 0.2em,
      fill: (x, y) => if x == 0 or y == 0 { white },
    )


    #figure(
      caption: [Ripartizione oraria e dettaglio dei costi],
      kind: "Tabella",
      supplement: [Tabella],
    )[
      #utilityTable(
        header: ("Ruolo", "Ore individuali", "Ore Totali", "Costo (€/h)", "Costo totale (€)"),
        columns: (1fr,) * 5,
        analisiImpegni,
      )
    ]<tabella-ore>


  === Requirements and Technology Baseline

Di seguito vengono riportati i documenti richiesti per questa fase.
Ogni documento è suddiviso nelle sezioni che lo compongono, con l'indicazione degli sprint a cui sono associati. Questo approccio permette di avere una *visione d'insieme delle attività*, stimare il lavoro complessivo e suddividerlo successivamente in singoli sprint, seguendo le *buone pratiche dello sviluppo agile*.   


  #let attivitaADR=(
      "Studio della struttura del documento",
      [_Sprint 1_],
      "Completato", 
      "Redazione dell'introduzione",
      [_Sprint 1_],
      "Completato",
      "Definizione dei casi d'uso: requisiti obbligatori",
      [_Sprint 2_],
      "Completato",
      "Definizione dei casi d'uso: requisiti non obbligatori;",
      [_Sprint 3_],
      "Da definire",
       "Raffinazione dei casi d'uso",
      [_Sprint 3_],
      "Da definire",
      "Requisiti",
      [_Sprint _],
      "Da definire",
  ) 
#figure(caption:"RTB-Analisi dei Requisiti")[
#tabellaAtt(titolo:"Analisi dei Requisiti",attivita:attivitaADR)
]

  #let attivitaPP=(
      "Studio della struttura del documento",
      [_Sprint 1_],
      "Completato", 
      "Redazione dell'introduzione",
      [_Sprint 1_],
      "Completato",
      [Studio dei metodi \ di retrospettiva],
      [_Sprint 2_],
      "Completato",
      [Analisi e gestione \ dei rischi],
      [_Sprint 3_],
      "Completato",
      [Studio dei metodi \ pianificazione],
      [_Sprint 3_],
      "Completato",
      [Pianificazione di \ lungo periodo],
      [_Sprint 3_],
      "In corso",
      [Pianificazione di \ breve periodo],
      [_Tutti sprint_],
      "In corso",
  ) 
#figure(caption:"RTB-Piano di Progetto")[
#tabellaAtt(titolo:"Piano di Progetto",attivita:attivitaPP)
]

  #let attivitaPP=(
      "Studio della struttura del documento",
      [_Sprint 1_],
      "Completato", 
      "Redazione dell'introduzione",
      [_Sprint 3_],
      "In corso",
      "Soglie delle misurazioni",
      [_Sprint 3_],
      "In corso",
      "Automiglioramento",
      [_Sprint 1_],
      "Da definire",
      "Metodi di testing",
      [_Sprint 1_],
      "Da definire",
      "Cruscotto di valutazione",
      [_Sprint 1_],
      "Da definire",
  ) 
#figure(caption:"RTB-Piano di Qualifica")[
#tabellaAtt(titolo:"Piano di Qualifica",attivita:attivitaPP)
]


  #let attivitaNP=(
      "Studio della struttura del documento",
      [_Sprint 1_],
      "Completato", 
      "Redazione dell'introduzione",
      [_Sprint 1_],
      "Completato",
      "Studio dei processi di di ciclo di vita primari",
      [_Sprint 3_],
      "In corso",
      "Studio dei processi di di ciclo di vita di supporto",
      [_Sprint 2_],
      "Compleato",
      "Studio dei processi di di ciclo di vita organizzativi",
      [_Sprint 2_],
      "Completato",
      "Studio delle best practices o altro materiale ritenuto importante",
      [_Tutti sprint_],
      "In corso",
  ) 
#figure(caption:"RTB-Norme di Progetto")[
#tabellaAtt(titolo:"Norme di Progetto",attivita:attivitaNP)
]

  #let attivitaGL=(
      "Aggiornamento del glossario",
      [_Tutti gli sprint_],
      "In corso", 
  ) 
#figure(caption:"RTB-Glossario")[
#tabellaAtt(titolo:"Glossario",attivita:attivitaGL)
]


  #let attivitaPoC=(
      "Python 3x",
      [_Sprint 1_],
      "Da definire", 
       "Flask",
      [_Sprint 1_],
      "Da definire", 
       "Docker",
      [_Sprint 1_],
      "Da definire",
  ) 
#figure(caption:"RTB-Proof of Concept")[
#tabellaAtt(titolo:"Proof of Concept",attivita:attivitaPoC)
]



  === Product Baseline
La redazione di questo paragrafo sarà effettuata in seguito al superamento della Requirements and Technology Baseline (RTB).
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Pianificazione di breve periodo", documentType: doc)[
  = Pianificazione di breve periodo
  #include "content/04-pianificazione_breve_periodo/index.typ"
=======
#insertArabicNumberedPagesSenzaData(PageTitle: "Dettaglio degli Sprint", documentType: doc)[
  = Pianificazione di breve periodo<Pianificazione_di_breve_periodo>
  #include "content/05-pianificazione_breve_periodo/index.typ"
>>>>>>> f/pdq
]


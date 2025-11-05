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
#set heading(numbering: "1.a)")

#frontPageSenzaData([Dichiarazione degli impegni])

#insertRomanNumberedPagesSenzaData(PageTitle: "Stato del documento", documentType: "Dichiarazione degli impegni")[
  #statusTab(
    stato: "In review",
    versione: "2.0",
    autori: ("Davide Lorenzon",),
    revisori: ("Aldo Bettega",),
    verificatori: ("Davide Testolin",),
    uso: "Esterno",
    destinatari: ("Professor Tullio Vardanega", "Professor Riccardo Cardin"),
  )
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Registro modifiche", documentType: "Dichiarazione degli impegni")[

  #registroModifiche((
    ("1.0", "30-10-2025", "Stesura della bozza del documento", "Davide Lorenzon", "Davide Testolin", "-"),
    ("2.0", "30-10-2025", "Modifiche dovute alla scelta di un nuovo capitolato", "Davide Lorenzon", "Aldo Bettega", "-"),
  ))
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Indice", documentType: "Dichiarazione degli impegni")[
  #outline(title: "Indice")
]

#context counter(page).update(1)


#insertArabicNumberedPagesSenzaData(PageTitle:"Introduzione",documentType:"Dichiarazione degli impegni")[
= Introduzione
In questo ducumento vengono ufficializzati gli impegni che il gruppo si impone di rispettare per la consegna del capitolato C1 \ *Automated EN18031 Compliance Verification* .\
In particolare:
- Il preventivo dei costi
- La data prevista per il termine ultimo del progetto
- La suddivisione dei ruoli sia in termini di ore individuali complessive previste e la loro ripartizione tra i ruoli
- La suddivisione dei ruoli sul totale complessivo delle ore
- Le regole iniziali di rotazione





]



#insertArabicNumberedPagesSenzaData(PageTitle:"Termine del progetto",documentType:"Dichiarazione degli impegni")[
= Termine del progetto
Con il presente documento, il gruppo RubberDuck (gruppo n.14) rende nota la data prevista per il termine del progetto, il *30 Aprile 2026*.
Tale data è stata stabilità in accordo alle disponibilità dei membri del gruppo e basandosi sui risultati dell'analisi dell'impegno orario.


== Rischi attesi e loro mitigazione
Principali rischi individuati:
#enum(
  [L'inesperienza del team in progetti di questa portata e tipo],
  [Necessaria la comprensione di una norma (EN18031)],
  [Le tecnologie da utilizzare sono state percepite come stringenti da alcuni membri del gruppo]
  )

Mitigazioni:
#enum([L'azienda si è dimostrata disposta nell'assistere il gruppo in occasione di problemi relativi al punto 1, cosa di cui si è parlato anche durante una chiamata zoom richiesta per rispondere a delle domande #inserisciLink(url:"https://grouprubberduck.github.io/Documentazione/output/Candidatura/DocumentazioneEsterna/2025-10-23_Verbale_incontro_Bluewind.pdf")[Verbale di riferimento]])



]

  #let arrayPerPlot = ()
  #let ruoli = (
    (nome: "Responsabile", costo: 30, oreIndividuali: 11),
    (nome: "Amministratore", costo: 20, oreIndividuali: 9),
    (nome: "Analista", costo: 25, oreIndividuali: 19),
    (nome: "Progettista", costo: 25, oreIndividuali: 17),
    (nome: "Programmatore", costo: 15, oreIndividuali: 17),
    (nome: "Verificatore", costo: 15, oreIndividuali: 18),
  )
  #let acc = (nome: "Totali", oreIndividualiTotali: 0, oreTotali: 0, placeholder: "", costoTot: 0)

#insertArabicNumberedPagesSenzaData(PageTitle:"Analisi dell'impegno orario",documentType:"Dichiarazione degli impegni")[



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

    arrayPerPlot.push((ruolo.at("nome"), ruolo.at("oreIndividuali")))
  }

  #analisiImpegni.push((
    acc.at("nome"),
    str(acc.at("oreIndividualiTotali")),
    str(acc.at("oreTotali")),
    acc.at("placeholder"),
    str(acc.at("costoTot")),
  ))


= Analisi dell'impegno orario

  Dopo aver calcolato la disponibilità oraria media di impegno tra i componenti del gruppo,
  abbiamo definito le ore effettive che possiamo dedicare al progetto. Successivamente, abbiamo elaborato il preventivo, stabilendo la suddivisione delle ore. \




  #align(center)[

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

  ]
    L'esito di questa analisi ha evidenziato i seguenti punti:
  - Impegno orario individuale complessivo previsto di * #acc.at("oreIndividualiTotali") ore *, come evidenziato nel tabella della ripartizione oraria (@tabella-ore)
  - L'impegno orario calcolato è di *#acc.oreTotali ore*
  - Gli impegno orari, ovvero le quantità di ore produttive, che ciascun membro del gruppo dovrà dedicare a uno specifico ruolo sono esposti nella colonna "ore individuali" della @tabella-ore presente qui sopra.
  - Il costo complessivo è stato calcolato in accordo ai costi orari stabiliti nel regolamento del progetto.



  \ \ \ \
  *Vengono rispettati i vincoli del regolamento*:
  - Costo totale minimo rispettato($#acc.at("costoTot")>10285,71$)
  - Ore produttive a persona comprese nell'intervallo ammesso ($#acc.at("oreIndividualiTotali")in [80,95]$)

]

#insertArabicNumberedPagesSenzaData(PageTitle:"Partizione dei ruoli",documentType:"Dichiarazione degli impegni")[

  = Partizione oraria dei ruoli
== Descrizione dei ruoli
#list(
  [*Responsabile*:
  - Coordina l’elaborazione di piani e scadenze
  - Approva il rilascio di prodotti parziali o finali
  - Comunica con il committente
  - Garantisce che le risorse disponibili siano usate con efficienza
  - Presenza richiesta durante tutto l'arco del progetto
  ],
  
  [*Amministratore*: 
  - Assicura l’efficienza di procedure, strumenti e tecnologie a supporto del way of working
  - Prensenza richiesta durante tutto l'arco del progetto
  ],

  [*Analista*:
  - Svolge le attività di analisi dei requisiti
  - Figura essenziale nella fase iniziale del progetto
  ],

  [*Progettista*:
  - Si occupa di progettare un'architettura che soddisfi i requisiti stabiliti dall'analista
  - Svolge le attività di design e modellazione
  - Figura essenziale nella fase di progettazione (successiva all'analisi dei requisiti)
  ],

  [*Programmatore*:
  - Svolge le attività di codifica
  - Implementa le scelte prese dal progettista
  - Figura essenziale nella fase di implementazione
  ],
  [*Verificatore*:
  - Garantisce la qualità degli elementi sviluppati
  - Svolge le attività di testing e validazione
  - Figura essenziale nella fase di implementazione e successiva
  ]
  )



  == Assegnazione dei ruoli

  I ruoli saranno ricoperti a rotazione cercando di garantire che il carico di lavoro venga distribuito equamente tra i membri del gruppo.
  
  Il ruolo di Responsabile è soggetto a vincoli speciali aggiuntivi rispetto agli altri ruoli:
  - Non vi può essere più di un responsabile contemporaneamente
  - Vi deve sempre essere almeno un responsabile

  Regole generali per la rotazione dei ruoli:
  - Nessuno può eccedere il monte ore previsto per individuo (stabilito nella @tabella-ore), sia complessivo che per ruolo.
  - Nessuno può ricoprire più ruoli contemporaneamente .
  - Tutti devono avere un ruolo assegnato in ogni momento .
  - Vi deve essere rotazione tra i ruoli, nessuno può ricoprire lo stesso ruolo all'interno di sprint troppo vicini temporalmente, se possibile.
  - Tutti devono ricoprire il numero di ore previsto per ogni ruolo
  - All'inizio di ciascuno sprint si individuano le attività da svolgere e in accordo con esse si stimano le ore produttive di ciascun ruolo necessarie a realizzarle, esse saranno divise tra i membri del gruppo secondo i criteri precedenti e rendicontate in modo da gestire meglio la pianificazione futura

== Motivazioni della ripartizione
In questa sezione viene reso pubblico il ragionamento dietro la ripartizione dei ruoli.

- *Analisi della norma *\
Si è data molta importanza al ruolo di analista.
  Tra le attività che saranno da svolgere è molto importante la corretta comprensione e analisi dello standard tecnico *EN 18031* per poter modellare correttamnete i requisiti del prodotto software.
- *Progettista*
  Si è data una discreta importanza al ruolo di progettista.
  All'interno del progetto un design solido e orientato al riutilizzo di determinati aspetti del progetto (in particolare per soddisfare i requisiti di estensibilità)

- *Verificatore*
  Si è data molta importanza al ruolo di verificatore,ciò è conseguenza della natura del progetto molto orientata all'interazione con l'utente.




  = Grafico degli impegni
  Il seguente grafico esemplifica la divisione delle ore per ruolo:
  #figure(
    caption: [Percentuale di ore di lavoro produttive divise per ruolo ],
    kind: "Grafico",
    supplement: [Grafico],
  )[
    #cetz.canvas({
      let colors = gradient.linear(red, blue, green, yellow)

      chart.piechart(
        arrayPerPlot,
        value-key: 1,
        label-key: 0,
        radius: 4,
        gap: 0,
        stroke: 1pt,
        slice-style: colors,
        inner-radius: 0,
        outset: none,
        inner-label: (content: "%", radius: 110%),
        outer-label: (content: (value, label) => [#label], radius: 140%),
      )
    })
  ]

]

#insertArabicNumberedPagesSenzaData(PageTitle:"Preventivo finale",documentType:"Dichiarazione degli impegni")[


  = Preventivo finale
  Il preventivo finale calcolato in base alle tariffe orarie dei ruoli e alle ore preventivate risulta di #acc.costoTot €.
  In totale il monte ore preventivato è pari a #acc.oreTotali ore, divise in #acc.oreIndividualiTotali ore complessive per ciascun membro del gruppo.


]




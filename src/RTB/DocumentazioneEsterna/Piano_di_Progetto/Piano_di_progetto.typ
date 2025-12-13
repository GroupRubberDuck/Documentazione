#import "/src/config.typ": *
#import template_dir + "/frontPage.typ": frontPageSenzaData
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/statusTab.typ": statusTab
#import template_dir + "/utilityTable.typ": getCode, utilityTable
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


// 
//Info del documento 
// 
#let doc = "Piano di progetto"

#let currentVersion=(
  major:0,
  minor:3,
  patch:0,
)
//converte dizionario in stringa
#let versionNumber=currentVersion.values().map(n=>{str(n)}).join(".")
#metadata(versionNumber)<versionNumber>


#frontPageSenzaData(doc)

#insertRomanNumberedPagesSenzaData(PageTitle: "Stato del documento", documentType: doc)[
  #statusTab(
    stato: "In progress",
    versione: versionNumber,
    autori: ("Davide Lorenzon, Felician Mario Necsulescu",),
    verificatori: ("Aldo Bettega, Ana Maria Draghici",),
    uso: "Esterno",
    destinatari: ("Prof. Tullio Vardanega", "Prof. Riccardo Cardin", "BlueWind srl"),
  )
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Registro modifiche", documentType: doc)[


  #let header = ("Versione", "Data", "Descrizione", "Autore", "Revisore", "Validatore")
  #let modifiche = (
    ([0.1.0], [2025-11-12], [Davide Lorenzon], [Aldo Bettega], [Stesura iniziale.]),    
    ([0.2.0], [2025-11-12], [Davide Lorenzon], [Aldo Bettega], [Layout per la pianificazione di lungo periodo.]),    
    ([0.2.1], [2025-12-10], [Davide Lorenzon], [-], [Modificata la struttura del documento, organizzazione del progetto incluso nell'introduzione @orgProgetto, aggiunto preventivo iniziale @Preventivo. \  
    Pianificazione di breve e lungo periodo promosse a sezioni.]),    
    ([0.3.0], [2025-12-12], [Felician Mario Necsulescu], [Ana Maria\ Draghici], [Stesura analisi dei rischi @Analisi-dei-rischi. ] ),   
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
  = Introduzione
  #include("content/01-introduzione/index.typ")
]


// #insertArabicNumberedPagesSenzaData(PageTitle: "Organizzazione del progetto", documentType: doc)[


// ]


#insertArabicNumberedPagesSenzaData(PageTitle: "Analisi dei rischi", documentType: doc)[
  = Analisi dei rischi <Analisi-dei-rischi>
#include "content/02-analisi_rischi/index.typ"
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Suddivisione del lavoro", documentType: doc)[

]

#insertArabicNumberedPagesSenzaData(PageTitle: "Pianificazione di lungo periodo", documentType: doc)[


  // == Scomposizione del lavoro

  // Scomposizione delle attività di progetto e identificazione degli input e degli output di ogni attività.
  // Eventualmente separandole per "scope", processi primari, di supporto, organizzativi.
  = Pianificazione di lungo periodo

  == Requirements and Technology Baseline

  In questa fase le attività di progetto sono legate all'analisi dei requisiti e alla progettazione.
  I ruoli di maggiore rilevanza sono i seguenti:
  - analista, per la baseline dei requisiti;
  - progettista, per la fase di progettazione.
  
  Amministratore e responsabile ricoprono un ruolo significativo in quanto svolgono attività che portano beneficia tutto il gruppo.






  #let attivitaADR=(
      "Studio della struttura del documento",
      [_Sprint 1_],
      "In corso", 
      "Redazione dell'introduzione",
      [_Sprint 1_],
      "In corso",
      "Definizione dei casi d'uso",
      [_Sprint 1_],
      "In corso",
  ) 
#figure(caption:"RTB-Analisi dei Requisiti")[
#tabellaAtt(titolo:"Analisi dei Requisiti",attivita:attivitaADR)
]

  #let attivitaPP=(
      "Studio della struttura del documento",
      [_Sprint 1_],
      "In corso", 
      "Redazione dell'introduzione",
      [_Sprint 1_],
      "In corso",
      [Analisi e gestione \ dei rischi],
      [_Sprint 1_],
      "In corso",
      [Pianificazione di \ lungo periodo],
      [_Sprint 1_],
      "In corso",
      [Pianificazione di \ lungo periodo],
      [_Sprint 1_],
      "In corso",
      [Studio dei metodi \ di retrospettiva],
      [_Sprint 1_],
      "In corso",
  ) 
#figure(caption:"RTB-Piano di Progetto")[
#tabellaAtt(titolo:"Piano di Progetto",attivita:attivitaPP)
]

  #let attivitaPP=(
      "Studio della struttura del documento",
      [_Sprint 1_],
      "In corso", 
      "Redazione dell'introduzione",
      [_Sprint 1_],
      "In corso",
  ) 
#figure(caption:"RTB-Piano di Qualifica")[
#tabellaAtt(titolo:"Piano di Qualifica",attivita:attivitaPP)
]


  #let attivitaNP=(
      "Studio della struttura del documento",
      [_Sprint 1_],
      "In corso", 
      "Redazione dell'introduzione",
      [_Sprint 1_],
      "In corso",
      "Studio dei processi di di ciclo di vita primari",
      [_Sprint 1_],
      "In corso",
      "Studio dei processi di di ciclo di vita di supporto",
      [_Sprint 1_],
      "In corso",
      "Studio dei processi di di ciclo di vita organizzativi",
      [_Sprint 1_],
      "In corso",
  ) 
#figure(caption:"RTB-Norme di Progetto")[
#tabellaAtt(titolo:"Norme di Progetto",attivita:attivitaNP)
]

  #let attivitaGL=(
      "Aggiornamento del glossario",
      [_Sprint 1_],
      "In corso", 
  ) 
#figure(caption:"RTB-Glossario")[
#tabellaAtt(titolo:"Glossario",attivita:attivitaGL)
]


  #let attivitaPoC=(
      "",
      [],
      "", 
  ) 
#figure(caption:"RTB-Proof of Concept")[
#tabellaAtt(titolo:"Proof of Concept",attivita:attivitaPoC)
]



  === Product Baseline
  Allo stato attuale il gruppo non possiede informazioni sufficienti a eseguire una adeguata previsione delle attività di questa fase.
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Pianificazione di breve periodo", documentType: doc)[
  == Pianificazione di breve periodo
  #include "content/04-pianificazione_breve_periodo/index.typ"
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Metodi di retrospettiva", documentType: doc)[
  = Metodi di retrospettiva
  La retrospettiva è un elemento essenziale dei modelli agile, fornisce informazioni al team per riflettere sul proprio lavoro, identificare punti di miglioramento, e pianificare i prossimi passi da intraprendere negli sprint futuri.
  Alcuni modelli di retrospettiva sono i seguenti, non sono necessariamente mutualmente esclusivi:
  #terms(separator: ": ",
  ([Eventi significativi],[Viene creata una timeline degli eventi significativi.
  Marcando rilasci importanti, successi, fallimenti e cambiamentia una project board.
  Utile a rinfrescare la memoria dei membri del team e a fornire contesto.
  ]),
  ([Start, stop, continue],[

Questa tecnica orientata all'azione si concentra su ciò che il team dovrebbe iniziare a fare, smettere di fare e continuare a fare. \ Aiuta a identificare elementi attuabili e incoraggia il team a riflettere su comportamenti e pratiche specifici.
  ]),
([Gradito, Osteggiato, Mancato, Appreso],[

In questa tecnica, il team discute ciò che è stato gradito, osteggiato, ciò che è mancato e ciò che è stato appreso durante lo sprint. Fornisce una visione completa delle esperienze del team e aiuta a identificare le aree di miglioramento e di apprendimento.]),
  ([Mad, Sad, Glad],
  [Questa tecnica si concentra sugli aspetti emotivi del lavoro. I membri del team condividono ciò che li ha fatti sentire arrabbiati, tristi e soddisfatti. Aiuta a identificare le fonti di frustrazione e di soddisfazione, fornendo spunti sulla dinamica di gruppo e sul morale.
  ]),
  ([Five Whys],[La tecnica dei Five Whys consiste nel chiedere "perché" cinque volte per risalire alla causa principale di un problema. Aiuta il team ad approfondire le questioni e a trovare soluzioni a lungo termine, anziché affrontare i sintomi superficiali.]),
  ([Sailboat],[Questa tecnica immaginativa utilizza la metafora di una barca a vela per identificare i rischi (scogli), le sfide (ancore), le forze positive (vento) e gli obiettivi (terraferma). Aiuta il team a visualizzare il proprio lavoro e a identificare i fattori che hanno influenzato i progressi.]),
  ([What, So What, Now What],[Questa tecnica prevede tre fasi: identificare cosa è accaduto, discutere l'impatto (quindi cosa) e determinare i passi successivi (adesso cosa). Mantiene il team focalizzato sulle azioni e sui miglioramenti futuri.]),
  ([Energy Levels],[Questa tecnica valuta i livelli di energia del team identificando le attività che li hanno caricati o prosciugati. Aiuta a comprendere la motivazione del team e a pianificare azioni per ricaricare il team per il prossimo sprint.]),
  ([Dot Voting
],[La votazione a punti aiuta a dare priorità alle idee di miglioramento, consentendo ai membri del team di votare per i suggerimenti ritenuti più preziosi. Fornisce una direzione chiara su cosa concentrarsi e garantisce che gli sforzi del team siano allineati alle loro priorità.]),

  )














]

#insertArabicNumberedPagesSenzaData(PageTitle: "Metodi di retrospettiva", documentType: doc)[
  = Analisi dei periodi di avanzamento

  Per ogni periodo
  - Preventivo
  - Consuntivo


  Cybersecurity 
]

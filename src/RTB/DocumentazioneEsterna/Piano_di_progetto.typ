#import "/src/config.typ": *
#import template_dir + "/frontPage.typ": frontPageSenzaData
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/statusTab.typ": statusTab
#set text(size: 13pt)
// #set par(justify: true)

#set text(lang: "it")
#set heading(numbering: "1.1)")
#show ref: body => underline()[*#body*]
#show link: body => {set text(fill:blue); underline()[#body]}



#let doc="Piano di progetto"

#frontPageSenzaData(doc)

#insertRomanNumberedPagesSenzaData(PageTitle: "Stato del documento", documentType: doc)[
  #statusTab(
    stato: "In progress",
    versione: "0.1",
    autori: ("Davide Lorenzon",),
    revisori:("-",),
    validatori: ("-",),
    uso: "Esterno",
    destinatari: ("Prof. Tullio Vardanega","Prof. Riccardo Cardin", "BlueWind srl"),
  )
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Registro modifiche", documentType: doc)[


#let header=("Versione","Data","Descrizione","Autore","Revisore","Validatore")
#let modifiche=(

  ([0.1],[2025-11-12],[Stesura iniziale],[Davide Lorenzon],[-],[-]),
  
)
#registroModifiche(modifiche)
// #utilityTable(modifiche,header:header,columns:(auto,auto,2fr,1fr,1fr,1.1fr))


]

#insertRomanNumberedPagesSenzaData(PageTitle: "Indice", documentType: doc)[
  #outline(title: "Indice")
]
#context counter(page).update(1)
#insertArabicNumberedPagesSenzaData(PageTitle: "Introduzione", documentType: doc)[
= Introduzione
== Scopo del documento
Nell'ambito dei progetti di sviluppo software, 
al fine di garantire obiettivi di efficacia ed efficienza,
è necessario un documento che consenta alle parti interessate di allineare il 
proprio lavoro, coordinarsi e valutare lo stato del progetto.

Definisce l'ambito del progetto, specifica quali sono le attività 
necessarie allo sviluppo del progetto.

Fornisce informazioni precise sulle ore dedciate a ciascuna attività e i costi derivanti.

In particolare vengono analizzati i seguenti temi:
- Analisi dei rischi
- Pianificazione delle attività
- Stima dei costi e delle risorse necessarie allo sviluppo del progetto. 






== Scopo del prodotto
Gennaio 2025, lo standard tecnico EN 18031 è stato inserito nella Gazzetta Ufficiale
dell’Unione Europea. \
Questo comporta l'entrata in vigore di nuovi standard per un’ampia gamma di prodotti che utilizzano Wi-Fi,
LTE, BT o dispositivi IoT wireless. \
Obbligatori dal 1 agosto 2025.



== Maturità


]

#insertArabicNumberedPagesSenzaData(PageTitle: "Riferimenti", documentType: doc)[
= Riferimenti

== Riferimenti normativi

== Riferimenti informativi


]


#insertArabicNumberedPagesSenzaData(PageTitle: "Organizzazione del progetto", documentType: doc)[
= Organizzazione del progetto

== Ruoli

=== Ruoli per processi primari

=== Ruoli per processi di supporto

]


#insertArabicNumberedPagesSenzaData(PageTitle: "Analisi dei rischi", documentType: doc)[
  = Analisi dei rischi
  == Identificazione dei rischi 
    Lista dei potenziali rischi.
  == Analisi dei rischi 
    Lista dei rischi ordinati per priorità, espressa in probabilità che accada e impatto sul progetto. 
  == Prevenzione e gestione dei rischi 
    Strategie atte ad evitare, minimizzare o contenere i rischi
  == Monitoraggio dei rischi 
    Modalità di monitoraggio e aggiornamento dei rischi, per garantire che l'analisi dei rischi sia efficcacie è necessario un aggiornamento periodico, ovvero un ritorno alla fase di analisi.

]

#insertArabicNumberedPagesSenzaData(PageTitle: "Suddivisione del lavoro", documentType: doc)[
  = Scomposizione del lavoro

  Scomposizione delle attività di progetto e identificazione degli input e degli output di ogni attività.
  Eventualmente separandole per "scope", processi primari, di supporto, organizzativi.
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Piano di avanzamento del progetto", documentType: doc)[
  = Piano di avanzamento del progetto


]

#insertArabicNumberedPagesSenzaData(PageTitle: "Metodi di retrospettiva", documentType: doc)[
  = Metodi di retrospettiva


]

#insertArabicNumberedPagesSenzaData(PageTitle: "Metodi di retrospettiva", documentType: doc)[
= Analisi dei periodi di avanzamento

  Per ogni periodo 
  - Preventivo
  - Consuntivo
]

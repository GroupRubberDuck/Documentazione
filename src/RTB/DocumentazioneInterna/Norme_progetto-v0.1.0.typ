#import "/src/config.typ": *
#import template_dir + "/frontPage.typ": frontPage, frontPageSenzaData
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/utilityTable.typ": getCode, utilityTable
#import template_dir + "/statusTab.typ": statusTab
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3": chart
#import "/src/RTB/DocumentazioneInterna/Glossario.typ" : dict
#set text(size: 13pt)
// #set par(justify: true)

#set text(lang: "it")
#set heading(numbering: "1.1)")
#set footnote.entry(indent: 0em)
#show ref: body => underline()[*#body*]
#show link: body => {set text(fill:blue); underline()[#body]}

#let doc="Norme di Progetto"

#frontPageSenzaData(doc)

#insertRomanNumberedPagesSenzaData(PageTitle: "Stato del documento", documentType: doc)[
  #statusTab(
    stato: "In progress",
    versione: "0.1",
    autori: ("Davide Lorenzon", "Aldo Bettega",),
    verificatori: ("",),
    uso: "Interno",
    destinatari: ("Tutto il gruppo",),
  )
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Registro modifiche", documentType: doc)[


#let header=("Versione","Data","Descrizione","Autore","Revisore","Validatore")
#let modifiche=(

  ([0.1],[2025-11-11],[Davide Lorenzon],[-],[Stesura iniziale]),
  ([0.2],[2025-11-11],[Davide Lorenzon],[-],[Aggiunta struttura dei documenti (come stabilito da verbale 2025-11-10)]),
  ([0.3],[2025-11-11],[Ana Maria Draghici],[-],[Aggiornata strutturaRE con le modifiche alla scaletta AdR]),
  
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
  In questo documento si tiene traccia e si definisce il way of working adottato dal gruppo. \

  La modalità di stesura di questo documento è incrementale, essa procede con l'avanzamento delle attività di progetto. \
  Il documento sarà soggetto ad aggiunte, modifiche o cancellazioni. \
  Esse sono causate dall'apprendimento e dalla sperimemntazione da parte del gruppo delle "Best practices"#footnote()[#dict.at("best practices")] comuni nell'ambito dell'ingegneria del software, in modo da poterle adattare alle necessità del team e del progetto. 
  == Scopo del prodotto
  Il prodotto è un’applicazione software per la verifica automatizzata della conformità alla norma EN18031, uno standard tecnico europeo per la sicurezza informatica dei dispositivi radio (Wi-Fi , LTE , BT , IoT wireless ). 

  L’obiettivo è guidare l’utente nella valutazione dei requisiti di cybersecurity  attraverso l’esecuzione automatizzata di decision tree , velocizzando e standardizzando il processo di verifica della conformità e generando la documentazione necessaria. 
  == Glossario
  Per garantire precisione terminologica senza compromettere la leggibilità, in questo documento viene adottato un approccio ibrido alla gestione dei riferimenti al Glossario.
  I termini tecnici possono essere presentati secondo 2 modalità:

  - *Footnote al primo utilizzo*: applicata ai concetti critici o potenzialmente ambigui, permette un accesso immediato alla definizione senza interrompere il flusso logico del testo.

  - *Marcatura tramite pedice “G” (termine #sub()[G])*: utilizzata per termini ricorrenti o già contestualizzati, indica semplicemente la presenza del termine nel Glossario.
  


]

#insertArabicNumberedPagesSenzaData(PageTitle: "Riferimenti", documentType: doc)[
  = Riferimenti
== Riferimenti normativi
  - #link("https://galileodiscovery.unipd.it/discovery/fulldisplay?docid=alma9938989417806046&context=L&vid=39UPD_INST:VU1&lang=it&search_scope=catalogo_no_external&adaptor=Local%20Search%20Engine&tab=Everything&query=title,contains,Software%20Engineering,AND&query=creator,contains,Ian%20Sommerville,AND&mode=advanced")[Sofware Engineering, Ian Sommerville]
  - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/PD1.pdf")[Regolamento progetto]
  - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1.pdf")[Capitolato d'appalto Automated EN18031
Compliance Verification di BlueWind]
- #link("https://www.iso.org/standard/63712.html")[Standard ISO 12207:2017]
== Riferimenti informativi
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Processi Primari", documentType: doc)[
  = Processi Primari
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Processi di Supporto", documentType: doc)[
= Processi di Supporto
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Processi Organizzativi", documentType: doc)[
= Processi Organizzativi
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Metriche e standard per la Qualità", documentType: doc)[
= Metriche e standard per la Qualità
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Metriche di Qualità del Processo", documentType: doc)[
= Metriche di Qualità del Processo
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Metriche di Qualità del Prodotto", documentType: doc)[
= Metriche di Qualità del Prodotto
]



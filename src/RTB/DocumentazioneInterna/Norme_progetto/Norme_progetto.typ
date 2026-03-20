#import "/src/config.typ": template_dir,he
#import template_dir + "/frontPage.typ": frontPage, frontPageSenzaData
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/utilityTable.typ": getCode, utilityTable
#import template_dir + "/statusTab.typ": statusTab
#import "/src/RTB/DocumentazioneInterna/Glossario.typ" : dict
#import glossario: dict
#set text(size: 13pt)
// #set par(justify: true)

#set text(lang: "it")
#set terms(separator: ": \n")
#set heading(numbering: "1.1)")
#set footnote.entry(indent: 0em)
#show ref: body => underline()[*#body*]
#show link: body => {set text(fill:blue); underline()[#body]}


// 
//Info del documento 
// 
#let currentVersion=(
  major:0,
  minor:13,
  patch:0,
)
//converte dizionario in stringa
#let versionNumber=currentVersion.values().map(n=>{str(n)}).join(".")
#metadata(versionNumber)<versionNumber>
#let doc="Norme di Progetto"

#frontPageSenzaData(doc)

#insertRomanNumberedPagesSenzaData(PageTitle: "Stato del documento", documentType: doc)[
  #statusTab(
    stato: "In progress",
    versione: versionNumber,
    autori: ("Davide Lorenzon", "Aldo Bettega", " Filippo Guerra", "Ana Maria Draghici"),
    verificatori: ("Ana Maria Draghici", "Davide Lorenzon", "Aldo Bettega", "Filippo Guerra" ),
    uso: "Interno",
    destinatari: ("Tutto il gruppo",),
  )
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Registro modifiche", documentType: doc)[


#let header=("Versione","Data","Descrizione","Autore","Revisore","Validatore")
#let modifiche=(

  ([0.1.0],[2025-11-],[Davide Lorenzon],[Ana Maria Draghici],[Stesura iniziale]),
  ([0.2.0],[2025-11-11],[Davide Lorenzon],[Ana Maria Draghici],[Aggiunta struttura dei documenti @struttura]),
  ([0.3.0],[2025-11-11],[Ana Maria Draghici],[Davide Lorenzon],[Aggiunta struttura Analisi Requisiti @requisiti]),
  ([0.4.0],[2025-11-29],[Guerra	Filippo],[Ana Maria Draghici],[Aggiunto  "ruolo-documento" @ruolo-documento]),
  ([0.5.0],[2025-11-30],[Ana Maria Draghici],[Aldo Bettega],[Aggiunto  "Definition of Done" @DOD e "Issue tracking System" @issue-tracking]),
  ([0.6.0],[2025-12-02],[Ana Maria Draghici],[Aldo Bettega],[Completata struttura documenti @struttura , aggiunto  "Configurazione" @configurazione]),
  ([0.6.1],[2025-12-02],[Davide Lorenzon],[Davide Lorenzon],[Apportate modifiche di ordine nella documentazione @documentazione]),
  ([0.7.0],[2025-12-04],[Aldo Bettega],[Davide Lorenzon],[Aggiunto scrittura commit @commit, e sezione su workflow documentale @workflow, aggiornata definition of done @DOD]),
  ([0.8.0],[2025-12-09],[Filippo Guerra],[Davide Lorenzon],[Aggiunto Processo di fornitura @fornitura]),  
  ([0.8.1],[2025-12-10],[Davide Lorenzon],[Ana Maria Draghici],[Aggiunta Rendicontazione delle ore @Rendicontazione_delle_ore ]),
  ([0.8.2],[2025-12-13],[Davide Lorenzon],[Ana Maria Draghici],[Rivista introduzione, approfondita Gestione del processo @gestione-del-processo]),
  ([0.8.3],[2025-12-14],[Davide Lorenzon],[Ana Maria Draghici],[Stesura della sezione Gestione dell'infrastruttura @gestione-infrastruttura]),
  ([0.8.4],[2025-12-15],[Davide Lorenzon],[Ana Maria Draghici],[Stesura della sezione del Processo di miglioramento @processo_miglioramento  e  processo di formazione @processo_di_formazione]),
  ([0.9.0],[2026-01-10],[Ana Maria Draghici],[Davide Lorenzon],[Rivisto processi primari @primari, sottosezioni @fornitura e @sviluppo_primario]),
  ([0.10.0],[2026-01-10],[Ana Maria Draghici],[Davide Lorenzon],[Rivisto processi supporto @supporto, aggiunte sottosezioni @qualità e @qualifica]),
  ([0.11.0],[2026-01-14],[Ana Maria Draghici],[Davide Lorenzon],[Completata prima scrittura Norme di Progetto]),
  ([0.12.0],[2026-02-05],[Davide Lorenzon],[Filippo Guerra],[Aggiunte descrizioni delle metriche di qualità]),
  ([0.13.0],[2026-03-20],[Ana Maria Draghici],[Felician Mario Necsulescu],[Aggiunta alla @qualifica la descrizione delle varie strategie di testing (Processo di Qualifica)]),
)
#registroModifiche(modifiche)

]

#insertRomanNumberedPagesSenzaData(PageTitle: "Indice", documentType: doc)[
  #outline(title: "Indice")
]
#context counter(page).update(1)
#insertArabicNumberedPagesSenzaData(PageTitle: "Introduzione", documentType: doc)[
  = Introduzione
#include "content/01-introduzione/introduzione.typ"

  


]


#insertArabicNumberedPagesSenzaData(PageTitle: "Processi Primari", documentType: doc)[
  = *Processi Primari*
  #include "content/02-processi_primari/index.typ"
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Processi di Supporto", documentType: doc)[
= *Processi di Supporto*

#include "content/03-processi_supporto/index.typ"


]
#insertArabicNumberedPagesSenzaData(PageTitle: "Processi organizzativi", documentType: doc)[
= *Processi Organizzativi*

#include "content/04-processi_organizzativi/index.typ"


]

#insertArabicNumberedPagesSenzaData(PageTitle: "Metriche di Progetto", documentType: doc)[
= *Metriche*

#include "content/05-metriche/index.typ"


]






#import "/src/config.typ": *
#import template_dir + "/frontPage.typ": frontPageSenzaData
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/statusTab.typ": statusTab
#import template_dir + "/utilityTable.typ": getCode, utilityTable
#import template_dir + "/PdP/tabellaRischi.typ": tabellaRischiTecnologici
#import template_dir + "/PdP/tabellaAtt.typ": tabellaAtt
#import template_dir + "/PdQ/tabellaMetriche.typ": tabellaMetriche
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
#let doc = "Piano di qualifica"

#let currentVersion=(
  major:0,
  minor:1,
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
    autori: ("Felician Mario Necsulescu",),
    verificatori: ("Davide Testolin",),
    uso: "Esterno",
    destinatari: ("Prof. Tullio Vardanega", "Prof. Riccardo Cardin", "BlueWind srl"),
  )
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Registro modifiche", documentType: doc)[


  #let header = ("Versione", "Data", "Descrizione", "Autore", "Revisore", "Validatore")
  #let modifiche = ( 
    ([0.0.1], [2025-12-15], [Felician Mario Necsulescu ], [Davide Testolin], [Creazione del documento e stesura iniziale.]),    
    ([0.1.0], [2025-12-18], [Felician Mario Necsulescu], [Davide Testolin], [Completamento sezione Introduzione @introduzione, Qualità del processo @processo, Qualità del prodotto @prodotto.]),    
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
  = Introduzione <introduzione>
  #include "content/01-introduzione/index.typ"


  
]#insertArabicNumberedPagesSenzaData(PageTitle: "Qualità di processo", documentType: doc)[
  = Qualità di processo <processo>

#include "content/02-qualita_processo/index.typ"

]

#insertArabicNumberedPagesSenzaData(PageTitle: "Qualità di prodotto", documentType: doc)[

= Qualità di prodotto <prodotto>
#include "content/03-qualita_prodotto/index.typ"


]

#insertArabicNumberedPagesSenzaData(PageTitle: "Strategie di testing", documentType: doc)[
= Strategie di testing
#include "content/04-strategie_testing/index.typ"




]






#insertArabicNumberedPagesSenzaData(PageTitle: "Cruscotto di valutazione", documentType: doc)[
= Cruscotto di valutazione
#include "content/05-cruscotto_valutazione/index.typ"

]
#insertArabicNumberedPagesSenzaData(PageTitle: "Appendice", documentType: doc)[

#he(body: "Appendice")
#set heading(numbering: "1.A.1)")
#include "content/appendice/index.typ"



]
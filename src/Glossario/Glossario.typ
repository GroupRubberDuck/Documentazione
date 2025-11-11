#import "/src/config.typ": *
#import template_dir + "/frontPage.typ":  frontPageSenzaData
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/statusTab.typ": statusTab

#set heading(numbering: "1.1)")
#show ref: body => underline()[*#body*]

#let doc="Glossario"
#let dict=(
  Requisiti:[
    - Lato bisogno, capacità necessaria all'utente per raggiungere un obiettivo.
    - Lato soluzione, la capacità necessaria a un sistema per rispondere a un'aspettativa, l'analisi dei requisiti si concentra su questo.] ,

  End-user:[Utilizzatore finale del prodotto software.],

  Verifica:[Accertare che lo svolgimento delle attività di sviluppo non introduca errori],

  Validazione:[Accertare che il prodotto finale corrisponda alle attese],
  
  "Piano di qualifica":[Dire come verranno svolte le attività di verifica e validazione e con quali obiettivi di qualità]
)
#frontPageSenzaData(doc)

#insertRomanNumberedPagesSenzaData(PageTitle: "Stato del documento", documentType: doc)[
  #statusTab(
    stato: "In review",
    versione: "1.1",
    autori: ("Davide Lorenzon, Aldo Bettega",),
    revisori:("-",),
    validatori: ("-",),
    uso: "Interno",
    destinatari: ("Esterni ed interni",),
  )
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Registro modifiche", documentType: doc)[


#let header=("Versione","Data","Descrizione","Autore","Revisore","Validatore")
#let modifiche=(

  ([1.0],[2025-11-09],[Stesura iniziale],[Davide Lorenzon],[-],[-]),
  
)
#registroModifiche(modifiche)
// #utilityTable(modifiche,header:header,columns:(auto,auto,2fr,1fr,1fr,1.1fr))


]

#insertRomanNumberedPagesSenzaData(PageTitle: "Indice", documentType: doc)[
  #outline(title: "Indice", depth:2)
]
#context counter(page).update(1)
#insertArabicNumberedPagesSenzaData(PageTitle: "Introduzione", documentType: doc)[
  = Introduzione
  In questo documento vengono raccolti e analizzati tutti i termini rilevantio per le attività di progetto 

== Cosa è cambiato
Qui vengono esposte le principali modifiche, aggiunte e rimozioni al documento. 
Allo stato attuale tale sezione è vuota, in quanto il documento si trova alla prima versione.

]

// #insertArabicNumberedPagesSenzaData(PageTitle: "Scopo", documentType: doc)[
//   == Area di competenze del glossario:

//   Per una migliore consutabilità è stato ritenuto opportuno differenziare il glossario in sottosezioni divise per ambiti:
//   - *Glossario interno*,in questa sezione si analizzano i termini di interesse per il gruppo al fine di comprendere al meglio cosa esprimono i termini.
//   - *Glossario tecnico*, in questa sezione vengono analizzati i termini tecnici ricorrenti all'interno delle attività di progetto, utile alla comunicazione con gli esterni.
//   - *Glossario per l'end user*, in questa sezione vengono spiegati i termini di interesse all'end-user.
// ]

#insertArabicNumberedPagesSenzaData(PageTitle: "Glossario", documentType: doc)[
  // #enum(
  //   [Requisiti: \
  //   - Lato bisogno, capacità necessaria all'utente per raggiungere un obiettivo.
  //   - Lato soluzione, la capacità necessaria a un sistema per rispondere a un'aspettativa, l'analisi dei requisiti si concentra su questo.
  //   ],
  //   [End-user: \ Utilizzatore finale del prodotto software.],
  //   [Verifica: \ 
  //   Accertare che lo svolgimento delle attività di sviluppo non introduca errori.],
  //   [Validazione: \ Accertare che il prodotto finale corrisponda alle attese],
  //   [Piano di qualifica: \ 
  //   Dire come verranno svolte le attività di verifica e validazione e con quali obiettivi di qualità],
  //   [],
  //   [],
  // )
#let lettera=""


#for chiave in dict.keys().sorted(){
  if lettera==none or lettera!=chiave.first() {
    lettera=chiave.first()
    pagebreak()
    [== #lettera]
  }
  [
    === #chiave \
    #dict.at(chiave) 
  ]
}



]

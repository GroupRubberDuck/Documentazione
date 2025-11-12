#import "/src/config.typ": *
#import template_dir + "/frontPage.typ":  frontPageSenzaData
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/statusTab.typ": statusTab

#set heading(numbering: "1.1)")
#show ref: body => underline()[*#body*]

// Glossario di riferimento
// LINEE GUIDA PER AGGIUNGERE TERMINI
// Inserite il termine di cui volete dare una definizione come CHIAVE
// e la definizione come il rispettivo VALUE in formato stringa 
// 
// ESEMPIO:
//    | 
//    | 
//    |
//   
//    CHIAVE:[VALUE],
//    
//    |
//    |
//    |
  
//   
// 
// 
#let doc="Glossario"
#let dict=(
  Requisiti:[
    - Lato bisogno, capacità necessaria all'utente per raggiungere un obiettivo.
    - Lato soluzione, la capacità necessaria a un sistema per rispondere a un'aspettativa, l'analisi dei requisiti si concentra su questo.] ,

  End-user:[Utilizzatore finale del prodotto software.],

  Verifica:[Accertare che lo svolgimento delle attività di sviluppo non introduca errori],

  Validazione:[Accertare che il prodotto finale corrisponda alle attese],
  
  "Piano di qualifica":[Dire come verranno svolte le attività di verifica e validazione e con quali obiettivi di qualità],
)




#frontPageSenzaData(doc)

#insertRomanNumberedPagesSenzaData(PageTitle: "Stato del documento", documentType: doc)[
  #statusTab(
    stato: "In progress",
    versione: "0.1",
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

  ([0.1],[2025-11-09],[Stesura iniziale],[Davide Lorenzon],[-],[-]),
  
)
#registroModifiche(modifiche)
// #utilityTable(modifiche,header:header,columns:(auto,auto,2fr,1fr,1fr,1.1fr))


]

#insertRomanNumberedPagesSenzaData(PageTitle: "Indice", documentType: doc)[
  #outline(title: "Indice", depth:1)
]
#context counter(page).update(1)
#insertArabicNumberedPagesSenzaData(PageTitle: "Introduzione", documentType: doc)[
  = Introduzione
  In questo documento vengono raccolti e analizzati tutti i termini rilevantio per le attività di progetto relative al capitolato #inserisciLink(url:"https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1.pdf")[C9]



]


#let lettera=""
#let chiavi=dict.keys().sorted().rev()

#while(chiavi.len()>0) {
lettera=chiavi.last().first()
let tempKey=""

insertArabicNumberedPagesSenzaData(PageTitle:upper(lettera) , documentType: doc)[
= #lettera

#while(chiavi.len() >0 and lettera==chiavi.last().first()){
  tempKey=chiavi.pop() 
  [
    == #tempKey #label(tempKey)
    #dict.at(tempKey)


  ]
}



]

}


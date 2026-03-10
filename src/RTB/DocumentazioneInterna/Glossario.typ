#import "/src/config.typ": *
#import template_dir + "/frontPage.typ":  frontPageSenzaData
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/statusTab.typ": statusTab
#import glossario:dict
#import glossario:abbr
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

#type(abbr)
#let refTerm(term: str) = { 
  if dict.has(term) {
    footnote(term, dict.at(term))
  } else {
    term
  }
}

#frontPageSenzaData(doc)

#insertRomanNumberedPagesSenzaData(PageTitle: "Stato del documento", documentType: doc)[
  #statusTab(
    stato: "In progress",
    versione: "0.5",
    autori: ("Davide Lorenzon, Ana Maria Draghici, Filippo Guerra",),
    verificatori: ("-",),
    uso: "Interno",
    destinatari: ("Esterni ed interni",),
  )
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Registro modifiche", documentType: doc)[


#let header=("Versione","Data","Descrizione","Autore","Revisore","Validatore")
#let modifiche=(

  ([0.1],[2025-11-09],[Davide Lorenzon],[Ana Maria Draghici],[Stesura iniziale e scripting per l'ordinamento]),
  ([0.2],[2025-11-15],[Ana Maria Draghici],[Ana Maria Draghici],[Aggiunti i termini: Attore, Caso d’uso, Scenario principale, Scenario secondario, Ciclo di vita del progetto, Conformità, Valutazione di conformità, Protezione della rete, Protezione dei dati personali, Prevenzione delle frodi (EN 18031), RED (2014/53/UE),Automated EN18031 Compliance Verification, cybersecurity, report,applicazione desktop, soluzione web-based, UML]),
  ([0.3],[2025-11-16],[Ana Maria Draghici],[Ana Maria Draghici],[Aggiunti i termini: Decision tree, Dashboard,CSV, XML, JSON, PDF, Dispositivo radio, Importazione, Interfaccia, Norma armonizzata, Pass, Fail, Not Applicable (N.A.),  Requisito funzionale, Requisito non funzionale, Stakeholder, Manutenzione, Editor grafico, Wi-Fi, LTE, BT, IoT.]),
  ([0.4],[2025-12-16],[Filippo Guerra],[Ana Maria Draghici],[Aggiornamento del glossario con tutti i termini di dominio presenti nei documenti del progetto forniti dall’azienda BlueWind. Aggiunta della sezione Abbreviazioni all'interno del documento.]),
  ([0.5],[2026-02-26],[Ana Maria Draghici],[-],[Aggiornamento del glossario con nuovi termini e abbreviazioni]),
  
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
In questo documento vengono raccolti e definiti i termini chiave utilizzati nelle attività di progetto, per garantire chiarezza e coerenza tra i membri del team e tra soggetti esterni coinvolti, come revisori, stakeholder o utenti finali.  
Lo scopo del glossario è fornire un riferimento unico per abbreviazioni, concetti tecnici e termini normativi utilizzati durante lo sviluppo del progetto, facilitando comunicazione, collaborazione e documentazione.

Per approfondimenti e riferimenti al capitolato e ad altri documenti di progetto, consultare:
- Capitolo del capitolato: #inserisciLink(url:"https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1.pdf")[C1]  
- Documentazione tecnica aggiuntiva: #inserisciLink(url:"https://github.com/GroupRubberDuck/Documentazione")[Repo Progetto]




]

#insertArabicNumberedPagesSenzaData(PageTitle: "Abbreviazioni", documentType: doc)[
= Abbreviazioni
Qui sotto si riportano le sigle e abbreviazioni che sono state utilizzate nei documenti di progetto.\

#block(
  inset: (left: 1cm)
)[


#let lettera=""

#let chiavi=abbr.keys().sorted(key:item=>{
lower(item.first())
}).rev()

#while(chiavi.len()>0) {
lettera=chiavi.last().first()
let tempKey=""

while(chiavi.len() >0 and lower(lettera)==lower(chiavi.last().first())){
  tempKey=chiavi.pop() 
  [
  * #{ upper(tempKey.first())+tempKey.slice(1) } #label(tempKey) *  -->  
    #abbr.at(tempKey)


  ]
}
}

]

]


#let lettera=""

#let chiavi=dict.keys().sorted(key:item=>{
lower(item.first())
}).rev()

#while(chiavi.len()>0) {
lettera=chiavi.last().first()
let tempKey=""

insertArabicNumberedPagesSenzaData(PageTitle:upper(lettera) , documentType: doc)[
= #lettera

#while(chiavi.len() >0 and lower(lettera)==lower(chiavi.last().first())){
  tempKey=chiavi.pop() 
  [
   == #{ upper(tempKey.first())+tempKey.slice(1) } #label(tempKey)
    #dict.at(tempKey)


  ]
}



]

}


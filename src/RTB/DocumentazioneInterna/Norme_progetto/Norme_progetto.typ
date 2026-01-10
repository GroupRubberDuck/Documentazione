#import "/src/config.typ": template_dir,he
#import template_dir + "/frontPage.typ": frontPage, frontPageSenzaData
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/utilityTable.typ": getCode, utilityTable
#import template_dir + "/statusTab.typ": statusTab
#import "/src/RTB/DocumentazioneInterna/Glossario.typ" : dict
#set text(size: 13pt)
// #set par(justify: true)

#set text(lang: "it")
#set heading(numbering: "1.1)")
#set footnote.entry(indent: 0em)
#show ref: body => underline()[*#body*]
#show link: body => {set text(fill:blue); underline()[#body]}


// 
//Info del documento 
// 
#let currentVersion=(
  major:0,
  minor:9,
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
    autori: ("Davide Lorenzon", "Aldo Bettega", "Guerra Filippo", "Ana Maria Draghici"),
    verificatori: ("Ana Maria Draghici", "Davide Lorenzon", "Aldo Bettega" ),
    uso: "Interno",
    destinatari: ("Tutto il gruppo",),
  )
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Registro modifiche", documentType: doc)[


#let header=("Versione","Data","Descrizione","Autore","Revisore","Validatore")
#let modifiche=(

  ([0.1.0],[2025-11-],[Davide Lorenzon],[Ana Maria Draghici],[Stesura iniziale]),
  ([0.2.0],[2025-11-11],[Davide Lorenzon],[Ana Maria Draghici],[Aggiunta struttura dei documenti (come stabilito da verbale 2025-11-10)]),
  ([0.3.0],[2025-11-11],[Ana Maria Draghici],[Davide Lorenzon],[Aggiunta sezione 4.8.1 struttura Analisi Requisiti ]),
  ([0.4.0],[2025-11-29],[Guerra	Filippo],[Ana Maria Draghici],[Aggiunta sezione 5.2 "ruolo-documento"]),
  ([0.5.0],[2025-11-30],[Ana Maria Draghici],[Aldo Bettega],[Aggiunta sezione 5.3 e 5.4, rispettivamente  "Definition of Done" e "Issue tracking System"]),
  ([0.6.0],[2025-12-02],[Ana Maria Draghici],[Aldo Bettega],[Aggiunta sezione 4.8 "struttura specifica dei documenti" e relative sottosezioni, aggiunto sezione 5.4.3 "Versionamento"]),
  ([0.6.1],[2025-12-02],[Davide Lorenzon],[Davide Lorenzon],[Apportate modifiche di ordine nella sottosezione documentazione]),
  ([0.7.0],[2025-12-04],[Aldo Bettega],[Davide Lorenzon],[Aggiunta sezione 4.1.2 e sezione 9. aggiornata 5.3 definition of done]),
  ([0.8.0],[2025-12-09],[Filippo Guerra],[Davide Lorenzon],[Aggiunta sezione 2.2: Processo di fornitura]),  
  ([0.8.1],[2025-12-10],[Davide Lorenzon],[Ana Maria Draghici],[Aggiunta: \ @Rendicontazione_delle_ore  \ Rendicontazione delle ore ]),
  ([0.8.2],[2025-12-13],[Davide Lorenzon],[-],[Rivista introduzione, approfondita @gestione-del-processo , gestione del processo]),
  ([0.8.3],[2025-12-14],[Davide Lorenzon],[-],[Stesura della sezione #ref(label("gestione-dell'infrastruttura")), \ Gestione dell'infrastruttura]),
  ([0.8.4],[2025-12-15],[Davide Lorenzon],[-],[Stesura della sezione #ref(label("processo-di-miglioramento")), \ Processo di miglioramento e  #ref(label("processo-di-formazione")), processo di formazione]),
  ([0.9.0],[2026-01-10],[Ana Maria Draghici],[-],[Rivisto processi primari @primari, sottosezione @fornitura e @sviluppo_primario]),
  
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
  = Processi Primari
  #include "content/02-processi_primari/index.typ"
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Processi di Supporto", documentType: doc)[
= Processi di Supporto

#include "content/03-processi_supporto/index.typ"


]





#insertArabicNumberedPagesSenzaData(PageTitle: "Processi Organizzativi", documentType: doc)[
#he(body:"Processi Organizzativi")
#include "content/04-processi_organizzativi/index.typ"
]
#insertArabicNumberedPagesSenzaData(PageTitle: "Metriche e standard per la Qualità", documentType: doc)[
= Metriche e standard per la Qualità
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Metriche di Qualità del Processo", documentType: doc)[
#he(body:"Metriche di Qualità del Processo")
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Metriche di Qualità del Prodotto", documentType: doc)[
= Metriche di Qualità del Prodotto
]



#insertArabicNumberedPagesSenzaData(PageTitle: "Best Practices", documentType: doc)[
= Best Practices
In questa sezione vengono riportate le best practices e pratiche standard concordate col gruppo al fine di garantire coerenza all'interno dei documenti.

== Formato nome dei verbali
Al fine di avere ordine estetico all'interno della repo, è stato deciso di adottare il seguente standard per la nomina dei verbali.
Di questi documenti interessa data e versione, dunque saranno nel formato: \
YYYY-MM-DD_Verbale-vX.Y.Z.typ

== Scrittura dei commit
#link("https://medium.com/@iambonitheuri/the-art-of-writing-meaningful-git-commit-messages-a56887a4cb49")[The-art-of-writing-meaningful-git-commit-messages-fonte] \ // cambia il link
I commit dovrebbero avere un tipo ed una descrizione: il tipo indica qual è l'obbiettivo del commit, mentre la descrizione aiuta il lettore a comprendere meglio quali cambiamenti sono stati effettua. \ 
Le regole generali sono:
- iniziare il commit con tipo seguito da ":" .
- lasciare uno spazio tra tipo e descrizione.
- iniziare la descrizione con una lettera maiuscola.
- limitare la descrizione a massimo 50 caratteri.
- indicare alla fine del commit la issue a cui ci si sta riferendo con: #block(
  fill: rgb("#f9f9f9"), // Colore di sfondo (grigio chiaro)
  stroke: 1pt + black, // Bordo nero da 1 punto
  inset: 10pt          
)[`git commit -m "Commento.Issue #01"`]

Nel caso sia necessario modificare un commit (ad esempio in caso di errori) si utilizza il seguente comando #block(
  fill: rgb("#f9f9f9"), // Colore di sfondo (grigio chiaro)
  stroke: 1pt + black, // Bordo nero da 1 punto
  inset: 10pt          // Padding interno di 10 punti
)[`git commit --amend`]
N.B. :  #upper("è") consigliato l'utilizzo del comando per modificare commit in locale prima di fare push nella repository condivisa. #upper("è") preferibile astenersi dal modificare commit che sono già stati resi pubblici.

== Issue Template
]
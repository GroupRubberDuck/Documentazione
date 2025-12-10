#import "/src/config.typ": template_dir
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
  minor:8,
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
  ([0.8.0],[2025-12-09],[Filippo Guerra],[Davide Lorenzon],[Aggiunta sezione 3.1]),


  
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
// da definire bene meglio una volta che effettivamente viene usato per bene
  


]

#insertArabicNumberedPagesSenzaData(PageTitle: "Riferimenti", documentType: doc)[
  = Riferimenti
== Riferimenti normativi
  - #link("https://galileodiscovery.unipd.it/discovery/fulldisplay?docid=alma9938989417806046&context=L&vid=39UPD_INST:VU1&lang=it&search_scope=catalogo_no_external&adaptor=Local%20Search%20Engine&tab=Everything&query=title,contains,Software%20Engineering,AND&query=creator,contains,Ian%20Sommerville,AND&mode=advanced")[Software Engineering, Ian Sommerville]
  - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/PD1.pdf")[Regolamento progetto]
  - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1.pdf")[Capitolato d'appalto Automated EN18031
Compliance Verification di BlueWind]
- #link("https://www.iso.org/standard/63712.html")[Standard ISO 12207:2017]
== Riferimenti informativi

- #link("https://docs.github.com/en/issues/tracking-your-work-with-issues/using-issues/managing-issue-types-in-an-organization") 
- #link("https://www.agileway.it/definition-of-done-dod-cose-cosa-serve/")
- #link("https://www.atlassian.com/agile/project-management/definition-of-done")




]

#insertArabicNumberedPagesSenzaData(PageTitle: "Processi Primari", documentType: doc)[
  = Processi Primari
  #include "content/03-processi_primari/index.typ"
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Processi di Supporto", documentType: doc)[
= Processi di Supporto

#include "content/04-processi_supporto/index.typ"


]





#insertArabicNumberedPagesSenzaData(PageTitle: "Processi Organizzativi", documentType: doc)[
= Processi Organizzativi
#include "content/05-processi_organizzativi/index.typ"
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



#insertArabicNumberedPagesSenzaData(PageTitle: "Best Practices", documentType: doc)[
= Best Practices
In questa sezione vengono riportate le best practices e pratiche standard concordate col gruppo al fine di garantire coerenza all'interno dei documenti.

== Formato nome dei verbali
Al fine di avere ordine estetico all'interno della repo, è stato deciso di adottare il seguente standard per la nomina dei verbali.
Di questi documenti interessa data e versione, dunque saranno nel formato: \
YYYY-MM-DD_Verbale-vX.Y.Z.typ

== Scrittura dei commit
#link("https://medium.com/@iambonitheuri/the-art-of-writing-meaningful-git-commit-messages-a56887a4cb49")[fonte interessante] \ // cambia il link
I commit dovrebbero avere un tipo ed una descrizione: il tipo indica qual è l'obbiettivo del commit, mentre la descrizione aiuta il lettore a comprendere meglio quali cambiamenti sono stati effettua. \ 
Le regole generali sono:
- iniziare il commit con tipo seguito da ":" .
- lasciare uno spazio tra tipo e descrizione.
- iniziare la descrizione con una lettera maiuscola.
- limitare la descrizione a massimo 50 caratteri.
- indicare alla fine del commit la issue a cui ci si sta riferendo con: #block(
  fill: rgb("#f9f9f9"), // Colore di sfondo (grigio chiaro)
  stroke: 1pt + black, // Bordo nero da 1 punto
  inset: 10pt          // Padding interno di 10 punti
)[`git commit -m "Commento.Issue #01"`]

Nel caso sia necessario modificare un commit (ad esempio in caso di errori) si utilizza il seguente comando #block(
  fill: rgb("#f9f9f9"), // Colore di sfondo (grigio chiaro)
  stroke: 1pt + black, // Bordo nero da 1 punto
  inset: 10pt          // Padding interno di 10 punti
)[`git commit --amend`]
N.B. :  #upper("è") consigliato l'utilizzo del comando per modificare commit in locale prima di fare push nella repository condivisa. #upper("è") preferibile astenersi dal modificare commit che sono già stati resi pubblici.

== Issue Template
]
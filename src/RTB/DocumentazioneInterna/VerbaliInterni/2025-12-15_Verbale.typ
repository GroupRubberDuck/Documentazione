#set text(lang: "IT")

#import "/src/config.typ": *
#import template_dir + "/frontPage.typ": frontPage
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/statusTab.typ": statusTab
#import template_dir + "/utilityTable.typ": getCode, utilityTable

#show link: body => {set text(fill:blue); underline()[#body]}
#show ref: body => { underline()[#strong(body)]}

#set text(size: 12pt)
#set heading(numbering: "1.1)")
#show heading.where(level: 1): set text(size: 18pt)
#show heading.where(level: 2): set text(size: 16pt)


// 
//Info del documento 
// 
#let currentVersion=(
  major:0,
  minor:0,
  patch:0,
)
//converte dizionario in stringa
#let versionNumber=currentVersion.values().map(n=>{str(n)}).join(".")
#metadata(versionNumber)<versionNumber>

#let giornoRiunione = datetime(year: 2025, month: 12, day:15)
#let doctype="Verbale interno"
#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages( "Stato del documento", doctype,giornoRiunione)[
  #statusTab(
    stato: "In lavorazione",
    versione: "0.0.1",
    autori: ("",),
    verificatori: ("",),
    uso: "Interno",
    destinatari: ("Tutto il gruppo",),
  )
]
#insertRomanNumberedPages("Registro Modifiche",doctype,giornoRiunione )[


  #let modifiche=(


      )

      #registroModifiche(modifiche)




]

#insertRomanNumberedPages("Indice","Verbale interno",giornoRiunione )[
#outline( depth: 2,title: "Indice")
]

#pagebreak()
  #context counter(page).update(1)


#insertArabicNumberedPages("Informazioni generali","Verbale interno",giornoRiunione )[
  = Informazioni generali
- *Tipo di riunione*: Interno
- *Motivazione*: Riunione fine sprint;
- *Data*: #giornoRiunione.display()
- *Luogo*: Riunione su Discord
- *Ora inizio*: 15:00;
- *Ora fine*: 18:50
- *Scriba*: Filippo Guerra
- *Partecipanti*:#align(left)[
#set list(marker: [--])
- Filippo Guerra
- Davide Lorenzon
- Ana Maria Draghici
- Felician Mario Necsulescu  
- Aldo Bettega
- Davide Testolin
\
]
]


#insertArabicNumberedPages("Ordine del giorno","Verbale interno",giornoRiunione )[
  = Ordine del giorno
  - Retrospettiva;
  - Gestione oraria;
  - Allineamento per riunione con la proponente.

]

#insertArabicNumberedPages("Riassunto della riunione","Verbale interno",giornoRiunione )[
  = Riassunto della riunione

]


#insertArabicNumberedPages("Decisioni","Verbale interno",giornoRiunione )[
= Decisioni 
#let contatoreDecisioni= counter("decisioni")
#contatoreDecisioni.update(1)
#let prefisso="VI.10."

#let decisioni=(
(
  // sentiti libero di snellire le decisioni, le ho scritte lunghe perché manca il riassunto della riunione, almeno così c'è un po' di contesto
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Stabilite delle misure per gestire gli impegni personali.],
  [Negli sprint precedenti è emerso che le disponibilità dichiarate per gli sprint di alcuni membri del team non erano corrette.],
  []
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Raccogliere e condividere indicatori di qualità potenzialmente utili.],
  [A seguito del task TD.11.15 è stata decisa l'utilità di raccogliere e inserire nel PdQ alcune metriche di qualità.],
  [#underline(strong("TD.11.15"))]
),
)

#utilityTable(decisioni,header:("Codice","Descrizione","Motivazioni","Ref."),columns:(auto,2fr,2fr,auto))

]


#insertArabicNumberedPages("TODO","Verbale interno",giornoRiunione )[

= TODO

#let prefisso="TD.12."
#let contatoreTodo= counter("todo")
#contatoreTodo.update(1)
I TODO sorti da questa riunione sono i seguenti:

  //stessa cosa anche sui TODO sentiti libero di snellire le decisioni, le ho scritte lunghe perché manca il riassunto della riunione, almeno così c'è un po' di contesto
#let TODO=(

(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [-],
  [Aggiornamento analisi dei rischi.],
  [VI.10.1],
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [-],
  [Inizio stesura piano di qualifica.],
  [],
),

  )
#utilityTable(TODO,header: ("Codice","Assegnatari","Task","Decisione di riferimento"),columns: (auto,auto,1fr,auto),)


]
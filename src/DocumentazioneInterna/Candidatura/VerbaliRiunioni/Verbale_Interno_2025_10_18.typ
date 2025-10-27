#import "/src/config.typ": *
#import template_dir+"/frontPage.typ": frontPage
#import template_dir+"/setUpPageLayout.typ": insertRomanNumberedPages, insertArabicNumberedPages
#import template_dir+"/registroModifiche.typ":registroModifiche
#import template_dir+"/utilityTable.typ":utilityTable, getCode
#set text(font: font_da_usare , size: 13pt)
#let giornoRiunione = datetime(year: 2025,
                                month: 10,
                                day:18)

// Call the function
#frontPage([Verbale riunione],giornoRiunione)


//typst compile --root . ./src/DocumentazioneInterna/Candidatura/VerbaliRiunioni/Verbale_Interno_2025_10_18.typ

// #set page(
//   paper: "us-letter",
//   header: place(
//     horizon
//   )[
//     #box(width: 100%)[
//           #place(left)[*Indice*]
//     #place(right)[*RubberDuck*]
//     ]
//  #line( length: 100%)
// ],
//   footer:align(top,[
//  #line( length: 100%)
//     #box(width:100%)[
//      #place(horizon + left)[Verbale interno]
//     #place(horizon + right)[#giornoRiunione.display()]     
//     ]

    
//     #align(center)[#context counter(page).display()]
    
//   ]),
//   numbering: "i",

// )

#insertRomanNumberedPages("Registro Modifiche","Verbale interno",giornoRiunione )[
#registroModifiche((
  ([0.1],[],[],[],[]),
))
]

#insertRomanNumberedPages("Indice","Verbale interno",giornoRiunione )[
#outline( depth: 2,title: "Indice")
]





#pagebreak()
  #context counter(page).update(1)

#insertArabicNumberedPages("Informazioni generali","Verbale interno",giornoRiunione )[
  = Informazioni generali
- *Tipo di riunione* : Interno
- *data*: #giornoRiunione.display()
- *luogo*: Riunione siu Discord
- *Ora inizio*: 20:00
- *Ora fine*: 21:30
- *Portavoce*: 
- *Scriba*: Davide Lorenzon
- *Partecipanti*:#align(left)[
#set list(marker: [--])
- Davide Lorenzon
- Ana Maria Draghici
- Felician Mario Necsulescu
- Davide Testolin
- Filippo Guerra
- Aldo Bettega

]
]
#insertArabicNumberedPages("Ordine del giorno","Verbale interno",giornoRiunione )[
= Ordine del giorno

#align()[
    #set text(weight: "bold")
#list(marker: [‣])[Scelta dei capitolati][Scelta del way of working][Struttura dei documenti][Brainstorming sui TODO]
  
]
]
#insertArabicNumberedPages("Riassunto della riunione ","Verbale interno",giornoRiunione )[
= Riassunto della riunione 
Gli argomenti di discussione sono stati:
- L'interesse dei vari membri del gruppo per i capitolati e della loro fattibilità
- Le disponilità dei vari membri del gruppo
- Aspetti organizzativi
- I prossimi temi di discussione
]
#insertArabicNumberedPages("Decisioni","Verbale interno",giornoRiunione )[
= Decisioni
#let contatoreDecisioni= counter("decisioni")
#contatoreDecisioni.update(1)

#let decisioni=(
  ([#getCode(prefisso:"VI.1.",contatore:contatoreDecisioni)],[],[- Scelta dei capitolati
 + *C7*: Sistema di acquisizione dati da sensori, M31
 + *C1*: Automated EN18031 Compliance Verification, BlueWind
 + *C8*: Smart Order, Ergon]),
  ([#getCode(prefisso:"VI.1.",contatore:contatoreDecisioni)],[],[Scelta del way of working: *SCRUM*]),
  ([#getCode(prefisso:"VI.1.",contatore:contatoreDecisioni)],[],[Creazione della #link("https://github.com/GroupRubberDuck")[ #text(fill: blue )[#underline[Github Organization]] del gruppo]]),
  ([#getCode(prefisso:"VI.1.",contatore:contatoreDecisioni)],[],[Definizione della struttura base del verbale]))

#utilityTable(decisioni,col1:"Codice",col2:"Riferimenti",col3:"Descrizione")

]
#insertArabicNumberedPages("TODO","Verbale interno",giornoRiunione )[

= TODO
#let contatoreTodo= counter("todo")
#contatoreTodo.update(1)
I punti da approfondire nelle prossime riunioni o in vista di esse individuati durante la riunione sono stati i seguenti:
#let TODO=(
  ([#getCode(prefisso:"TD.1.",contatore:contatoreTodo)],[Tutti],[Comprendere al meglio i capitolati, stilare la lista delle domande da porre alle aziende]),
  ([#getCode(prefisso:"TD.1.",contatore:contatoreTodo)],[Tutti],[Entrare in contatto con le imprese]),
  ([#getCode(prefisso:"TD.1.",contatore:contatoreTodo)],[Tutti],[lavorare sulla struttura dei documenti]))
#utilityTable(TODO,col1:"Codice",col2:"Assegnatari",col3:"Task")

]



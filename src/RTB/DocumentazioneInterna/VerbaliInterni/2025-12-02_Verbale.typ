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
  major:1,
  minor:0,
  patch:0,
)
//converte dizionario in stringa
#let versionNumber=currentVersion.values().map(n=>{str(n)}).join(".")
#metadata(versionNumber)<versionNumber>
#let giornoRiunione = datetime(year: 2025, month: 12, day:02)
#let doctype="Verbale interno"
#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages( "Stato del documento", doctype,giornoRiunione)[
  #statusTab(
    stato: "In Verifica",
    versione: versionNumber,
    autori: ("Filippo Guerra",),
    verificatori: ("Aldo Bettega",),
    uso: "Interno",
    destinatari: ("Tutto il gruppo",),
  )
]
#insertRomanNumberedPages("Registro Modifiche",doctype,giornoRiunione )[


  #let modifiche=(

    ([0.1.0],[#giornoRiunione.display()],[Filippo Guerra],[Aldo Bettega],[Stesura del verbale]),

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
- *Motivazione*: Riunione post incontro con la proponente
- *Data*: #giornoRiunione.display()
- *Luogo*: Riunione su Discord
- *Ora inizio*: 17:30
- *Ora fine*: 18:50
- *Scriba*: Filippo Guerra
- *Partecipanti*:#align(left)[
#set list(marker: [--])
- Filippo Guerra
- Davide Lorenzon
- Ana Maria Draghici
- Felician Mario Necsulescu  \
]
]


#insertArabicNumberedPages("Ordine del giorno","Verbale interno",giornoRiunione )[
  = Ordine del giorno
  - Revisione delle attività pendenti
   -Discussione su casi d’uso e modifiche post-incontro con l’azienda
  - Organizzazione della documentazione (Norme di Progetto, Use Case, struttura dei file)
  - Considerazioni sul Piano di Qualifica

]

#insertArabicNumberedPages("Riassunto della riunione","Verbale interno",giornoRiunione )[
  = Riassunto della riunione
La riunione è iniziata con un breve confronto sull’incontro con BlueWind. \
Gli altri argomenti di discussione  riguardano l'ambito organizzativo. \
È stata confermata la necessità di anticipare una riunione interna prima del prossimo incontro con l’azienda, così da poter effettuare una revisione congiunta dei casi d’uso. \
Revisione del sito web.

  
  == Discussione sui Casi d'Uso <uc>
  Durante la conversazione sono state evidenziate numerose necessità operative:
  - Aggiornare gli use case alla luce delle informazioni ottenute dall’azienda.
  - Chiarire distinzione tra:
    - documenti tecnici che descrivono gli asset del sistema
    - struttura dei decision tree e delle verifiche
  - Correzione degli attori nei casi d’uso:
  il sistema non deve essere un attore.
  - Definizione della necessità di un utente amministratore per la sezione di modifica.
  - Criteri di necessità delle giustificazioni: inserirli in modo generico in attesa di uno studio più accurato dello standard.
  - Si è inoltre discusso della necessità di rendere gli use case più atomici e meglio correlati tramite inclusioni, estensioni, ereditarietà.
    

  == Riorganizzazione documentale <rd>
  Durante la riunione è stato proposto di scomporre i documenti in più file typst usando include, per migliore manutenibilità, con la seguente suddivisione consigliata: 
  - file principale → contiene la struttura
  - sottocartella con sezioni (es. use_cases/, processi/, ecc.)
  #figure(caption:"Esempio di scomposizione del Piano di progetto",)[
#image(images_dir+"/esempio_struttura_file.png",fit:"stretch",width: 100%)

  ]
  - È stata inoltre discussa l'introduzione di flag per migliorare prestazioni della preview Typst (es. disattivare marcatura glossario).




  == Completamento dei documenti
  === Norme di progetto
  #upper("è") stata presentata la necessità di completare le sezioni mancanti del documento:
  - processi primari
  - identificazione dei documenti
  - metriche di qualità

  === Piano di Qualifica <pq>
  La discussione ha evidenziato che mancano ancora le competenze e il tempo necessari per affrontare adeguatamente il Piano di Qualifica. \
  Le metriche di qualità viste a lezione richiedono ulteriori approfondimenti (qualità del processo, del prodotto, metriche documentali).
  Per ora si può iniziare dalla qualità della documentazione, ma la parte di testing e metriche software è prematura e richiede una maggiore comprensione. \ 
  Nel complesso, si è deciso che il Piano di Qualifica non verrà avviato formalmente in questo sprint. \
]


#insertArabicNumberedPages("Decisioni","Verbale interno",giornoRiunione )[
= Decisioni
#let contatoreDecisioni= counter("decisioni")
#contatoreDecisioni.update(1)
#let prefisso="VI.8."

#let decisioni=(
(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Implementare struttura dei documenti usando include Typst.],
  [Migliorare manutenibilità e navigazione dei file.],
  [@rd]
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Completare e strutturare le Norme di Progetto.],
  [Parte ancora incompleta e fondamentale per metodologia interna.],
  [@rd]
),

(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Non iniziare il Piano di Qualifica in questo sprint.],
  [Mancanza conoscenze sufficienti per metriche e testing avanzato.],
  [@pq]
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Aprire issue dedicata per aggiornamento del sito.],
  [Necessità di verifica e aggiornamento contenuti pubblicati],
  [-]
),


)

#utilityTable(decisioni,header:("Codice","Descrizione","Motivazioni","Ref."),columns:(auto,2fr,2fr,auto))

]


#insertArabicNumberedPages("TODO","Verbale interno",giornoRiunione )[

= TODO

#let prefisso="TD.10."
#let contatoreTodo= counter("todo")
#contatoreTodo.update(1)
I TODO sorti da questa riunione sono i seguenti:
#let TODO=(
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Filippo Guerra],
  [Verbale della riunione],
  [-],
), 

(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Davide Lorenzon],
  [Implementazione struttura moduli Typst e refactoring documenti.],
  [VI.8.3],
), 
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Analisti],
  [Completamento Norme di \ Progetto: processi primari,\ metriche, identificazione \ documenti],
  [VI.8.2],
), 
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Da definire],
  [Programmare revisione interna dei casi d’uso prima del meeting con azienda],
  [VI.8.1],
), 
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Da Definire],
  [Aggiornamento del sito web (aprire nuova issue). \ 
  Verifica versionamento e \ normalizzazione dei file.],
  [VI.8.4],
), 


  )
#utilityTable(TODO,header: ("Codice","Assegnatari","Task","Decisione di riferimento"),columns: (auto,auto,1fr,auto),)


]
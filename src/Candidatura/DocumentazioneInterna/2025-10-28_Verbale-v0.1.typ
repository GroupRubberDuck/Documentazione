#import "/src/config.typ": *
#import template_dir + "/frontPage.typ": frontPage
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/statusTab.typ": statusTab
#import template_dir + "/utilityTable.typ": getCode, utilityTable

#set text(size: 12pt)
#show heading.where(level: 1): set text(size: 18pt)
#show heading.where(level: 2): set text(size: 16pt)
#let giornoRiunione = datetime(year: 2025, month: 10, day: 28)

#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages( "Stato del documento", "Verbale Interno",giornoRiunione)[
  #statusTab(
    stato: "In validazione",
    versione: "1.0",
    autori: ("Felician Mario Necsulescu",),
    revisori: ("Aldo Bettega",),
    validatori: ("-",),
    uso: "Interno",
    destinatari: ("Tutto il gruppo",),
  )
]

#insertRomanNumberedPages("Registro Modifiche","Verbale interno",giornoRiunione )[
#registroModifiche((
  ([1.0],[2025-10-29],[Stesura del verbale],[Felician Mario Necsulescu],[Aldo Bettega], [-]),
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
- *Data*: #giornoRiunione.display()
- *Luogo*: Riunione su Discord
- *Ora inizio*: 16:00
- *Ora fine*: 17:15
- *Scriba*: Felician Mario Necsulescu
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
#list(marker: [‣])[Discussione collocazione documento diario di bordo][Standard di nomenclatura dei documenti][Determinazione workflow per la gestione dei verbali][Definizione dei TODO e pianificazione delle attività in vista della candidatura ]
]
]

#insertArabicNumberedPages("Riassunto della riunione ","Verbale interno",giornoRiunione )[
= Riassunto della riunione 

  #list(marker: [—])[
    È stata discussa e stabilita la *riorganizzazione della struttura delle directory* del repository, con particolare attenzione alla collocazione dei diari di bordo in una cartella apposita, per cercare di migliorare la reperibilità e di mantenere una struttura più ordinata e coerente all'interno del repository.
  ][
    Il gruppo ha affrontato la questione della *nomenclatura dei file*, valutando diverse convenzioni possibili. Si è optato per l'adozione di uno standard basato sul formato ISO internazionale, che permette di sfruttare l'ordinamento automatico dei sistemi operativi e facilita la ricerca temporale dei documenti.
  ][
     È stato analizzato il processo di produzione dei verbali, individuando la necessità di un *workflow strutturato* con fasi distinte che garantisca tracciabilità e qualità.
  ][
    In vista della scadenza per la candidatura, il gruppo ha affrontato la questione della *distribuzione del carico di lavoro*, identificando le principali attività da completare e la necessità di bilanciare equamente le responsabilità.
  ]
]

#insertArabicNumberedPages("Decisioni","Verbale interno",giornoRiunione )[
= Decisioni
#let contatoreDecisioni= counter("decisioni")
#contatoreDecisioni.update(1)

#let decisioni=(
  ([#getCode(prefisso:"VI.3.",contatore:contatoreDecisioni)],[ Viene creata la cartella "src/DiariDiBordo/" per la raccolta di tutti i diari del gruppo.]),
  ([#getCode(prefisso:"VI.3.",contatore:contatoreDecisioni)],[Si adotta il formato `YYYY-MM-DD_TipoDocumento` per tutti i file (es. `2025-10-23_Verbale`).]),
  ([#getCode(prefisso:"VI.3.",contatore:contatoreDecisioni)],[I verbali seguiranno obbligatoriamente quattro fasi:
    - *Backlog*: verbali pianificati
    - *In Progress*: in fase di redazione
    - *In Review*: in fase di revisione
    - *Done*: approvati e definitivi] ),
  ([#getCode(prefisso:"VI.3.",contatore:contatoreDecisioni)],[Assegnazione attività candidatura: lettera di presentazione, preventivo costi e valutazione capitolati.]),
)

#utilityTable(decisioni,header:("Codice","Descrizione",),columns:(1fr,3fr))

]


#insertArabicNumberedPages("TODO","Verbale interno",giornoRiunione )[

= TODO
#let contatoreTodo= counter("todo")
#contatoreTodo.update(1)
I punti da approfondire nelle prossime riunioni o in vista di esse individuati sono stati i seguenti:
#let TODO=(
  ([#getCode(prefisso:"TD.3.",contatore:contatoreTodo)],[Aldo Bettega],[Stesura della valutazione dei capitolati],[VI.3.4]),
  ([#getCode(prefisso:"TD.3.",contatore:contatoreTodo)],[Davide Lorenzon],[Stesura del preventivo dei costi ],[VI.3.4]),
  ([#getCode(prefisso:"TD.3.",contatore:contatoreTodo)],[Ana Maria Draghici],[Stesura della lettera di presentazione],[VI.3.4]),
  ([#getCode(prefisso:"TD.3.",contatore:contatoreTodo)],[Davide Testolin e Filippo Guerra],[Revisione dei nuovi file creati],[VI.3.4]),
  )
#utilityTable(TODO,header: ("Codice","Assegnatari","Task","Decisione di riferimento"),columns: (1fr,1fr,1fr,1fr))

]
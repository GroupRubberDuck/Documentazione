#set text(lang: "IT")

#import "/src/config.typ": *
#import template_dir + "/frontPage.typ": frontPage
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/statusTab.typ": statusTab
#import template_dir + "/utilityTable.typ": getCode, utilityTable

#show link: body => {
  set text(fill: blue)
  underline()[#body]
}
#show ref: body => { underline()[#strong(body)] }

#set text(size: 12pt)
#set heading(numbering: "1.1)")
#show heading.where(level: 1): set text(size: 18pt)
#show heading.where(level: 2): set text(size: 16pt)


//
//Info del documento
//
#let currentVersion = (
  major: 1,
  minor: 0,
  patch: 0,
)
//converte dizionario in stringa
#let versionNumber = currentVersion.values().map(n => { str(n) }).join(".")
#metadata(versionNumber)<versionNumber>

#let giornoRiunione = datetime(year: 2026, month: 03, day: 02)
#let doctype = "Verbale interno"
#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages("Stato del documento", doctype, giornoRiunione)[
  #statusTab(
    stato: "Approvato",
    versione: versionNumber,
    autori: (persone.ANA,),
    verificatori: (persone.FELIX,),
    uso: "Interno",
    destinatari: ("Tutto il gruppo",),
  )
]

#insertRomanNumberedPages("Registro Modifiche", doctype, giornoRiunione)[


  #let modifiche = (
    ([0.1.0], [2026-03-02], persone.ANA, persone.FELIX,[Stesura del verbale]),
    ([1.0.0], [2026-03-03], persone.ANA, persone.ANA,[Approvazione]),
    
  )

  #registroModifiche(modifiche)
]

#insertRomanNumberedPages("Indice", "Verbale interno", giornoRiunione)[
  #outline(depth: 2, title: "Indice")
]

#pagebreak()
#context counter(page).update(1)


#insertArabicNumberedPages("Informazioni generali", "Verbale interno", giornoRiunione)[
  = Informazioni generali
  - *Tipo di riunione*: Interno
  - *Motivazione*: Riunione interna programmata
  - *Data*: #giornoRiunione.display()
  - *Luogo*: Riunione su Discord
  - *Ora inizio*: 15:00
  - *Ora fine*: 16:10
  - *Scriba*: #persone.ANA
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
- Rendicontazione ore e tracciamento issue/commit.
- Stato di stesura dei documenti (Piano di Qualifica, Glossario, Verbali passati).
- Avanzamento nell'analisi dei requisiti e dei casi d'uso.
- Architettura, scelte tecnologiche e sviluppo del PoC (Backend e Frontend).
]


#insertArabicNumberedPages("Riassunto della riunione", "Verbale interno", giornoRiunione)[
= Riassunto della riunione 
Durante l'incontro si è discusso dell'ottimizzazione per la rendicontazione delle ore tramite script e dell'importanza di un corretto tracciamento delle issue su GitHub.
\ Si è inoltre fatto il punto sull'aggiornamento dei documenti, sulla rapida conclusione dei casi d'uso e sulle scelte tecnologiche per avviare il PoC.

== Tracciamento delle attività e rendicontazione ore 
Si è discusso l'utilizzo di script di automazione per estrarre i dati di rendicontazione da GitHub, in modo da assegnare le ore agli sprint futuri in maniera più realistica e bilanciata tra i vari ruoli. È stata ribadita l'importanza vitale di mantenere un tracciamento pulito sulle issue. 
== Documentazione, Qualifica e Verbali <documentazione>
Il Glossario è stato aggiornato inserendo la barra di ricerca e navigazione per lettere alfabetiche. Nel Piano di Qualifica sono stati inseriti i cruscotti per la valutazione delle metriche. Per il testing futuro, si è deciso di attendere il completamento dei casi d'uso prima di delineare i test di prodotto, mentre andranno già indagati i tool per l'analisi statica (es. SonarQube) per valutare metriche come la complessità ciclomatica e possibili tool/librerie per gestire il Frontend. Inoltre, è emersa la necessità di revisionare i vecchi verbali della fase RTB.
==  Analisi dei Requisiti e Casi d'Uso <requisiti>
È stata completata l'automazione per la generazione dei diagrammi e per il numbering automatico dei casi d'uso e requisiti. L'obiettivo a brevissimo termine è finalizzare la stesura dei casi d'uso entro 1-2 giorni, così da avere una base solida da cui far partire lo sviluppo del POC e per poter aggiornare l'azienda proponente (BlueWind) sull'avanzamento dei lavori.
== POC (Proof of Concept)  <POC>
L'ambiente di sviluppo Docker con Poetry è funzionante e le dipendenze base sono risolte. Sono stati discussi vari aspetti tecnici: \ 
Backend: Utilizzo di SQLite come database per la gestione dello stato e della memoria. I controlli sui tipi e la formattazione del codice in Python saranno gestiti tramite Mypy e Ruff, che andranno eseguiti localmente dai membri del team prestando attenzione a tipizzare correttamente funzioni e argomenti. \ 
Frontend: Si eviterà l'utilizzo di React puro se non giustificato da apposite librerie. Verranno valutate soluzioni alternative per la visualizzazione dell’albero decisionale, come implementazioni in HTML e JavaScript vanilla o librerie dedicate come Cytoscape. \ 
Gestione File: Il parsing dei file (JSON, XML e CSV) sarà gestito implementando lo Strategy Pattern per separare le validazioni dalle interfacce di input.
]

#insertArabicNumberedPages("Decisioni", "Verbale interno", giornoRiunione)[
  = Decisioni
  #let contatoreDecisioni = counter("decisioni")
  #contatoreDecisioni.update(1)
  #let prefisso = "VI.16."

  #let decisioni = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Redazione verbale interno del 2026-03-02],
      [Avere il verbale esterno disponibile per tutti],
      [-],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Revisione e correzione dei vecchi verbali della fase RTB],
      [Sono stati individuati errori grammaticali, di "numbering" e mancanze negli aggiornamenti del registro delle modifiche/approvazioni],
      [@documentazione],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Ricerca e valutazione di librerie frontend per il PoC alternative a React puro],
      [Soddisfare le richieste del corso, che sconsiglia l'utilizzo di framework come React senza reali motivazioni o librerie adeguate],
      [@POC],
    ),(
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Fissare un incontro di aggiornamento su Zoom con l'azienda BlueWind.],
      [Mantenere il proponente aggiornato sui progressi fatti nell'analisi dei casi d'uso e fare il punto della situazione.],
      [@requisiti],
    )
    
  )

  #utilityTable(decisioni, header: ("Codice", "Descrizione", "Motivazioni", "Ref."), columns: (auto, 2fr, 2fr, auto))
]


#insertArabicNumberedPages("TODO", "Verbale interno", giornoRiunione)[

  = TODO

  #let prefisso = "TD.20."
  #let contatoreTodo = counter("todo")
  #contatoreTodo.update(1)
  I TODO sorti da questa riunione sono i seguenti:

  #let TODO = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.ANA],
      [Redazione verbale interno della riunione svoltasi il  2026-03-02],
      [VI.16.1],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.ALDO],
      [Verifica e correzione dei vecchi verbali della fase RTB],
      [VI.16.2],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.DT,#persone.FILIPPO],
      [Ricerca e testing di tecnologie frontend per i decision tree alternative a React puro],
      [VI.16.3],
    ),
  )
  #utilityTable(
    TODO,
    header: ("Codice", "Assegnatari", "Task", "Decisione di riferimento"),
    columns: (auto, auto, 1fr, auto),
  )


]

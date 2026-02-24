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

#let giornoRiunione = datetime(year: 2026, month: 02, day: 09)
#let doctype = "Verbale interno"
#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages("Stato del documento", doctype, giornoRiunione)[
  #statusTab(
    stato: "Approvato",
    versione: versionNumber,
    autori: (persone.DL,),
    verificatori: ("Felician Mario Necsulescu",),
    uso: "Interno",
    destinatari: ("Tutto il gruppo",),
  )
]

#insertRomanNumberedPages("Registro Modifiche", doctype, giornoRiunione)[


  #let modifiche = (
    ([0.1.0], [2026-02-09], persone.DL, [Felician Mario Necsulescu],[Stesura del verbale]),
    ([1.0.0], [2026-02-10], persone.DL, persone.DL,[Approvazione]),
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
  - *Ora inizio*: 17:00
  - *Ora fine*: 18:00
  - *Scriba*: #persone.DL
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
  - Revisione delle attività pendenti
  - Gestione delle criticità del workflow di approvazione
  - Pianificazione delle attività dello sprint in corso
  - Aggiornamento della pianificazione delle attività sul lungo periodo

]


#insertArabicNumberedPages("Riassunto della riunione", "Verbale interno", giornoRiunione)[
  = Riassunto della riunione
  Durante la riunione si è rilevato che molti membri del gruppo non possono fornire disponibilità per le prossime attività a causa di impegni legati alla sessione d'esami corrente. 

  == Attività pendenti
  Il gruppo è stato troppo ottimista nella pianificazione del periodo coincidente con la prima sessione d'esami.

  Ciò ha portato allo spostamento in avanti nel tempo delle attività relative al PoC previste nel periodo precedente:
  - Ricerca sulle tecnologie relative al prodotto;
  - Ricerca sulle tecnologie relative all'ambiente di deploy e sviluppo;
  - Studio delle tecnologie tramite creazione di esempi giocattolo.

  == Gestione della disponibilità ridotta <gest>
  Molti membri del gruppo hanno dichiarato la loro impossibilità o disponibilità molto ridotta per le prossime attività.


#terms(
  ([Disponibilità normale],[Può svolgere qualsiasi attività in qualsiasi momento.]),
  ([Disponibilità parziale],[
    Può svolgere le attività a partire da una certa data.
  ]),
  ([Disponibilità bassa],[Può svolgere attività di bassa intensità in modo sporadico]),
  ([Disponibilità nulla],[Non può svolgere attività]),
)

#figure(caption:"Dichiarazione delle disponibilità per lo Sprint 6")[

  #table(columns: 2,
    table.header("Persona","Disponibilità"),
    persone.ALDO,[Bassa],
    persone.FELIX,[Bassa],
    persone.ANA,[Parziale],
    persone.FILIPPO,[Nulla],
    persone.DT,[Nulla],
    persone.DL,[Normale],
  )
]

Questo comporta la possibilità di accavallamento dei ruoli, un approccio diverso potrebbe essere deleterio all'avanzamento delle attività.
Rimangono alcuni vincoli necessari al mantenimento di un certo grado di qualità:
- Non si può essere il verificatore delle attività svolte da se stessi;
- Non si possono portare avanti attività di più ruoli contemporaneamente.
  
  == Revisione del workflow <workflow>
  Il workflow attuale ha evidenziato numerose criticità, si è deciso di passare a una procedura con maggiore livello di dettaglio.

  Il workflow attuale richiede che tutte le attività siano state revisionate e approvate per la pubblicazione, questa procedura non risponde bene a ritardi e imprevisti.

  La nuova procedura avrà un livello di dettaglio maggiore, ciò permetterà di approvare e pubblicare nuovi incrementi indipendentemente dallo stato di altre attività.


  == Attività urgenti <imp>
  Sono state identificate le attività urgenti a cui dedicare maggiore attenzione:
  - Analisi dei requisiti;
  - Attività relative al PoC.

  == Altre attività
  - Aggiornamento piano di progetto;
  - Rivisitare il workflow di approvazione per le attività relative al processo di fornitura.
]

#insertArabicNumberedPages("Decisioni", "Verbale interno", giornoRiunione)[
  = Decisioni
  #let contatoreDecisioni = counter("decisioni")
  #contatoreDecisioni.update(1)
  #let prefisso = "VI.14."

  #let decisioni = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Redazione verbale interno del 2026-02-09],
      [Avere il verbale esterno disponibile per tutti],
      [-],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Rivista pianificazione delle attività],
      [Necessario alla gestione degli imprevisti],
      [@gest],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Raffinazione dei casi d'uso nell'analisi dei requisiti],
      [Attività necessaria alla chiusura della RTB],
      [@imp],
    ),(
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Revisione del workflow],
      [La vecchia procedura non è più adeguata],
      [@workflow],
    )
    
  )

  #utilityTable(decisioni, header: ("Codice", "Descrizione", "Motivazioni", "Ref."), columns: (auto, 2fr, 2fr, auto))

  Relativamente al PoC, rimangono valide le decisioni prese nella precedente riunione interna e tracciate nel Verbale del 2026-01-13 e 2026-01-05. 
]


#insertArabicNumberedPages("TODO", "Verbale interno", giornoRiunione)[

  = TODO

  #let prefisso = "TD.18."
  #let contatoreTodo = counter("todo")
  #contatoreTodo.update(1)
  I TODO sorti da questa riunione sono i seguenti:

  #let TODO = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.DL],
      [Redazione verbale interno della riunione svoltasi il  2026-01-13],
      [VI.14.1],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.ALDO],
      [Aggiornamento del Piano di Progetto],
      [VI.14.2],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.DL],
      [Controllo e raffinamento dei casi d'uso],
      [VI.14.3],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.DL],
      [Redazione dei diagrammi dei casi d'uso],
      [VI.14.3],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.DL],
      [Progettazione di un nuovo workflow],
      [VI.14.4],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.DL],
      [Integrazione del nuovo workflow],
      [VI.14.4],
    ),
  )
  #utilityTable(
    TODO,
    header: ("Codice", "Assegnatari", "Task", "Decisione di riferimento"),
    columns: (auto, auto, 1fr, auto),
  )


]

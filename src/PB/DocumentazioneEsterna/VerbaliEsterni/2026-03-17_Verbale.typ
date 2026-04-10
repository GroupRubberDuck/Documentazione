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
#let doctype = "Verbale esterno"
#let giornoRiunione = datetime(year: 2026, month: 03, day: 17)



#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages("Stato del documento", doctype, giornoRiunione)[
  #statusTab(
    stato: "Approvato",
    versione: versionNumber,
    autori: (persone.DT,),
    verificatori: (persone.FELIX,),
    uso: "Esterno",
    destinatari: ("Tutto il gruppo", "BlueWind srl"),
  )
]
#insertRomanNumberedPages("Registro Modifiche", doctype, giornoRiunione)[


  #let modifiche = (
    ([0.1.0], [2026-03-18], persone.DT, persone.FELIX, [Stesura del verbale]),
    ([1.0.0], [2026-03-20], persone.DT, persone.DT, [Approvazione interna ed esterna del documento]),
  )

  #registroModifiche(modifiche)
]

#insertRomanNumberedPages("Indice", "Verbale esterno", giornoRiunione)[
  #outline(depth: 2, title: "Indice")
]

#pagebreak()
#context counter(page).update(1)


#insertArabicNumberedPages("Informazioni generali", "Verbale esterno", giornoRiunione)[
  = Informazioni generali
  - *Tipo di riunione*: Esterno
  - *Motivazione*: Allineamento sui requisiti prodotti
  - *Data*: #giornoRiunione.display()
  - *Luogo*: Riunione su Zoom
  - *Ora inizio*: 17:00
  - *Ora fine*: 17:25
  - *Scriba*: Davide Testolin
  - *Partecipanti*:#align(left)[
      #set list(marker: [--])
      - Filippo Guerra
      - Davide Testolin
      - Aldo Bettega
      - Davide Lorenzon
      - Ana Maria Draghici
      - Felician Mario Necsulescu \
      #set list(marker: [#set text(fill: blue)
        •
      ])
      - Alessandro Zappia
      - Tobia Fiorese
    ]
]

#insertArabicNumberedPages("Ordine del giorno", "Verbale esterno", giornoRiunione)[
  = Ordine del giorno
  - Presentazione dello stato di avanzamento.

  - Chiarimenti sull'Analisi dei Requisiti.

  - Presentazione del PoC.
]

#insertArabicNumberedPages("Riassunto della riunione", "Verbale esterno", giornoRiunione)[
  = Riassunto della riunione<intro>
  La riunione si è svolta per presentare lo stato di avanzamento del gruppo durante il periodo a minore intensità di lavoro dovuto al sovrapporsi del periodo di esami ed altri impegni dei singoli membri del gruppo. Sono stati richiesti chiarimenti riguardo alcuni dubbi sull' Analisi dei Requisiti e successivamente è stato presentato il PoC. Infine si è concordato di riprendere le riunioni di allineamento periodico tra il gruppo e l'azienda.

  == Rimozione del sistema multi-utente
  E' stata resa nota all'azienda la scelta del gruppo di semplificare la gestione degli utenti rimuovendo il sistema multi-utente e concentrandosi su un unico utente con accesso completo all'applicazione.

  == Metodo di salvataggio<salvataggio>
  Si è chiarito il metodo di salvataggio dell'applicazione, che utilizzerà una rappresentazione interna dei dati al posto di sovrascrivere il file importato dall'utente.

  == Giustificazioni nel decision tree<giustificazioni>
  E' stato chiarito che la giustificazione da parte dell'utente per la risposta ad un requisito del decision tree è obbligatoria solo nel caso in cui il risultato sia Not Applicable.

  == Formato di esportazione<esportazione>
  E' stato chiarito che il contenuto del report generato in formato JSON e CSV può essere uguale al contenuto dell'esportazione del dispositivo nel medesimo formato.

  == Presentazione del Proof of Concept
  Il gruppo ha presentato il Proof of Concept all'azienda proponente con una dimostrazione pratica, spiegando le principali tecnologie utilizzate (Flask, MongoDB e D3js).

]

#insertArabicNumberedPages("Decisioni", "Verbale esterno", giornoRiunione)[
  = Decisioni
  #let contatoreDecisioni = counter("decisioni")
  #contatoreDecisioni.update(1)
  #let prefisso = "VE.5."

  #let decisioni = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [La generazione del report in formato JSON o CSV produce lo stesso risultato dell'esportazione del dispositivo nel medesimo formato.],
      [Su suggerimento della proponente.],
      [@esportazione],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [La giustificazione della risposta ad un requisito nel decision tree è obbligatoria solo se il risultato è Not Applicable.],
      [Su suggerimento della proponente.],
      [@giustificazioni],
    ),
     (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Riunioni bisettimanali tra gruppo ed azienda proponente.],
      [Su richiesta del gruppo.],
      [@intro],
    ),
  )

  #utilityTable(decisioni, header: ("Codice", "Descrizione", "Motivazioni", "Ref."), columns: (auto, 2fr, 2fr, auto))

]

#insertArabicNumberedPages("TODO", "Verbale esterno", giornoRiunione)[

  = TODO
  #let prefisso = "TD.22."
  #let contatoreTodo = counter("todo")
  #contatoreTodo.update(1)
  I TODO sorti da questa riunione sono i seguenti:
  #let TODO = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.DT],
      [Redazione di questo verbale],
      [VE.5.1],
    ),
  )
  #utilityTable(
    TODO,
    header: ("Codice", "Assegnatari", "Task", "Decisione di riferimento"),
    columns: (auto, auto, 2fr, auto),
  )
]

#insertArabicNumberedPages("Approvazione esterna ", "Verbale esterno", giornoRiunione)[
  = Approvazione esterna
  La presente sezione documenta la conferma e la validazione del verbale da parte del proponente esterno.
  Il confronto avvenuto durante la riunione ha permesso di chiarire dubbi e punti critici, rappresentando un'importante occasione di condivisione e collaborazione tra le parti.

  Con la firma riportata in seguito, il proponente esterno *attesta l'approvazione del documento* nella sua versione corrente.
  #place(right)[#image(images_dir+"/approvazione_Bluewind_Tobia.png")]

]

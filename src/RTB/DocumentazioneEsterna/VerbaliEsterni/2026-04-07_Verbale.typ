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
  major: 0,
  minor: 1,
  patch: 0,
)
//converte dizionario in stringa
#let versionNumber = currentVersion.values().map(n => { str(n) }).join(".")
#metadata(versionNumber)<versionNumber>
#let doctype = "Verbale esterno"
#let giornoRiunione = datetime(year: 2026, month: 04, day: 07)



#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages("Stato del documento", doctype, giornoRiunione)[
  #statusTab(
    stato: "In verifica",
    versione: versionNumber,
    autori: (persone.ALDO,),
    verificatori: (persone.FILIPPO,),
    uso: "Esterno",
    destinatari: ("Tutto il gruppo", "BlueWind srl"),
  )
]
#insertRomanNumberedPages("Registro Modifiche", doctype, giornoRiunione)[


  #let modifiche = (
    ([0.1.0], [2026-04-07], persone.ALDO, persone.FILIPPO, [Stesura del verbale]),
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
  - *Ora inizio*: 16:00
  - *Ora fine*: 16:25
  - *Scriba*: Aldo
  - *Partecipanti*:#align(left)[
      #set list(marker: [--])
      - Filippo Guerra
      - Davide Testolin
      - Aldo Bettega
      - Davide Lorenzon
      - Ana Maria Draghici
      #set list(marker: [#set text(fill: blue)
        •
      ])
      - Alessandro Zappia
      - Tobia Fiorese
    ]
]

#insertArabicNumberedPages("Ordine del giorno", "Verbale esterno", giornoRiunione)[
  = Ordine del giorno
  - Analisi dei requisiti
  - Controllo tipizzato

]

#insertArabicNumberedPages("Riassunto della riunione", "Verbale esterno", giornoRiunione)[
  = Riassunto della riunione
  Il team ha confermato il passaggio alla fase PB dopo il "semaforo verde" del Professor Cardin.
  Durante l'incontro con Blue Wind, è stata validata l'architettura esagonale e l'uso di Vue.js per widget dinamici in un contesto Flask.
  La proponente ha concesso libertà sulla validazione dei dati e flessibilità sull'editor dei Decision Tree, richiedendo un'interfaccia semplice. Riguardo a Mypy, è stato suggerito di dare priorità alla struttura dei moduli rispetto alla tipizzazione statica per evitare rallentamenti.
  La consegna finale è stata ufficialmente posticipata al 15 maggio.

]

#insertArabicNumberedPages("Verbale della riunione", "Verbale esterno", giornoRiunione)[
  = Aggiornamenti sull'andamento
  Il team ha comunicato la ricezione del semaforo verde da parte del professor Cardin e la riunione positiva avvenuta con il professor Vardanega in data odierna.
  È stato comunicata l'adozione del framework Vue.js per la parte di frontend.

  = Dubbi posti

  == Validazione campi
  È stato sollevato il dubbio sulla validità dei dati, come la lunghezza massima dei codici o i nomi degli asset. Il team ha utilizzato dei valori "segnaposto" nei documenti, e il proponente ha confermato che gli studenti hanno libertà di definire questi criteri di validazione

  == Requisiti dell'editor
  La parte di editing del Decision Tree è stata identificata come l'area con maggiore margine di manovra. Il proponente ha specificato che, trattandosi di un requisito opzionale, il team può decidere quanto tempo dedicarvi, richiedendo un'interfaccia grafica semplice e basilare senza particolari pretese estetiche

  == Scalabilità
  Il team ha chiesto se fossero necessari requisiti specifici per la scalabilità verso un numero elevato di utenti, ma il proponente ha risposto negativamente, non ritenendola una priorità al momento

  == Testing
  Una delle correzioni più rilevanti apportate all'analisi ha riguardato la definizione delle metodologie di testing da utilizzare.

  == Controllo tipizzato
  Il dibattito sul controllo tipizzato si è concentrato sull'uso di MyPy per l'inferenza statica in Python. Il Professor Cardin ha sollevato dubbi su una possibile incoerenza tra la natura dinamica di Python e l'imposizione di tipi statici. Il proponente ha suggerito che, sebbene Mypy possa prevenire bug a runtime , rischia di diventare un vincolo limitante durante la progettazione iniziale. La raccomandazione è di dare priorità alla definizione dell'architettura e dei moduli, valutando l'inserimento dei controlli tipizzati solo in una fase successiva o finale per evitare rallentamenti nello sviluppo.

  = Pianificazione e scadenze
   Il team ha comunicato lo spostamento della consegna finale al 15 maggio 2026 per garantire una fase di progettazione più accurata prima di procedere con la codifica e i test.
]

#insertArabicNumberedPages("Decisioni", "Verbale esterno", giornoRiunione)[
  = Decisioni & TODO
  Da questa riunione non sono sorte particolari decisioni. Arrivati a uno stato di progettazione più maturo verrà ricontattata l'azienda.
]

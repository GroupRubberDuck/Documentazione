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
#let versionNumber = currentVersion.values().map(n => { str(n) }).join(".")
#metadata(versionNumber)<versionNumber>
#let giornoRiunione = datetime(year: 2026, month: 04, day: 29)
#let doctype = "Verbale esterno"
#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages("Stato del documento", doctype, giornoRiunione)[
  #statusTab(
    stato: "In approvazione",
    versione: versionNumber,
    autori: ("Felician Mario Necsulescu",),
    verificatori: ("Ana Maria Draghici",),
    uso: "Esterno",
    destinatari: ("Tutto il gruppo",),
  )
]

#insertRomanNumberedPages("Indice", "Verbale esterno", giornoRiunione)[
  #outline(depth: 2, title: "Indice")
]

#pagebreak()
#context counter(page).update(1)


#insertArabicNumberedPages("Informazioni generali", "Verbale esterno", giornoRiunione)[
  = Informazioni generali
  - *Tipo di riunione*: Esterno
  - *Motivazione*: Aggiornamento della Proponente sullo stato di avanzamento del progetto
  - *Data*: #giornoRiunione.display()
  - *Luogo*: Riunione su Zoom
  - *Ora inizio*: 15.00
  - *Ora fine*: 15.30
  - *Scriba*: Felician Mario Necsulescu
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
  - Esposizione della struttura delle classi di dominio e logica di valutazione.
  - Discussione sulla gestione delle sessioni e persistenza in memoria.
  - Confronto su validazione dei dati e incapsulamento in Python.
  - Definizione della strategia di test e pianificazione dei prossimi incontri.
]

#insertArabicNumberedPages("Riassunto della riunione", "Verbale esterno", giornoRiunione)[
= Riassunto della Riunione
La riunione ha avuto lo scopo di aggiornare l'azienda proponente sulle scelte architetturali intraprese prima di avviare la fase di codifica massiva. Il team ha illustrato il diagramma delle classi, soffermandosi sulla distinzione tra i template degli standard e le istanze dei dispositivi. È stata discussa la gestione delle sessioni tramite architettura esagonale e le modalità di validazione dei dati. L'azienda ha confermato la validità dell'approccio, ponendo l'accento sull'importanza della copertura dei test (code coverage) e sulla solidità dei requisiti obbligatori.
]

#insertArabicNumberedPages("Contenuto riunione", "Verbale esterno", giornoRiunione)[
= Struttura del Dominio <dominio>
Il team ha presentato le tre unità di dominio principali:

- Device: contiene le informazioni anagrafiche del dispositivo, il modello e l'elenco degli Asset.

- Asset: include i dati specifici e la lista delle risposte ai requisiti.

- Compliance Standard: funge da template, contenente l'albero decisionale ricorsivo e i target di riferimento.

È stata definita la distinzione tra Verdict, che rappresenta l'esito formale previsto dallo standard (Pass, Fail, NA), ed Evaluation State, che riflette invece lo stato del workflow operativo. Quest'ultimo include lo stato Pending, utilizzato per gestire la sospensione temporanea della valutazione senza alterare la semantica dello standard di compliance.

= Gestione delle Sessioni  <sessioni>
Per l'MVP è stata adottata una gestione delle sessioni in-memory tramite un outbound adapter dedicato. Sebbene non sia la soluzione ottimale per sistemi distribuiti, è stata ritenuta accettabile per un'applicazione locale.
L'architettura prevede un Session Coordinator e un Session Handler per gestire il ciclo di vita delle sessioni (Evaluation ed Editing), garantendo che operazioni critiche siano bloccanti e che non vi siano più sessioni attive contemporaneamente (tramite identificativo di sessione).

= Validazione e Implementazione <implementazione>
Si è discusso il posizionamento dei controlli di validazione (es. nomi non nulli):

Il team opterà per controlli nel costruttore delle classi di dominio per garantire l'integrità dei dati (approccio fail-fast), supportati da validazioni lato frontend (drop-down, radio button).

Per la persistenza sul database, si è deciso di procedere con la sovrascrittura dell'entry del dispositivo a ogni salvataggio per garantire la coerenza senza implementare complessi pattern di change tracking (es. Aggregate Root).

Al fine di tutelare l'incapsulamento in Python, si valuterà se gestire le classi annidate restituendo nuove istanze indipendenti (copie) o utilizzando i property decorators. Ciò impedirà a componenti esterni di modificare direttamente i sotto-oggetti del Device senza passare per la logica di controllo prevista.

= Strategia di Test  <test> 
L'azienda ha concesso massima libertà sugli strumenti di test, raccomandando però un coverage elevato. Il team ha confermato l'utilizzo di Pytest e l'intenzione di adottare, dove possibile, un approccio TDD (Test-Driven Development), specialmente per la gestione dei casi di fallimento.
]

#insertArabicNumberedPages("Decisioni", "Verbale esterno", giornoRiunione)[
= Decisioni
#let contatoreDecisioni = counter("decisioni")
#contatoreDecisioni.update(1)
#let prefisso = "VE.6."

#let decisioni = (
(
[#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
[Gestione sessioni in-memory],
[Scelta accettabile per il contesto locale dell'MVP e semplicità di sviluppo],
[@sessioni],
),
(
[#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
[Validazione dati centralizzata nei costruttori di dominio],
[Garantire che gli oggetti di dominio siano sempre in uno stato valido],
[@implementazione],
),
(
[#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
[Priorità assoluta ai requisiti obbligatori],
[Assicurare una struttura solida prima di valutare l'implementazione degli opzionali],
[@test],
),
)

#utilityTable(decisioni, header: ("Codice", "Descrizione", "Motivazioni", "Ref."), columns: (auto, 2fr, 2fr, auto))
]

#insertArabicNumberedPages("TODO", "Verbale esterno", giornoRiunione)[
= TODO

#let prefisso = "TD.30."
#let contatoreTodo = counter("todo")
#contatoreTodo.update(1)

#let TODO = (

(
[#getCode(prefisso: prefisso, contatore: contatoreTodo)],
[Programmatori],
[Iniziare la codifica del dominio e dell'MVP tramite Pytest],
[VE.6.2],
),
(
[#getCode(prefisso: prefisso, contatore: contatoreTodo)],
[Progettisti],
[Valutare l'impatto prestazionale delle copie difensive per l'incapsulamento in Python],
[-],
),
(
[#getCode(prefisso: prefisso, contatore: contatoreTodo)],
[Responsabile],
[Organizzare il prossimo incontro di avanzamento per il 5 maggio 2026],
[-],
),
)
#utilityTable(
TODO,
header: ("Codice", "Assegnatari", "Task", "Decisione di riferimento"),
columns: (auto, auto, 1fr, auto),
)
]


#insertArabicNumberedPages("Approvazione esterna ", "Verbale esterno", giornoRiunione)[
  = Approvazione esterna
  La presente sezione documenta la conferma e la validazione del verbale da parte del proponente esterno.
  Il confronto avvenuto durante la riunione ha permesso di chiarire dubbi e punti critici, rappresentando un'importante occasione di condivisione e collaborazione tra le parti.

  Con la firma riportata in seguito, il proponente esterno *attesta l'approvazione del documento* nella sua versione corrente.

]

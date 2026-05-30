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
#let giornoRiunione = datetime(year: 2026, month: 04, day: 27)
#let doctype = "Verbale interno"
#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages("Stato del documento", doctype, giornoRiunione)[
  #statusTab(
    stato: "Approvato",
    versione: versionNumber,
    autori: (persone.ANA,),
    verificatori: ("Felician Mario Necsulescu",),
    uso: "Interno",
    destinatari: ("Tutto il gruppo",),
  )
]

#insertRomanNumberedPages("Indice", "Verbale interno", giornoRiunione)[
  #outline(depth: 2, title: "Indice")
]

#pagebreak()
#context counter(page).update(1)


#insertArabicNumberedPages("Informazioni generali", "Verbale interno", giornoRiunione)[
  = Informazioni generali
  - *Tipo di riunione*: Interno
  - *Motivazione*: Riunione di fine sprint
  - *Data*: #giornoRiunione.display()
  - *Luogo*: Riunione su Discord
  - *Ora inizio*: 15.00
  - *Ora fine*: 16.00
  - *Scriba*: #persone.ANA
  - *Partecipanti*:#align(left)[
      #set list(marker: [--])
      - Aldo Bettega
      - Davide Testolin
      - Felician Mario Necsulescu
      - Filippo Guerra
      - Ana Maria Draghici
      - Davide Lorenzon
      \
    ]
]

#insertArabicNumberedPages("Ordine del giorno", "Verbale interno", giornoRiunione)[
  = Ordine del giorno
  - Retrospettiva dello Sprint 11.
  - Aggiornamento sullo stato della Specifica Tecnica (ST).
  - Avanzamento dell'attività di codifica e setup dell'MVP.
  - Definizione dei ruoli e assegnazione dei task per lo Sprint 12.
]


#insertArabicNumberedPages("Riassunto della riunione", "Verbale interno", giornoRiunione)[
  = Riassunto della Riunione
  La riunione è iniziata con la retrospettiva dello Sprint 11, durante la quale ciascun membro ha rendicontato le attività svolte e le relative ore per ruolo. Il team ha poi discusso l'avanzamento della Specifica Tecnica, con particolare attenzione ai diagrammi delle classi e alla loro scomposizione per use case. Sono stati inoltre affrontati temi legati alla struttura dell'MVP e alle convenzioni da adottare nella codifica.
]

#insertArabicNumberedPages("Contenuto riunione", "Verbale interno", giornoRiunione)[
  = Specifica Tecnica <st>
  Nel corso dello sprint sono stati prodotti i diagrammi delle classi per i principali use case del backend, organizzati in sottocartelle distinte per inbound adapter, porte, service e outbound adapter. A seguito dei chiarimenti ricevuti durante l'incontro con il Prof. Cardin, è stata avviata la scomposizione dei diagrammi aggregati in diagrammi atomici, in cui ciascuna porta gestisce un unico use case e ciascun service ne implementa uno solo. Gli inbound adapter e gli outbound adapter possono invece continuare a gestire più porte.

  È stata inoltre chiarita la convenzione di naming nel dominio: il suffisso DTO non è ammesso nelle classi di dominio; al suo posto si utilizza il nome semantico della classe (es. #emph[DeviceSummary] invece di #emph[DeviceSummaryDTO]).

  La sezione testuale della Specifica Tecnica non è ancora aggiornata rispetto ai diagrammi; la priorità rimane il completamento e la correttezza dei diagrammi, mentre i testi potranno essere integrati in parallelo con la codifica.

  = Architettura e dominio <architettura>
 È stata illustrata al gruppo la struttura dell'architettura esagonale adottata, chiarendo le responsabilità dei principali componenti: gli inbound adapter ricevono le richieste esterne e le traducono per le porte, le porte corrispondono a singoli use case e vengono implementate dai service, i quali orchestrano il dominio. Sono state chiarite le responsabilità dei principali componenti e la gestione delle sessioni tramite cache in memoria.

  = Codifica e MVP <codifica>
  È stata avviata la strutturazione della directory del backend dell'MVP, con le cartelle per dominio, adapter, porte e service. È stata valutata la possibilità di adottare una struttura piatta per la serializzazione dell'albero decisionale, in coerenza con quanto già adottato nel frontend.

  È stato inoltre stabilito l'utilizzo di pull request per la revisione del codice, al posto del push diretto sul branch principale. Sarà valutata l'introduzione di una pipeline di Continuous Integration basata su Pytest.

  = Pianificazione Sprint 12 <sprint>
  Lo Sprint 12 è stato definito a partire dal 28 aprile 2026. I ruoli assegnati per lo sprint sono i seguenti:

  - Responsabile — Felician Mario Necsulescu;
  - Amministratore — Filippo Guerra;
  - Programmatori — Aldo Bettega, Davide Lorenzon;
  - Progettista — Davide Testolin (revisione e rifinitura dei diagrammi delle classi);
  - Ana Maria Draghici si occuperà dell'implementazione del database;
  - Tutto il gruppo — trasversalmente come Progettisti, Verificatori e supporto reciproco.

]

#insertArabicNumberedPages("Decisioni", "Verbale interno", giornoRiunione)[
  = Decisioni
  #let contatoreDecisioni = counter("decisioni")
  #contatoreDecisioni.update(1)
  #let prefisso = "VI.25."

  #let decisioni = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Scomposizione dei diagrammi delle classi per use case],
      [Essere coerenti sia con lo standard sia con quanto discusso insieme e con Cardin],
      [@st],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Adozione di pull request per la revisione del codice],
      [Facilitare la verifica e il controllo delle modifiche prima del merge],
      [@codifica],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Valutazione di struttura piatta per la serializzazione dell'albero decisionale],
      [Semplificare il passaggio dei dati tra backend e frontend],
      [@codifica],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Proseguire la codifica dell'MVP a partire dalle classi principali del dominio],
      [Validare le scelte progettuali attraverso un'implementazione concreta e progressiva],
      [@codifica],
    ),
  )

  #utilityTable(decisioni, header: ("Codice", "Descrizione", "Motivazioni", "Ref."), columns: (auto, 2fr, 2fr, auto))
]



#insertArabicNumberedPages("TODO", "Verbale interno", giornoRiunione)[

  = TODO

  #let prefisso = "TD.29."
  #let contatoreTodo = counter("todo")
  #contatoreTodo.update(1)
  I TODO sorti da questa riunione sono i seguenti:

  #let TODO = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.ANA],
      [Redigere il verbale interno di questa riunione],
      [-],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.DT],
      [Continuare la scomposizione dei diagrammi delle classi per use case],
      [VI.25.1],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.ANA],
      [Implementare il database rispettando le naming convention stabilite],
      [VI.25.3],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.ALDO, \ #persone.DL],
      [Continuare la codifica del dominio (MVP)],
      [VI.25.4],
    ),
  )
  #utilityTable(
    TODO,
    header: ("Codice", "Assegnatari", "Task", "Decisione di riferimento"),
    columns: (auto, auto, 1fr, auto),
  )

]
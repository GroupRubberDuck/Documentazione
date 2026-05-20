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

// Info documento
#let currentVersion = (
  major: 1,
  minor: 0,
  patch: 0,
)

#let versionNumber = currentVersion.values().map(n => { str(n) }).join(".")
#metadata(versionNumber)<versionNumber>

#let giornoRiunione = datetime(year: 2026, month: 05, day: 04)
#let doctype = "Verbale interno"

#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages("Stato del documento", doctype, giornoRiunione)[
  #statusTab(
    stato: "Approvato",
    versione: versionNumber,
    autori: ("Felician Mario Necsulescu",),
    verificatori: (persone.ANA,),
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
  - *Scriba*: Felician Mario Necsulescu
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

  - Revisione approfondita del dominio e dei diagrammi UML
  - Chiarimento delle responsabilità delle classi principali
  - Definizione delle convenzioni progettuali (command e service)
  - Retrospettiva dello sprint
]

#insertArabicNumberedPages("Riassunto della riunione", "Verbale interno", giornoRiunione)[
  = Riassunto della Riunione

  La riunione è stata dedicata principalmente alla revisione del modello di dominio in vista dell’avvio della fase di codifica. Il gruppo ha analizzato nel dettaglio i diagrammi delle classi, discutendo le responsabilità delle principali entità e il flusso di valutazione dei requisiti.

  Sono state prese decisioni rilevanti riguardo alla struttura dei service, all’utilizzo dei command e alla gestione degli output della valutazione. Inoltre, sono stati identificati alcuni aggiornamenti necessari alla Specifica Tecnica.

  La seconda parte della riunione è stata dedicata alla retrospettiva dello sprint, con rendicontazione delle attività svolte e riallocazione delle ore tra progettazione e codifica.
]

#insertArabicNumberedPages("Contenuto riunione", "Verbale interno", giornoRiunione)[
  = Specifica Tecnica <st>

  È stata effettuata una revisione approfondita del dominio, con analisi delle principali entità e delle loro responsabilità.

  Il Compliance Standard è stato confermato come contenitore di una collezione di requisiti. Ogni Requirement è caratterizzato da:
  - informazioni anagrafiche,
  - una lista di dipendenze rappresentate tramite identificativi,
  - un decision tree responsabile della logica di valutazione.

  Il metodo evaluate del requisito riceve in input:
  - un dizionario in sola lettura contenente le risposte,
  - i risultati delle dipendenze già calcolati.

  Sono stati definiti tre metodi di valutazione:
  - evaluateDevice,
  - evaluateAsset,
  - evaluateRequirement (privato).

  È stato chiarito che il metodo principale da utilizzare è evaluateAsset, in quanto gestisce automaticamente la valutazione delle dipendenze tramite memorizzazione dei risultati.

  = Gestione Asset ed Evidence

  Le evidenze rappresentano proprietà dell’asset e descrivono le caratteristiche utilizzate nel processo di valutazione.

  Gli oggetti asset evidence:
    - sono mutabili,
    - contengono risposta e giustificazione,
    - sono gestiti separatamente dall’asset.

  Questa scelta è stata motivata dalla volontà di rispettare il principio di singola responsabilità e migliorare la manutenibilità del codice.

  = Evaluation Engine

  L’Evaluation Engine è stato definito come componente completamente stateless, privo di attributi interni.

  Esso espone i metodi di valutazione e delega la logica alle entità del dominio. Include inoltre un metodo di aggregazione che combina i risultati: se almeno un requisito fallisce, l’intero stato aggregato risulta fallito.

  = Convenzioni Command

  È stato deciso di standardizzare l’utilizzo dei command nei service.

  Tutti i service dovranno ricevere un command come parametro, anche nei casi in cui sia necessario un solo dato in input.

  I command verranno implementati tramite Pydantic per:
  - semplificare la deserializzazione,
  - migliorare la validazione dei dati,
  - rendere più uniforme la comunicazione tra i livelli applicativi.

  = Frontend

  È stato discusso il design del frontend, in particolare l’introduzione di elementi aggiuntivi come indicatori di avanzamento. Il gruppo ha concordato di implementare inizialmente solo le funzionalità essenziali e rimandare eventuali miglioramenti estetici a una fase successiva.

  È stato inoltre sottolineato che elementi dinamici complessi potrebbero aumentare significativamente la complessità di integrazione con lo stato applicativo.

= Retrospettiva Sprint <sprint>

  Durante la retrospettiva è emerso che una parte significativa del lavoro è stata dedicata alla progettazione del dominio e alla definizione dell’architettura. Alcune attività inizialmente considerate come codifica sono state riclassificate come attività di progettazione.

  È stato inoltre evidenziato che i prossimi sprint saranno limitati nel tempo e che sarà necessario ottimizzare l’allocazione delle ore residue.



]

#insertArabicNumberedPages("Decisioni", "Verbale interno", giornoRiunione)[
  = Decisioni

  #let contatoreDecisioni = counter("decisioni")
  #contatoreDecisioni.update(1)
  #let prefisso = "VI.26."

  #let decisioni = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Standardizzare l'uso dei command nei service],
      [Uniformare le interfacce e migliorare la gestione dei dati],
      [@st],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Utilizzare evaluateAsset come metodo principale],
      [Gestire correttamente le dipendenze tra requisiti],
      [@st],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Separare asset ed evidenze],
      [Applicare il principio di singola responsabilità],
      [@st],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Prioritizzare le funzionalità core del frontend],
      [Ridurre complessità e tempi di sviluppo],
      [@sprint],
    ),
  )

  #utilityTable(decisioni, header: ("Codice", "Descrizione", "Motivazioni", "Ref."), columns: (auto, 2fr, 2fr, auto))
]

#insertArabicNumberedPages("TODO", "Verbale interno", giornoRiunione)[
  = TODO

  #let prefisso = "TD.31."
  #let contatoreTodo = counter("todo")
  #contatoreTodo.update(1)

  I TODO sorti da questa riunione sono i seguenti:

  #let TODO = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [Ana Maria Draghici],
      [Aggiornare i diagrammi del dominio e continuare la redazione della Specifica Tecnica],
      [VI.26.1, VI.26.2, VI.26.3],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.DL, \ Felician Mario Necsulescu, \ #persone.DT, \ #persone.FILIPPO],
      [Continuare la codifica],
      [-],
    ),
  )

  #utilityTable(
    TODO,
    header: ("Codice", "Assegnatari", "Task", "Decisione di riferimento"),
    columns: (auto, auto, 1fr, auto),
  )
]
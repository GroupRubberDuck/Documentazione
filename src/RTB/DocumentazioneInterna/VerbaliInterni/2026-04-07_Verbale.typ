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
  major: 0,
  minor: 1,
  patch: 0,
)
//converte dizionario in stringa
#let versionNumber = currentVersion.values().map(n => { str(n) }).join(".")
#metadata(versionNumber)<versionNumber>

#let giornoRiunione = datetime(year: 2026, month: 03, day: 30)
#let doctype = "Verbale interno"
#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages("Stato del documento", doctype, giornoRiunione)[
  #statusTab(
    stato: "In lavorazione",
    versione: versionNumber,
    autori: (persone.ALDO,),
    verificatori: (),
    uso: "Interno",
    destinatari: ("Tutto il gruppo",),
  )
]

#insertRomanNumberedPages("Registro Modifiche", doctype, giornoRiunione)[

  #let modifiche = (
    ([0.1.0], [2026-04-07], persone.ALDO, "", [Stesura del verbale]),
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
  - *Motivazione*: Riunione di fine sprint
  - *Data*: #giornoRiunione.display()
  - *Luogo*: Riunione su Discord
  - *Ora inizio*: 111.30
  - *Ora fine*: 12.30
  - *Scriba*: #persone.ALDO
  - *Partecipanti*:#align(left)[
      #set list(marker: [--])
      - Aldo Bettega
      - Davide Lorenzon
      - Davide Testolin
      - Felician Mario Necsulescu
      - Filippo Guerra
      - Ana Maria Draghici
      \
    ]
]

#insertArabicNumberedPages("Ordine del giorno", "Verbale interno", giornoRiunione)[
  = Ordine del giorno
  - Resoconto della riunione di fine RTB con il professor Vardanega
  - Avvio della fase di PB
  - Passaggio a sprint settimanale
]


#insertArabicNumberedPages("Riassunto della riunione", "Verbale interno", giornoRiunione)[
  = Riassunto della riunione
  Il team ha formalizzato il passaggio alla fase di Product Baseline (PB), adottando ufficialmente un'architettura esagonale e un approccio modular monolith per il deployment locale. È stato deciso di passare a sprint settimanali per migliorare l'agilità e il monitoraggio delle task. La priorità immediata è la stesura della Specifica Tecnica, partendo dallo studio dei design pattern e delle tecnologie scelte, come Flask e MongoDB. Il team ha inoltre pianificato la distribuzione dei ruoli per il prossimo sprint, identificando in Davide il nuovo responsabile e definendo le scadenze per la prima fase di studio teorico
]

#insertArabicNumberedPages("Contenuto riunione", "Verbale interno", giornoRiunione)[
  = Architettura e tecnologie<tec>
  Discutendo della fase di progettazione, occorre formalizzare che l'architettura del progetto sarà esagonale (Ports and Adapters), una scelta mirata a garantire il massimo disaccoppiamento tra la logica di business e le tecnologie esterne. Il sistema sarà strutturato come un modular monolith, approccio ritenuto ideale per il deployment locale e per mantenere una gestione ordinata dei moduli.
  - Business Logic: Sarà scritta in Python puro, evitando dipendenze dirette da framework come Flask o librerie come PyMongo, per assicurare che il core sia facilmente testabile e indipendente.
  - Persistence Logic: Utilizzerà degli adapter specifici per l'interazione con MongoDB, gestendo la manipolazione dei dati JSON e degli oggetti ricevuti dal database.
  - Application Logic: Implementata tramite Flask, sfrutterà i Blueprint per organizzare le rotte e separare le chiamate API dai template lato server.

  = Pianificazione e metodologia<metod>
  La pianificazione per la nuova fase di Progettazione in dettaglio e Codifica (PB) segna un cambio di passo metodologico per il team, che ha deciso di adottare ufficialmente gli sprint settimanali. Questa scelta, suggerita dalle esperienze positive di altri gruppi riportate nei diari di bordo, mira a garantire un coordinamento più stretto e una reattività maggiore.
  Dal punto di vista operativo, il team segue un approccio Top-Down, partendo dalla definizione dell'architettura logica globale per poi scendere nel dettaglio delle singole funzionalità. Lo sprint corrente (Sprint 9) è focalizzato su una fase intensiva di studio individuale dei documenti di specifica tecnica e dei design pattern, necessaria per formalizzare correttamente l'architettura. Per la gestione del codice, si sta valutando l'introduzione di un workflow più rigoroso basato su Pull Request anziché merge diretti, al fine di tutelare la stabilità della codebase dell'MVP. Infine, la gestione delle risorse è stata ottimizzata saturando i budget dei ruoli di Responsabile e Amministratore per garantire la coerenza finanziaria del progetto.

  = Documentazione e progetto<doc>
  La stesura della Specifica Tecnica rappresenta l'attività cardine della fase di Progettazione in dettaglio (PB), con una mole di lavoro stimata che può raggiungere le 200 pagine.
  Il documento si concentrerà sulla formalizzazione dell'architettura e sulla descrizione analitica di tutte le funzioni del sistema.
  In parallelo, il team ha pianificato lo sviluppo del Manuale Utente, sebbene la sua redazione definitiva sia prevista per le fasi più avanzate del ciclo di vita del software.
  Per garantire coerenza e rigore, la Specifica Tecnica includerà sezioni dedicate allo studio delle tecnologie e all'introduzione degli obiettivi del prodotto.
  A supporto di questo documento sarà necessario implementare un numbering automatico nella parte di descrizione delle funzioni del prodotto.

  = Gestione oraria e budget<budget>
  Per quanto riguarda la gestione delle risorse e del budget, il team ha effettuato una revisione analitica delle ore rendicontate durante lo Sprint 8 per garantire la coerenza con il piano economico. Per lo Sprint 9, sono state definite le seguenti dinamiche di gestione: Guerra è stato nominato nuovo Responsabile, Lorenzon è Amministratore e gli altri membri del gruppo Progettisti.
  Riallocazione Ore: Alcune attività di correzione errori, inizialmente considerate di verifica, sono state riclassificate sotto il ruolo di Analista per esaurire il budget dedicato a tale figura, ormai meno centrale nella fase di progettazione.
  È necessaria una revisione oraria per bilanciare il budget tra i vari ruoli: le ore di analista rimaste pendenti dovranno essere ridistrubuite in altri ruoli. Inoltre certi membri potrebbero avere eccedenze in determinati ruoli, rimanendo in ogni caso entro i limiti di budget. L'obiettivo è garantire la coerenza tra lo sforzo effettivo e le soglie economiche previste.
]


#insertArabicNumberedPages("Decisioni", "Verbale interno", giornoRiunione)[
  = Decisioni
  #let contatoreDecisioni = counter("decisioni")
  #contatoreDecisioni.update(1)
  #let prefisso = "VI.20."

  #let decisioni = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Adottare architettura esagonale e Monolite modulare],
      [Selezionata come la migliore per il dominio di progetto],
      [@tec],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Adottare sprint settimanali],
      [Avere maggiore controllo temporale sui task],
      [@metod],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Valutare di adottare Pull Request per repo di MVP],
      [Mantenere lo spazio più pulito e controllato],
      [@metod],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Studio di contenuti e forma del documento di Specifica Tecnica],
      [Iniziare la fase di PB],
      [@doc],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Prima stesura del documento di Specifica Tecnica],
      [Avanzare nella stesura del documento necessario alla PB],
      [@doc],
    ),
  )

  #utilityTable(decisioni, header: ("Codice", "Descrizione", "Motivazioni", "Ref."), columns: (auto, 2fr, 2fr, auto))
]



#insertArabicNumberedPages("TODO", "Verbale interno", giornoRiunione)[

  = TODO

  #let prefisso = "TD.24."
  #let contatoreTodo = counter("todo")
  #contatoreTodo.update(1)
  I TODO sorti da questa riunione sono i seguenti:

  #let TODO = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.ALDO],
      [Redigere il verbale interno della riunione svoltasi il 2026-04-07],
      [-],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.ALDO],
      [Redigere il verbale esterno della riunione svoltasi il 2026-04-07],
      [-],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.ALDO],
      [Redigere l'introduzione del documento di Specifica Tecnica],
      [VI.20.5],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [Tutto il gruppo],
      [Studio del documento Specifica Tecnica],
      [VI.20.4],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [Tutto il gruppo],
      [Studio di come realizzare e descrivere in modo formale l'architettura scelta],
      [VI.20.4],
    )
  )
  #utilityTable(
    TODO,
    header: ("Codice", "Assegnatari", "Task", "Decisione di riferimento"),
    columns: (auto, auto, 1fr, auto),
  )

]

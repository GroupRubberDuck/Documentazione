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

#let giornoRiunione = datetime(year: 2026, month: 01, day: 05)
#let doctype = "Verbale interno"
#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages("Stato del documento", doctype, giornoRiunione)[
  #statusTab(
    stato: "Approvato",
    versione: versionNumber,
    autori: (persone.ALDO,),
    verificatori: ("Felician Mario Necsulescu",),
    uso: "Interno",
    destinatari: ("Tutto il gruppo",),
  )
]

#insertRomanNumberedPages("Registro Modifiche", doctype, giornoRiunione)[


  #let modifiche = (
    ([0.1.0], [2026-01-14], persone.ALDO, [Felician Mario Necsulescu], [Stesura del verbale]),
    ([1.0.0], [2026-01-15], persone.ALDO, persone.ALDO, [Approvazione]),
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
  - *Motivazione*: Discussione riguardo riunione esterna
  - *Data*: #giornoRiunione.display()
  - *Luogo*: Riunione su Discord
  - *Ora inizio*: 17:00;
  - *Ora fine*: 18:00;
  - *Scriba*: Aldo Bettega
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



#insertArabicNumberedPages("Riassunto della riunione", "Verbale interno", giornoRiunione)[
  = Riassunto della riunione
  La riunione è stata svolta per discutere dell'incontro fatto poco prima con BlueWind. Gli argomenti principali sono stati:
  - analisi degli strumenti di sviluppo;
  - strategie di avanzamento per il PoC;
  - ambiente di sviluppo e tecnologie;

  == Analisi degli strumenti di sviluppo
  Si è discusso il restringimento della lista iniziale delle tecnologie candidate, orientandosi verso una selezione più mirata ed essenziale. La decisione è guidata dalla natura tecnica del progetto che, rivolgendosi a un'utenza ingegneristica, con frontend funzionale e privo di complessità superflue. Per mitigare i rischi legati alla curva di apprendimento, è stato stabilito di evitare l'adozione massiva di strumenti complessi non padroneggiati dal team. La strategia operativa prevede quindi di:

  - consolidare l'uso di tecnologie già note ai membri del gruppo;

  - selezionare, nel caso di strumenti nuovi, esclusivamente quelli ritenuti più efficaci e strettamente necessari al raggiungimento degli obiettivi.

  È stato analizzato l'utilizzo di MyPy: c'è stata una discussione riguardante l'uso di questa libreria, certi membri del gruppo non pensano che sia strettamente necessaria, mentre altri pensano che possa avere dei vantaggi.

  == Analisi dei requisiti
  Si è parlato degli avanzamenti fatti in questo documento, aumentando la granularità e aggiungendo requisiti. Si è deciso che in un ultimo momento si farà la tabella di tracciamento, se si riesce in modo automatico.

  == Strategia per il PoC <poc>
  Gestione della repository: È stata approvata la proposta di creare una repository dedicata esclusivamente al PoC, separata da quella del progetto finale. Questo permette di configurare liberamente l'ambiente (es. Docker, build automation) senza "inquinare" il codice del prodotto finale.

  Scopo del PoC: Il PoC è inteso come uno strumento sperimentale ("giocattolo") utile a validare la fattibilità tecnica e le scelte tecnologiche, e non come base di codice per il prodotto finale.

  Implementazione dati: Per facilitare i test sulla logica e sulle strutture dati (es. alberi), si valuta l'uso di dati hardcoded o mock, posticipando l'implementazione completa del parsing dei file (ad eccezione, forse, di un singolo formato standard come JSON).

  Funzionalità minime: Il PoC dovrà dimostrare la capacità di eseguire operazioni base (es. caricamento configurazioni, notifiche tra nodi) in modo rapido, senza necessitare di un design pattern perfetto in questa fase.

  == Ambiente di sviluppo e tecnologie
  Containerizzazione: Si conferma l'utilizzo di Docker per garantire la riproducibilità dell'ambiente di sviluppo e di esecuzione su macchine diverse, evitando problemi di compatibilità durante le presentazioni.

  Sperimentazione Tecnologica: I membri del team si divideranno per testare empiricamente le tecnologie ipotizzate (es. Flask per il backend, React o Javascript vanilla per il frontend) al fine di valutarne la facilità d'uso e l'adeguatezza prima della scelta definitiva.

]

#insertArabicNumberedPages("Decisioni", "Verbale interno", giornoRiunione)[
  = Decisioni
  #let contatoreDecisioni = counter("decisioni")
  #contatoreDecisioni.update(1)
  #let prefisso = "VI.13."

  #let decisioni = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Fare ricerca sulle tecnologie presenti nella lista aggiornata],
      [Avere familiarità con esse],
      [@poc],
    ),
  )

  #utilityTable(decisioni, header: ("Codice", "Descrizione", "Motivazioni", "Ref."), columns: (auto, 2fr, 2fr, auto))

]


#insertArabicNumberedPages("TODO", "Verbale interno", giornoRiunione)[

  = TODO

  #let prefisso = "TD.17."
  #let contatoreTodo = counter("todo")
  #contatoreTodo.update(1)
  I TODO sorti da questa riunione sono i seguenti:

  #let TODO = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.ALDO],
      [Redazione di questo verbale],
      [-],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [Tutto il gruppo],
      [Fare ricerca in ambito tecnologico],
      [VI.13.1],
    ),
  )
  #utilityTable(
    TODO,
    header: ("Codice", "Assegnatari", "Task", "Decisione di riferimento"),
    columns: (auto, auto, 1fr, auto),
  )


]

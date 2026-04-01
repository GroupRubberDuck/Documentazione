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

#let giornoRiunione = datetime(year: 2026, month: 03, day: 30)
#let doctype = "Verbale interno"
#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages("Stato del documento", doctype, giornoRiunione)[
  #statusTab(
    stato: "In lavorazione",
    versione: versionNumber,
    autori: (persone.ALDO,),
    verificatori: (persone.DT,),
    uso: "Interno",
    destinatari: ("Tutto il gruppo",),
  )
]

#insertRomanNumberedPages("Registro Modifiche", doctype, giornoRiunione)[

  #let modifiche = (
    ([0.1.0], [2026-03-30], persone.ALDO, persone.DT, [Stesura del verbale]),
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
  - *Motivazione*: Riunione di allineamento
  - *Data*: #giornoRiunione.display()
  - *Luogo*: Riunione su Discord
  - *Ora inizio*: 16.00
  - *Ora fine*: 17.00
  - *Scriba*: #persone.ALDO
  - *Partecipanti*:#align(left)[
      #set list(marker: [--])
      - Aldo Bettega
      - Davide Lorenzon
      - Davide Testolin
      - Felician Mario Necsulescu
      - Filippo Guerra
      \
    ]
]

#insertArabicNumberedPages("Ordine del giorno", "Verbale interno", giornoRiunione)[
  = Ordine del giorno
  - Discussione sull'adozione del framework Vue.js per il frontend del Proof of Concept (PoC) in sostituzione di JavaScript base.
  - Organizzazione della revisione e approvazione della documentazione ufficiale (Norme di Progetto, Piano di Qualifica, Piano di Progetto, Diario di Bordo, Verbale, Presentazione e Analisi dei Requisiti) in preparazione all'incontro con il Professor Vardanega.
  - Aggiornamento delle scadenze e allineamento sulle ore di progetto.
]


#insertArabicNumberedPages("Riassunto della riunione", "Verbale interno", giornoRiunione)[
  = Riassunto della riunione
  Il tema principale della riunione è stato valutare l'adozione di Vue.js al posto di JavaScript puro come framework il frontend. Questo tema ha suscitato una discussione interna che si è conclusa con l'adozione di Vue.js per maggioranza a favore.
  In seguito si sono delineate le attività successive di avanzamento per concludere la fase di RTB.

]

#insertArabicNumberedPages("Contenuto riunione", "Verbale interno", giornoRiunione)[
  = Scelta tecnologica frontend<tecnologie>
  La discussione si è aperta analizzando le criticità sollevate dal Prof. Cardin in merito all'uso di JavaScript puro per la gestione di interfacce complesse nel Proof of Concept (PoC). Per superare tali limiti, è stata avanzata la proposta di adottare il framework Vue.js.
  Un membro del gruppo non ritiene necessaria l'adozione di questo framework e predilige l'utilizzo di JavaScript puro ritenendo non necessaria l'adozione di questo framework.
  La maggioranza del team ha optato per l'adozione di Vue.js, accogliendo la proposta di rivisita tecnologica del professor Cardin e considerando che l'adozione di esso possa aiutare nella progettazione.

  = Rimodulazione del preventivo e ridistribuzione oraria<preventivo>
  Successivamente, l'attenzione del gruppo si è spostata sull'analisi del bilancio orario e sulla gestione del preventivo a finire. Il team ha constatato la necessità di allineare le stime iniziali con le ore di lavoro effettivamente necessarie in questa fase operativa. In particolare, è emersa un'eccedenza di ore precedentemente allocate alla figura dell'Analista rispetto alle reali contingenze attuali.

  La discussione si è quindi focalizzata sulle modalità di rimaneggiamento del budget interno per ottimizzare le risorse. È stata avanzata e dibattuta la proposta di convertire una quota delle ore previste per il ruolo di Analista in ore per i ruoli di Verificatore e Programmatore. Durante il confronto, sono stati valutati attentamente i vincoli economici: è stato ribadito l'obbligo tassativo di non superare il costo massimo preventivato, chiarendo al contempo che un costo finale leggermente inferiore alla stima non costituisce un problema. Al termine delle valutazioni, il gruppo ha approvato la ridistribuzione interna delle ore, concordando il conseguente aggiornamento dei documenti di pianificazione.

  = Posticipazione della data di consegna<consegna>
  Il gruppo ha deciso di spostare la data di consegna dal 30 aprile al 15 maggio, calcolando due settimane di ritardo rispetto alla situazione attuale.

  = Preparazione per la revisione di RTB<revisioneRTB>
  Il terzo punto ha riguardato l'organizzazione in vista del prossimo incontro di revisione con il Prof. Vardanega. La discussione si è concentrata sulla strutturazione della presentazione ufficiale che accompagnerà la consegna.

  Un focus particolare è stato dedicato alla preparazione in vista del colloquio: il gruppo ha stabilito che sarà fondamentale saper giustificare rigorosamente la scelta delle metriche di qualità adottate. Il dibattito ha inoltre evidenziato l'importanza di illustrare l'analisi dei requisiti, la gestione dei rischi, le tecnologie impiegate, fornendo un'autovalutazione oggettiva e sottolineando le principali modifiche migliorative introdotte durante lo sviluppo. Infine, a chiusura del punto, il team ha fissato a mercoledì 1 aprile alle 18.00 la scadenza interna per l'approvazione definitiva dei documenti.

  = Assegnazione Task
  A chiusura dell'incontro, il team ha pianificato i passi successivi per implementare le decisioni prese. In primo luogo, è stato definito il contenuto dell'e-mail destinata al Professor Cardin: la comunicazione dovrà essere concisa ma completa, chiarendo l'adozione di Vue.js in virtù dei suoi vantaggi strutturali e della sua natura progressiva. Infine, sono stati assegnati i compiti per la revisione e l'approvazione della documentazione, insieme alla distribuzione di altri incarichi secondari.
]


#insertArabicNumberedPages("Decisioni", "Verbale interno", giornoRiunione)[
  = Decisioni
  #let contatoreDecisioni = counter("decisioni")
  #contatoreDecisioni.update(1)
  #let prefisso = "VI.19."

  #let decisioni = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Adottare Vue.js per il frontend],
      [Adottare un framework che dia più struttura al frontend],
      [@tecnologie],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Rimodulazione oraria],
      [Allineare la distribuzione oraria fra ruoli entro il budget prestabilito],
      [@preventivo],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Posticipazione consegna al 15 maggio],
      [Fornire una data di consegna più realistica rispetto alla situazione attuale],
      [@consegna],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Approvare la documentazione necessaria alla revisione di RTB],
      [Avanzare verso la fase finale di RTB],
      [@revisioneRTB],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Redigere diario di bordo per 2026-04-01],
      [Avere una presentazione per l'incontro 2026-04-01],
      [-],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Redigere il verbale interno del 2026-03-30],
      [Avere un documento ufficiale della riunione],
      [-],
    ),
  )

  #utilityTable(decisioni, header: ("Codice", "Descrizione", "Motivazioni", "Ref."), columns: (auto, 2fr, 2fr, auto))
]



#insertArabicNumberedPages("TODO", "Verbale interno", giornoRiunione)[

  = TODO

  #let prefisso = "TD.23."
  #let contatoreTodo = counter("todo")
  #contatoreTodo.update(1)
  I TODO sorti da questa riunione sono i seguenti:

  #let TODO = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.ALDO],
      [Redigere il verbale interno della riunione svoltasi il 2026-03-30],
      [VI.19.6],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.DT],
      [Approvare PdP],
      [VI.19.4],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.DL],
      [Approvare PdQ],
      [VI.19.4],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.FELIX],
      [Approvare NdP],
      [VI.19.4],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.ANA],
      [Modificare AdR],
      [VI.19.4],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.FILIPPO],
      [Approvare AdR],
      [VI.19.4],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.ALDO],
      [Preparare una presentazione per l'incontro con il professor Vardanega],
      [VI.19.4],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.ALDO],
      [Redigere e presentare il diario di bordo del 2026-04-01],
      [VI.19.5],
    ),
  )
  #utilityTable(
    TODO,
    header: ("Codice", "Assegnatari", "Task", "Decisione di riferimento"),
    columns: (auto, auto, 1fr, auto),
  )

]

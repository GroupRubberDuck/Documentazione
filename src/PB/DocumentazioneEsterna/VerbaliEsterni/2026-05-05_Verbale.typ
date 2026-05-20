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
#let giornoRiunione = datetime(year: 2026, month: 05, day: 05)
#let doctype = "Verbale esterno"
#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages("Stato del documento", doctype, giornoRiunione)[
  #statusTab(
    stato: "Approvato",
    versione: versionNumber,
    autori: ("Davide Lorenzon",),
    verificatori: ("Filippo GUerra",),
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
  - *Motivazione*: Aggiornamento della proponente sullo stato di avanzamento del progetto
  - *Data*: #giornoRiunione.display()
  - *Luogo*: Riunione su Zoom
  - *Ora inizio*: 15.00
  - *Ora fine*: 15.30
  - *Scriba*: Davide Lorenzon
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
      - Tobia Fiorese
    ]
]
#insertArabicNumberedPages("Ordine del giorno", "Verbale esterno", giornoRiunione)[
= Ordine del giorno
  - Aggiornamento del progresso delle attività di progetto.
  - Discussione struttura del manuale utente.
  - Esposizione delle struttura e delle classi di dominio.
]

#insertArabicNumberedPages("Riassunto della riunione", "Verbale esterno", giornoRiunione)[
= Riassunto della Riunione
Durante la riunione sono state ricapitolate le scelte architetturali intraprese, ritenute ragionevoli dal referente dell'azienda proponente.
Lo stesso è stato fatto per la codifica delle classi di dominio, anch'essa ritenuta ragionevole.

Richiesta di chiarimenti sulla struttura del manuale utente e sul livello di dettaglio da adottare. È stato chiarito che è sufficiente un manuale utente basilare, corredato di immagini esplicative.




]

#insertArabicNumberedPages("Contenuto riunione", "Verbale esterno", giornoRiunione)[
= Contenuto riunione
== Struttura del Dominio <domain>
Il team ha presentato la struttura completa del dominio, ritenuta nel complesso ragionevole. Sono state vivamente suggerite delle modifiche ai nomi di alcuni metodi che verranno applicate nello sprint corrente.
== Progettazione complessiva <progettazione>
Il team ha nuovamente esposto la progettazione complessiva, illustrando i cambiamenti avvenuti dalla scorsa riunione e ricapitolando nuovamente quali sono le porte del sistema, gli adapter che le implementano e che tecnologia usano
== Aggiornamento sullo stato di avanzamento <implementazione>
Il gruppo ha comunicato la sua intenzione di concludere lo sviluppo nel breve periodo.
Concordato che ulteriori aggiornamenti saranno forniti tramite comunicazione asincrona(mail o canale telegram) in caso di progessi eccezionali nella fase di codifica, si fissa come argomento della riunione successiva la data della presentazione dell'MVP.
Chiarite anche la modalità di svolgimento di tale riunione, per l'azienda è indifferente che questa sia svolta in presenza o tramite chiamata zoom. 

== Discussione sul deployment
Il gruppo ha brevemente esposto il processo di deployment previsto, il referente dell'azienda ha comunicato che per loro è poco rilevante.

== Struttura del Manuale Utente <manuale-utente>
#upper("è") sufficiente un manuale utente basilare che illustri passo passo le varie funzionalità del prodotto realizzato con l'ausilio di immagini.
]

#insertArabicNumberedPages("Decisioni", "Verbale esterno", giornoRiunione)[
= Decisioni
#let contatoreDecisioni = counter("decisioni")
#contatoreDecisioni.update(1)
#let prefisso = "VE.7."

#let decisioni = (
(
[#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
[Dominio],
[Confermata la ragionevolezza della progettazione dominio.],
[@domain],
),
(
[#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
[Progettazione complessiva],
[Confermata la progettazione complessiva come accettabile],
[@progettazione],
),([#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
[Codifica],
[Procedere con la codifica dell'MVP],
[@implementazione],
),(
[#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
[Manuale utente],
[Il manuale utente può avere una struttura semplice],
[@manuale-utente],
),
)

#utilityTable(decisioni, header: ("Codice", "Descrizione", "Motivazioni", "Ref."), columns: (auto, 2fr, 2fr, auto))
]

#insertArabicNumberedPages("TODO", "Verbale esterno", giornoRiunione)[
= TODO

#let prefisso = "TD.32."
#let contatoreTodo = counter("todo")
#contatoreTodo.update(1)

#let TODO = (

(
[#getCode(prefisso: prefisso, contatore: contatoreTodo)],
[Programmatori],
[Proseguire con la codifica di service, porte e adapter. Ulteriori dettagli sulle attività da svolgere sono presenti sulla project board dell'MVP al seguente link:#link("https://github.com/orgs/GroupRubberDuck/projects/9")],
[VE.7.3],
),
(
[#getCode(prefisso: prefisso, contatore: contatoreTodo)],
[Progettisti],
[Stesura del manuale utente],
[VE.7.4],
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
  #place(right)[#image(images_dir+"/approvazione_Bluewind_Tobia.png")]
]

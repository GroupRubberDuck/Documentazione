#set text(lang: "IT")

#import "/src/config.typ": *
#import template_dir + "/frontPage.typ": frontPage
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/statusTab.typ": statusTab
#import template_dir + "/utilityTable.typ": getCode, utilityTable

#show link: body => {set text(fill:blue); underline()[#body]}
#show ref: body => { underline()[#strong(body)]}

#set text(size: 12pt)
#set heading(numbering: "1.1)")
#show heading.where(level: 1): set text(size: 18pt)
#show heading.where(level: 2): set text(size: 16pt)


// 
//Info del documento 
// 
#let currentVersion=(
  major:0,
  minor:0,
  patch:1,
)
//converte dizionario in stringa
#let versionNumber=currentVersion.values().map(n=>{str(n)}).join(".")
#metadata(versionNumber)<versionNumber>

#let giornoRiunione = datetime(year: 2025, month: 12, day:09)
#let doctype="Verbale interno"
#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages( "Stato del documento", doctype,giornoRiunione)[
  #statusTab(
    stato: "In lavorazione",
    versione: "0.0.1",
    autori: ("",),
    verificatori: ("",),
    uso: "Interno",
    destinatari: ("Tutto il gruppo",),
  )
]
#insertRomanNumberedPages("Registro Modifiche",doctype,giornoRiunione )[


  #let modifiche=(

    ([0.1.0],[#giornoRiunione.display()],[Filippo Guerra],[],[Scrittura verbale interno.]),

      )

      #registroModifiche(modifiche)




]

#insertRomanNumberedPages("Indice","Verbale interno",giornoRiunione )[
#outline( depth: 2,title: "Indice")
]

#pagebreak()
  #context counter(page).update(1)


#insertArabicNumberedPages("Informazioni generali","Verbale interno",giornoRiunione )[
  = Informazioni generali
- *Tipo di riunione*: Interno
- *Motivazione*: Riunione fine sprint;
- *Data*: #giornoRiunione.display()
- *Luogo*: Riunione su Discord
- *Ora inizio*: 15:00;
- *Ora fine*: 18:50
- *Scriba*: Filippo Guerra
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
  - Retrospettiva;
  - Attività da continuare:
    - Pianificazione di lungo periodo;
    - Analisi dei rischi;
    - Continuare il piano di progetto;
    - Metriche di controllo della, inizio del piano di qualifica;
    - Continuare le norme di progetto;
  - Migliorare la pianificazione;
  - Migliorare le tecniche di preventivo;
  - Incontri informali.

]

#insertArabicNumberedPages("Riassunto della riunione","Verbale interno",giornoRiunione )[
  = Riassunto della riunione
  La prima parte della riunione è stata dedicata all'attività di retrospettiva.

  Durante la riunione è emersa la necessità di completare l’analisi degli ACM e degli AUM. È stato chiarito che gli ACM precedono gli AUM e che è importante che tutti i membri del gruppo svolgano l’analisi dei documenti assegnati, producendo un riassunto scritto utile anche per consultazioni future. Una delle parti più onerose dell’attività è risultata essere la traduzione e comprensione dei requisiti.

  Si è concordato sulla possibilità di suddividere il materiale (circa 27 pagine) tra i membri del gruppo, assegnando un TODO per ciascuna persona

  Infine sono stati valutati i task da svolgere nel successivo periodo di avanzamento e sono stati assegnati i ruoli per lo sprint successivo.
]


#insertArabicNumberedPages("Decisioni","Verbale interno",giornoRiunione )[
= Decisioni
#let contatoreDecisioni= counter("decisioni")
#contatoreDecisioni.update(1)
#let prefisso="VI.9."

#let decisioni=(
(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Suddividere l’analisi degli ACM e degli AUM tra tutti i membri del gruppo.],
  [Ridurre il carico di lavoro individuale e garantire una copertura completa dei documenti entro le scadenze.],
  []
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Assegnare un to-do specifico a ciascun membro del gruppo.],
  [Migliorare l’organizzazione del lavoro e la tracciabilità delle attività svolte.],
  []
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Procedere con l’approvazione dei verbali e dei documenti ancora contrassegnati come “in verifica”.],
  [Consentire l’avanzamento dello stato dei documenti e permettere le successive operazioni di merge.],
  []
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Effettuare il merge delle Norme di Progetto nella giornata successiva alla riunione.],
  [Allineare il repository alla versione approvata del documento e renderlo disponibile a tutto il gruppo.],
  []
),
)

#utilityTable(decisioni,header:("Codice","Descrizione","Motivazioni","Ref."),columns:(auto,2fr,2fr,auto))

]


#insertArabicNumberedPages("TODO","Verbale interno",giornoRiunione )[

= TODO

#let prefisso="TD.11."
#let contatoreTodo= counter("todo")
#contatoreTodo.update(1)
I TODO sorti da questa riunione sono i seguenti:
#let TODO=(

(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [#persone.FELIX],
  [Verbale riunione],
  [],
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [#persone.DL],
  [Finire la transizione da "Dichiarazione di way of working" a norme di progetto. \
  (4.3, 4.4, 4.5)],
  [],
), 
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [],
  [Continuare le norme di progetto],
  [],
), 

(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [#persone.ALDO],
  [Riassumere AUM-1],
  [],
), 

(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [],
  [Riassumere AUM-2],
  [],
), 

(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [],
  [Riassumere AUM-3],
  [],
), 

(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [],
  [Riassumere AUM-4],
  [],
), 

(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [],
  [Riassumere AUM-5],
  [],
), 

(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [],
  [Riassumere AUM-6],
  [],
), 

(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [#persone.ALDO],
  [Riassumere ACM-1],
  [],
), 

(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [#persone.ALDO],
  [Riassumere ACM-2],
  [],
), 

(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [#persone.DL],
  [Implementare variabile per il tracciamento automatico della versione.],
  [],
), 

(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [],
  [Ricerca tecniche di pianificazione.],
  [],
), 
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [],
  [Ricerca tecniche di preventivo.],
  [],
), 

(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [],
  [Ricerca metriche di qualità.],
  [],
), 

(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [],
  [Continuare Analisi dei rischi.],
  [],
), 
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Analista],
  [Aggiornamento del glossario con i termini di dominio del documento.],
  [],
), 

(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Analista],
  [Aggiunta Sezione abbreviazioni al dizionario.],
  [],
), 



  )
#utilityTable(TODO,header: ("Codice","Assegnatari","Task","Decisione di riferimento"),columns: (auto,auto,1fr,auto),)


]
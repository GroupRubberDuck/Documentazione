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
  major:1,
  minor:0,
  patch:0,
)
//converte dizionario in stringa
#let versionNumber=currentVersion.values().map(n=>{str(n)}).join(".")
#metadata(versionNumber)<versionNumber>

#let giornoRiunione = datetime(year: 2025, month: 12, day:09)
#let doctype="Verbale interno"
#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages( "Stato del documento", doctype,giornoRiunione)[
  #statusTab(
    stato: "Approvato",
    versione: versionNumber,
    autori: (persone.FILIPPO,),
    verificatori: (persone.DT,),
    uso: "Interno",
    destinatari: ("Tutto il gruppo",),
  )
]
#insertRomanNumberedPages("Registro Modifiche",doctype,giornoRiunione )[


  #let modifiche=(

    ([0.1.0],giornoRiunione.display(),persone.FILIPPO,persone.DT,[Scrittura verbale interno.]),
    ([1.0.0],[#giornoRiunione.display()],[Davide Testolin],[Davide Testolin],[Approvazione]),

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

La prima parte della riunione è stata dedicata all’attività di retrospettiva, durante la quale i membri del gruppo hanno condiviso lo stato di avanzamento delle attività assegnate e le principali criticità riscontrate.

 == Studio del materiale fornito dall'azienda <materiale-studio>
Nel corso della discussione è emersa la necessità di completare l’analisi degli ACM e degli AUM. È stato chiarito che l’analisi degli ACM deve precedere quella degli AUM e che è fondamentale che tutti i membri del gruppo analizzino i documenti loro assegnati, producendo un riassunto scritto, utile anche per future consultazioni. È stato inoltre evidenziato come una delle attività più onerose consista nella traduzione e nella comprensione dei requisiti.

Al fine di rendere l’attività più sostenibile, si è concordato di suddividere il materiale complessivo, pari a circa 27 pagine complessive, tra i membri del gruppo, assegnando a ciascuno un TODO specifico e tracciabile.

== Piano di Qualifica e metriche di qualità <metriche-pdq>

È stata inoltre discussa la necessità di approfondire le metriche di qualità richieste nel Piano di Qualifica e di comprenderne la struttura complessiva. A tal fine, il gruppo ha concordato sull’opportunità di svolgere attività di studio sulle metriche di qualità più adeguate al progetto, in modo da agevolare la successiva stesura e revisione del documento.

== Aggiornamento dell’analisi dei rischi <analisi-rischi>

A seguito della discussione con l’azienda, il gruppo ha deciso di analizzare, studiare e aggiornare l’analisi dei rischi contenuta nel Piano di Progetto. L’obiettivo è individuare possibili criticità future e definire strategie di mitigazione più efficaci, migliorando così la solidità della pianificazione complessiva.
== Verificare la documentazione prodotta e attività future
<verifica-documentazione>
Infine, sono stati analizzati i task da svolgere nel periodo di avanzamento successivo. In tale contesto, sono stati assegnati i ruoli per lo sprint seguente ed è stato pianificato l’avanzamento dello stato dei documenti attualmente in verifica, inclusa l’approvazione dei verbali e il merge delle Norme di Progetto.

 È stata inoltre condivisa la necessità di studiare le best practices relative alla pianificazione e al preventivo, al fine di migliorare l’organizzazione del lavoro e comprendere come ottimizzare la gestione delle attività future.
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
  [@materiale-studio]
),


(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Avviare lo studio delle best practices per la pianificazione e il preventivo.],
  [Migliorare l’efficacia dei processi di pianificazione e di stima economica.],
  [@verifica-documentazione]
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Effettuare il merge delle Norme di Progetto nella giornata successiva alla riunione.],
  [Allineare il repository alla versione approvata del documento e renderlo disponibile a tutto il gruppo.],
  [@verifica-documentazione]
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Effettuare ricerche preventive sulle metriche di qualità da includere nel Piano di Qualifica.],
  [Individuare metriche adeguate al progetto prima dell’inserimento formale nel documento.],
  [@metriche-pdq]
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Analizzare e aggiornare l’analisi dei rischi nel Piano di Progetto.],
  [Mitigare potenziali criticità future, anche sulla base dei suggerimenti dell’azienda.],
  [@analisi-rischi]
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
  [#persone.FILIPPO],
  [Verbale riunione],
  [-],
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [#persone.DL],
  [Finire la transizione da "Dichiarazione di way of working" a norme di progetto. \
  (4.3, 4.4, 4.5)],
  [V.I.9.3],
), 
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Analisti],
  [Proseguire la stesura delle Norme di Progetto],
  [VI.8.2],
), 

(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [#persone.ALDO],
  [Riassumere AUM-1],
  [VI.9.1],
), 

(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [#persone.FELIX],
  [Riassumere AUM-2],
  [VI.9.1],
), 

(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [#persone.FILIPPO],
  [Riassumere AUM-3],
  [VI.9.1],
), 

(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [#persone.DT],
  [Riassumere AUM-4],
  [VI.9.1],
), 

(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [#persone.ANA],
  [Riassumere AUM-5],
  [VI.9.1],
), 

(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Davide Lorenzon],
  [Riassumere AUM-6],
  [VI.9.1],
), 

(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [#persone.ALDO],
  [Riassumere ACM-1],
  [VI.9.1],
), 

(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [#persone.ALDO],
  [Riassumere ACM-2],
  [VI.9.1],
), 

(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [#persone.DL],
  [Implementare variabile per il tracciamento automatico della versione.],
  [-],
), 

(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [#persone.ANA],
  [Ricerca tecniche di pianificazione.],
  [VI.9.2],
), 
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [#persone.DT],
  [Ricerca tecniche di preventivo.],
  [VI.9.2],
), 

(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [#persone.FELIX],
  [Ricerca metriche di qualità.],
  [VI.9.4],
), 

(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [#persone.FELIX],
  [Proseguire l’analisi dei rischi],
  [V.I.9.5],
), 
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Analista],
  [Aggiornamento del glossario con i termini di dominio del documento.],
  [-],
), 

(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Analista],
  [Aggiunta Sezione abbreviazioni al dizionario.],
  [-],
), 



  )
#utilityTable(TODO,header: ("Codice","Assegnatari","Task","Decisione di riferimento"),columns: (auto,auto,1fr,auto),)


]
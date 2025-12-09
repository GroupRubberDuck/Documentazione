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

    ([0.0.1],[#giornoRiunione.display()],[],[],[]),

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
- *Scriba*: 
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

]


#insertArabicNumberedPages("Decisioni","Verbale interno",giornoRiunione )[
= Decisioni
#let contatoreDecisioni= counter("decisioni")
#contatoreDecisioni.update(1)
#let prefisso="VI.9."

#let decisioni=(
(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [],
  [],
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
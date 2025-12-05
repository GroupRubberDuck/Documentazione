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
#let giornoRiunione = datetime(year: 2025, month: 11, day:25)
#let doctype="Verbale interno"
#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages( "Stato del documento", doctype,giornoRiunione)[
  #statusTab(
    stato: "Approvato",
    versione: "1.0.0",
    autori: ("Davide Lorenzon",),
    verificatori: ("Aldo Bettega",),
    uso: "Interno",
    destinatari: ("Tutto il gruppo",),
  )
]
#insertRomanNumberedPages("Registro Modifiche",doctype,giornoRiunione )[


  #let modifiche=(

    ([1.0.0],[#giornoRiunione.display()],[Davide Lorenzon],[Aldo Bettega],[Stesura del verbale]),
    ([1.0.0],[#giornoRiunione.display()],[Filippo Guerra],[Filippo Guerra],[Approvazione]),
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
- *Motivazione*: Riunione di fine sprint
- *Data*: #giornoRiunione.display()
- *Luogo*: Riunione su Discord
- *Ora inizio*: 15:00
- *Ora fine*: 16:30
- *Scriba*: Davide Lorenzon
- *Partecipanti*:#align(left)[
#set list(marker: [--])
- Davide Lorenzon
- Ana Maria Draghici
- Felician Mario Necsulescu
- Davide Testolin
- Filippo Guerra
- Aldo Bettega  \
]
]


#insertArabicNumberedPages("Ordine del giorno","Verbale interno",giornoRiunione )[
  = Ordine del giorno
  - Retrospettiva
  - Come migliorare
  - Come procedere

]

#insertArabicNumberedPages("Riassunto della riunione","Verbale interno",giornoRiunione )[
  = Riassunto della riunione
  La prima parte della riunione è stata dedicata all'attività di retrospettiva.

  
  Altri punti di discussione riguardavano tecniche e tecnologie per il miglioramento dei processi già implementati.

  Infine sono stati valutati i task da svolgere nel successivo periodo di avanzamento.
  
  == Retrospettiva <retr>
    Non sono state adottate tecniche particolari, ogni membro del team ha riferito le attività completate e quelle da completare.
    #align(center,link("https://www.atlassian.com/blog/teamwork/revitalize-retrospectives-fresh-techniques")[Esempi])
    Le attività non completate sono state le seguenti:
    #terms(separator:[ \ ],
      ([Definition of Done],[La formalizzazione della Definition of Done sarà molto utile per semplificare il lavoro dei verificatori ed eventualmente implementare automazioni.]),
      ([Piano di Qualifica],[Durante lo svolgimento dello Sprint 1 non vi erano informazioni sufficienti per stilarlo efficacemente.
      Si è inoltre verificato un rischio legato a persone che ha sottratto tempo utile allo studio.
      ]),
      ([Norme di progetto],[
        Aggiornamento ancora in corso, task troppo grande per le risorse allocate.
      ]),
    )

  == Automazioni <aut>
    #terms(separator:[ \ ],
      ([Trascrizione delle riunioni e stesura dei verbali],[#upper("è") stato approvato l'uso di tool AI per la trascrizione automatica delle riunioni e per la loro sintesi.   \
      Questo permette di avere velocemente un riassunto della discussione e semplificare la stesura, anche se non la automatizza totalmente]),
      ([Marcatura dei termini del glossario],[Sfruttando le funzionalità di Typst è possibile rendere automatica la marcatura #super(strong("G")) di tutte le occorrenze dei termini presenti nel Glossario]),
      ([Template dei rischi],[Predisposto e approvato un template Typst per rappresentare i rischi e le loro caratteristiche]),
      ([Template per le attività di lungo periodo],[Predisposto un template per mettere in evidenza le attività di lungo periodo e la loro scomposizione in task]),
    )
  == Prossime attività <next>
  Il gruppo ha ritenuto importanti le seguenti attività:
  - Studio del dominio.
  - Analisi dei requisiti, Diagrammi dei casi d'uso.
  - Aggiornare e raffinare le Norme di progetto.
]


#insertArabicNumberedPages("Decisioni","Verbale interno",giornoRiunione )[
= Decisioni
#let contatoreDecisioni= counter("decisioni")
#contatoreDecisioni.update(1)
#let prefisso="VI.7."

#let decisioni=(
(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Completare i task arretrati.],
  [In questo sprint sono disponibili le risorse e conoscenze necessarie],
  [@retr]
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Approvate le automazioni proposte],
  [Permettono di semplificare e alleggerire il lavoro, eliminando attività tediose e molto time consuming],
  [@aut]
),

(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Analisi dei requisiti. \ Concentrarsi sui casi d'uso.],
  [In vista dell'incontro con la proponente è utile approfondire il dominio, così da poter ricevere un feedback],
  [@next]
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Adozione di draw.io per i diagrammi di casi d'uso.],
  [Molti membri del gruppo hanno già esperienza con questo tool ed è gratuito],
  [-]
),


)

#utilityTable(decisioni,header:("Codice","Descrizione","Motivazioni","Ref."),columns:(auto,2fr,2fr,auto))

]


#insertArabicNumberedPages("TODO","Verbale interno",giornoRiunione )[

= TODO
Per rendere più significativa la tabella dei TODO vengono riportati anche i TODO legati al periodo di avanzamento precedente ma non completati.
#let prefisso="TD.8."
#let contatoreTodo= counter("todo")
#contatoreTodo.update(1)
I TODO sorti da questa riunione sono i seguenti:
#let TODO=(
  (
  [TD.7.3],
  [Stabilito in seguito],
  [Aggiornamento delle Norme di progetto],
  [VI.6.2],
),   
(
  [TD.7.5],
  [Stabilito in seguito],
  [Studio, modifica e formulazione della Definition of Done],
  [VI.6.4],
), 
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Davide Lorenzon],
  [Verbale della riunione],
  [-],
), 

(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Davide Lorenzon],
  [Aggiornamento del Piano di Progetto, preventivo dello sprint 2],
  [-],
), 
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Davide Lorenzon],
  [Sviluppo di un'automazione per la marcatura dei termini del glossario.],
  [VI.7.2],
), 
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Davide Lorenzon],
  [Integrazione dei template per il Piano di Progetto.\
  Tabella delle attività e \
  Tabella dei rischi],
  [VI.7.2],
), 
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Analista],
  [Studio dei casi d'uso],
  [VI.7.3],
), 


  )
#utilityTable(TODO,header: ("Codice","Assegnatari","Task","Decisione di riferimento"),columns: (auto,auto,1fr,auto),)


]
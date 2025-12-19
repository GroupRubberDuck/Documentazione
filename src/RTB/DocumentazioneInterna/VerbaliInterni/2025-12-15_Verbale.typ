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

#let giornoRiunione = datetime(year: 2025, month: 12, day:15)
#let doctype="Verbale interno"
#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages( "Stato del documento", doctype,giornoRiunione)[
  #statusTab(
    stato: "Approvato",
    versione: "1.0.0",
    autori: ("Felician Mario Necsulescu",),
    verificatori: ("Ana Maria Draghici",),
    uso: "Interno",
    destinatari: ("Tutto il gruppo",),
  )
]
#insertRomanNumberedPages("Registro Modifiche",doctype,giornoRiunione )[


  #let modifiche=(

    ([1.0.0],[#giornoRiunione.display()],[Felician Mario Necsulescu],[Draghici Ana Maria],[Stesura del verbale]),
    ([1.0.0],[#giornoRiunione.display()],[Felician Mario Necsulescu],[Felician Mario Necsulescu],[Approvazione])
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
- *Motivazione*: Riunione di allineamento
- *Data*: #giornoRiunione.display()
- *Luogo*: Riunione su Discord
- *Ora inizio*: 15:00;
- *Ora fine*: 16:30;
- *Scriba*: Felician Mario Necsulescu
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
  - Gestione oraria;
  - Allineamento per riunione con la proponente.

]

#insertArabicNumberedPages("Riassunto della riunione","Verbale interno",giornoRiunione )[

  = Riassunto della riunione
  La riunione ha avuto l’obiettivo di verificare lo stato di avanzamento dello sprint in corso e prepararsi in vista dell'imminente incontro con l'azienda Bluewind. I membri del team hanno presentato le attività svolte e hanno illustrato le parti di norma assegnate, condividendo eventuali dubbi emersi. Sono stati inoltre discussi l’avanzamento dell’analisi dei requisiti, lo stato della documentazione di progetto e la pianificazione dei prossimi sprint, in relazione alle disponibilità del team.
  
  == Stato di avanzamento dello sprint e attività svolte
  La riunione si è aperta con una retrospettiva in cui ogni membro ha illustrato il lavoro svolto:

  - Completamento di issue;
  - Aggiornamenti a norme di progetto;
  - Riassunti delle norme assegnate (ACM, AUM);
  - Revisione di documenti;
  - Aggiornamento di verbali;
  - Glossario;
  - Diario di bordo. 

È emerso che il lavoro procede complessivamente bene, anche se con ritmi diversi tra i membri.

  == Documentazione di progetto e strumenti di supporto
  È stato discusso l’aggiornamento dei principali documenti di progetto: norme di progetto, piano di progetto, piano di qualifica e analisi dei requisiti.
  
  In particolare:#pad(left: 1em)[

  - Il piano di progetto è in continuo aggiornamento;

  - Il piano di qualifica risulta più indietro, dunque è stata stabilita una stesura iniziale che verrà poi aggiornata con l'avanzamento dell’analisi dei requisiti;

  - L’analisi dei requisiti è in gran parte completata, ma necessita ancora di raffinamenti;

  - È stato presentato un template per automatizzare la gestione delle label e degli heading nei documenti typst, come supporto facoltativo alla stesura.
  ]
  
  == Gestione del tempo, carico di lavoro e ruoli <gestione-tempo>

  È emerso un confronto sulla gestione del tempo e sulla disponibilità oraria dei membri:#pad(left: 1em)[

  - Alcune attività sono state svolte all'ultimo senza comunicazione preventiva;

  - È stata sottolineata l’importanza di dichiarare in anticipo impegni esterni (lavoro, altri corsi, esami);

  - Si è concordata una gestione più flessibile del carico di lavoro, con sprint di durata maggiore e issue lasciate libere di assegnatario che possono essere svolte da chiunque del gruppo a seconda dei propri impegni, soprattutto in vista del periodo natalizio e degli esami;

  - È stato chiarito che una persona può ricoprire più ruoli in momenti diversi, mantenendo però la separazione tra produzione e verifica per una stessa persona.
  ]

  == Riepilogo norme e raccolta dubbi per l’azienda

  Nel corso della riunione, ciascun membro del gruppo ha presentato la parte di norma precedentemente assegnata, illustrandone i contenuti principali e le modalità di applicazione. Le esposizioni hanno consentito un allineamento comune sul quadro normativo di riferimento. 
  
  A seguito delle presentazioni, sono stati raccolti dubbi e richieste di chiarimento emersi durante lo studio delle norme, da sottoporre all’azienda nel successivo incontro.

]

#insertArabicNumberedPages("Decisioni","Verbale interno",giornoRiunione )[
= Decisioni 
#let contatoreDecisioni= counter("decisioni")
#contatoreDecisioni.update(1)
#let prefisso="VI.10."

#let decisioni=(
(

  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Stabilite misure per gestire gli impegni personali],
  [Negli sprint precedenti sono emerse alcune differenze tra le disponibilità inizialmente dichiarate e l’impegno effettivamente sostenuto da alcuni membri del team.],
  [@gestione-tempo]
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Raccogliere e condividere indicatori di qualità potenzialmente utili.],
  [A seguito del task TD.11.15 è stata decisa l'utilità di raccogliere e inserire nel PdQ alcune metriche di qualità.],
  [#underline(strong("TD.11.15"))]
),
)

#utilityTable(decisioni,header:("Codice","Descrizione","Motivazioni","Ref."),columns:(auto,2fr,2fr,auto))

]


#insertArabicNumberedPages("TODO","Verbale interno",giornoRiunione )[

= TODO

#let prefisso="TD.12."
#let contatoreTodo= counter("todo")
#contatoreTodo.update(1)
I TODO sorti da questa riunione sono i seguenti:

#let TODO=(

(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Da definire],
  [Migliorare la pianificazione considerando il rischio: impegni imprevisti ],
  [VI.10.1],
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Felician Mario Necsulescu],
  [Inizio della stesura del piano di qualifica.],
  [VI.10.2],
),

  )
#utilityTable(TODO,header: ("Codice","Assegnatari","Task","Decisione di riferimento"),columns: (auto,auto,1fr,auto),)


]
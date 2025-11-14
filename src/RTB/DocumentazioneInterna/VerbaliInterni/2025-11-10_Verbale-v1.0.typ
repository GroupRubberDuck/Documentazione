#import "/src/config.typ": *
#import template_dir + "/frontPage.typ": frontPage
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/statusTab.typ": statusTab
#import template_dir + "/utilityTable.typ": getCode, utilityTable

#show link: body => {set text(fill:blue); underline()[#body]}

#set text(size: 12pt)
#set heading(numbering: "1.1)")
#show heading.where(level: 1): set text(size: 18pt)
#show heading.where(level: 2): set text(size: 16pt)
#let giornoRiunione = datetime(year: 2025, month: 11, day: 10)

#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages( "Stato del documento", "Verbale Interno",giornoRiunione)[
  #statusTab(
    stato: "In progress",
    versione: "1.0",
    autori: ("Aldo Bettega",),
    revisori: ("Ana Maria Draghici",),
    validatori: ("Felician Mario Necsulescu",),
    uso: "Interno",
    destinatari: ("Tutto il gruppo",),
  )
]
#insertRomanNumberedPages("Registro Modifiche","Verbale interno",giornoRiunione )[


  #let header=("Versione","Data","Descrizione","Autore","Revisore","Validatore")
  #let modifiche=(

    ([1.0],[#giornoRiunione.display()],[Stesura del verbale],[Aldo Bettega],[Ana Maria Draghici],[Felician Mario Necsulescu]),
      
      ).rev()

      #utilityTable(modifiche,header:header,columns:(auto,auto,2fr,1fr,1fr,1.1fr))




]

#insertRomanNumberedPages("Indice","Verbale interno",giornoRiunione )[
#outline( depth: 2,title: "Indice")
]

#pagebreak()
  #context counter(page).update(1)


#insertArabicNumberedPages("Informazioni generali","Verbale interno",giornoRiunione )[
  = Informazioni generali
- *Tipo di riunione*: Interno
- *Motivazione*: 
- *Data*: #giornoRiunione.display()
- *Luogo*: Riunione su Discord
- *Ora inizio*: 15:00
- *Ora fine*: 17:20
- *Scriba*: Aldo Bettega
- *Partecipanti*:#align(left)[
#set list(marker: [--])
- Davide Lorenzon
- Ana Maria Draghici
- Felician Mario Necsulescu
- Davide Testolin
- Filippo Guerra
- Aldo Bettega

]
]


#insertArabicNumberedPages("Ordine del giorno","Verbale interno",giornoRiunione )[
  = Ordine del giorno
  - Migliorare la gestione dei ruoli: maggiore precisione nelle consegne dei compiti e tracciamento dei ruoli
  - Discussione della dichiarazione di way of working
  - Applicazione di un issue template per standardizzare la scrittura di queste con maggiore precisione
  - Posizionamento delle prossime milestone
]

#insertArabicNumberedPages("Riassunto della riunione","Verbale interno",giornoRiunione )[
  = Riassunto della riunione
  == Risoluzione degli argomenti dell'ordine del giorno
  - Per la rotazione dei ruoli è stato deciso di applicare questo metodo/*DA AGGIUNGERE LINK A CAPITOLO WOW*/ per una rotazione automatica ma flessibile in caso di necessità, con tracciamento tramite un foglio excel nel drive google di RubberDuck.
  - È stato esposto al gruppo il contenuto della dichiarazione di way of working, discutendone il contenuto e risolvendo varie perplessità.
  - Per rendere più professionale, chiara e standard la scrittura delle issue e per aiutare l'assegnatario nella loro comprensione in modo da risolverle al meglio, è stato deciso di provare ad applicare un issue template che dovrà essere modellato in base alle necessità del progetto e del gruppo. In merito è stato fatto uno studio approfondito leggendo vari articoli online.
  - Superata la fase di candidatura sono state fissate le prossime milestone: è stata posizionata la milestone di RTB scomponendola in sotto-milestone secondo #link("https://drive.google.com/file/d/1pveMXr-zfDxuyzZw_KPKbcDTuhFIdpOJ/view")[questa linea guida generale] (sono date indicative ma che danno un'idea per una più efficace gestione del tempo). Sono stati inoltre visti i documenti di gruppi degli anni scorsi per farsi un'idea, tramite il registro delle modifiche, della durata di questa fase.
  
  == Altre questioni emerse
  - Si è parlato del glossario e di come collegare i suoi termini nei vari documenti, arrivando alla conclusione di creare un link ad un file unico "Glossario" che contiene in ordine alfabetico i termini nel dominio del gruppo di lavoro RubberDuck. In futuro si potrà poi implementare un sistema più complesso ma efficace che aggiungerà automaticamente a piè di pagina del documento la definizione del termine presa dal Glossario.
  - Bisogna aggiornare lo script del sito affichè i documenti esposti siano visualizzati in ordine cronologico decrescente (il più recente in alto).
  - Bisogna migliorare la struttura della repo con un README descrittivo che illustra la sua architettura rendendola più familiare ad una figura esterna.
  - Si è parlato del versionamento dei documenti: come funzionano i numeri di versione e codici vari. Si è deciso di mantenere la data solo per i documenti in copia multipla (verbali e diari di bordo), mentre per gli altri è dichiarativo il titolo. La versione del documento è riportata al termine del nome del file in formato "-v0.0", la cifra più significativa identifica una versione stabile e validata, mentre la cifra meno significativa indica modifiche in corso d'opera all'interno della stessa versione.
  - Si è discusso sull'utilità di dichiarare da ora dei ruoli e in che modo: come tracciarle? in che formato? come usare ore produttive in modo corretto? che cos'è un'ora produttiva? sono rimaste come questioni aperte e da definire meglio.
  - È necessaria una revisione del way of working avendo raggiunto una certa corposità di contenuti. Bisogna inoltre aggiungere delle brevi introduzioni dichiarando a chi si rivolge e a che scopo. Bisogna incrementarlo con altre definizioni: verbale interno e verbale esterno.
  - È stata discussa la differenza tra norme di progetto e dichiarazione di way of working, è da chiarire se siano la stessa cosa o siano documenti differenti.
  - Bisogna iniziare a pensare come costruire grafici su documenti typst e quali strumenti adottare: librerie Typst? strumenti esterni e poi importare l'immagine sul documento (Gantt/PERT/WBS/UML)? Per ora la strada presa è di usare typst ma si è ancora aperti ad altre proposte per tale questione.
  - Bisogna capire che cosa sia l'Analisi dei requisiti ed iniziare a definire la sua struttura.
]


#insertArabicNumberedPages("Decisioni","Verbale interno",giornoRiunione )[
= Decisioni
#let contatoreDecisioni= counter("decisioni")
#contatoreDecisioni.update(1)
#let prefisso="VI.5."

#let decisioni=(
    ([#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],[Foglio excel per rotazione dei ruoli],[semplice ma efficace],[]),
    ([#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],[Approvazione contenuto way of working],[coerente con il pensiero del gruppo],[]),
    ([#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],[Applicare issue template],[standardizza la scrittura di issue],[]),
    ([#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],[Fissata milestone RTB],[data sensata e in linea ai consigli del prof. Vardanega e ai gruppi degli anni scorsi],[]),
    ([#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],[Documento unico per il glossario],[semplice e centralizzato],[IEEE 29148-2018 — “Requirements Engineering"]),
    ([#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],[Aggiornare script sito web],[file più recenti in rilievo],[]),
    ([#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],[Aggiornare README e repo],[maggiore ordine e chiarezza nella repo],[]),
    ([#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],[Studio e bozza della struttura dei documenti per la RTB],[avanzare verso RTB],[]),

)

#utilityTable(decisioni,header:("Codice","Descrizione","Motivazioni","Riferimenti"),columns:(auto,2fr,2fr,1fr))

]


#insertArabicNumberedPages("TODO","Verbale interno",giornoRiunione )[

= TODO
#let prefisso="TD.5."
#let contatoreTodo= counter("todo")
#contatoreTodo.update(1)
I punti da approfondire nelle prossime riunioni o in vista di esse individuati sono stati i seguenti:
#let TODO=(
  ([#getCode(prefisso:prefisso,contatore:contatoreTodo)],[Davide Testolin],[#inserisciLink(url:"https://github.com/GroupRubberDuck/Documentazione/issues/34")[Aggiornare script sito web]],[VI.5.6]),
  ([#getCode(prefisso:prefisso,contatore:contatoreTodo)],[Aldo Bettega],[#inserisciLink(url:"https://github.com/GroupRubberDuck/Documentazione/issues/31")[Aggiornamento repo], #inserisciLink(url:"https://github.com/GroupRubberDuck/Documentazione/issues/32")[Aggiornamento readme]],[VI.5.7]),
  ([#getCode(prefisso:prefisso,contatore:contatoreTodo)],[Ana Maria Draghici \ Felician Mario Necsulescu],[#inserisciLink(url:"https://github.com/GroupRubberDuck/Documentazione/issues/27")[Studio del doc. Analisi dei requisiti]],[VI.5.8]),
  ([#getCode(prefisso:prefisso,contatore:contatoreTodo)],[Davide Lorenzon \ Filippo Guerra],[#inserisciLink(url:"https://github.com/GroupRubberDuck/Documentazione/issues/28")[Studio del doc. Piano di progetto]],[VI.5.8]),
  ([#getCode(prefisso:prefisso,contatore:contatoreTodo)],[Davide Testolin \ Aldo Bettega],[#inserisciLink(url:"https://github.com/GroupRubberDuck/Documentazione/issues/29")[Studio del doc. Piano di qualifica]],[VI.5.8]),
  ([#getCode(prefisso:prefisso,contatore:contatoreTodo)],[Aldo Bettega \ Ana Maria Draghici \ Felician Mario Necsulescu],[#inserisciLink(url:"https://github.com/GroupRubberDuck/Documentazione/issues/33")[ Stesura verbale 2025-11-20]],[-]),
  )
#utilityTable(TODO,header: ("Codice","Assegnatari","Task (GitHub)","Decisione di riferimento"),columns: (auto,auto,1fr,auto),)

]
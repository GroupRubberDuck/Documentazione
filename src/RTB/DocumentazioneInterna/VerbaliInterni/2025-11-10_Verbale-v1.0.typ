// Stato della verifica
// Verifica conclus: sì / no
// Il documento è conforme: sì / no
// checklist
// 
// Correttezza grammaticale: V
// Correttezza sintattica: V
// Il contenuto è pertinente: X
// 
// 
// 
// 
// 
// 

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
    stato: "Approvato",
    versione: "1.0.0",
    autori: ("Aldo Bettega",),
    revisori: ("Ana Maria Draghici",),
    validatori: ("Felician Mario Necsulescu",),
    uso: "Interno",
    destinatari: ("Tutto il gruppo",),
  )
]
#insertRomanNumberedPages("Registro Modifiche","Verbale interno",giornoRiunione )[
  #let modifiche=(

    ([0.1.0],[#giornoRiunione.display()],[Aldo Bettega],[Ana Maria Draghici],[Stesura del verbale]),
    ([1.0.0],[#giornoRiunione.display()],[Felician Mario Necsulescu],[Felician Mario Necsulescu],[Approvazione]),
        
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
  - Miglioramento della gestione dei ruoli: maggiore precisione nell’assegnazione dei compiti e nel tracciamento delle responsabilità.
  - Discussione della dichiarazione di *Way of Working*.
  - Applicazione di un *issue template* per standardizzare e rendere più precisa la scrittura delle issue.
  - Pianificazione e posizionamento delle prossime milestone.
]

#insertArabicNumberedPages("Riassunto della riunione","Verbale interno",giornoRiunione )[
  = Riassunto della riunione
  == Risoluzione degli argomenti dell'ordine del giorno
  -  Per la *rotazione dei ruoli* è stato deciso di applicare il metodo definito nel Way of Working, che consente una rotazione automatica, ma flessibile in caso di necessità, con tracciamento tramite un foglio Excel nel Google Drive del gruppo RubberDuck.
  -  È stato presentato al gruppo il contenuto della dichiarazione di *Way of Working*, discutendone i vari punti e chiarendo le perplessità emerse.
  - Per rendere più *professionale, chiara e standardizzata* la scrittura delle issue — e per facilitare l’assegnatario nella comprensione dei compiti — è stato deciso di adottare un *issue template*, modellato sulle esigenze del progetto e del gruppo. A tal fine è stata svolta una ricerca approfondita consultando vari articoli online.
  - Una volta superata la fase di candidatura, sono state fissate le prossime *milestone*: è stata definita la milestone di RTB, scomposta in sotto-milestone secondo #link("https://drive.google.com/file/d/1pveMXr-zfDxuyzZw_KPKbcDTuhFIdpOJ/view")[queste linee guida generali]  (sono date indicative, ma che danno un'idea per una più efficace gestione del tempo). Sono inoltre stati consultati i documenti dei gruppi degli anni precedenti per valutare, tramite i registri delle modifiche, la durata media di questa fase.
.
  
  == Altre questioni emerse
  - È stato affrontato il tema del *Glossario* e della modalità di collegare i relativi termini nei vari documenti. Si è deciso di creare un unico file “Glossario” contenente, in ordine alfabetico, tutti i termini del dominio del progetto del gruppo RubberDuck. In futuro si valuterà l’adozione di un sistema più avanzato capace di aggiungere automaticamente a piè di pagina le definizioni tratte dal Glossario.
- È necessario aggiornare lo script del *sito web* affinché i documenti siano visualizzati in ordine cronologico decrescente (il più recente in cima).
- Si è discusso della necessità di migliorare la struttura della *repository*, aggiungendo un README descrittivo che ne illustri l’architettura, rendendola più comprensibile a figure esterne.
- È stato affrontato il tema del *versionamento dei documenti*: funzionamento dei numeri di versione e codici associati. È stato deciso di mantenere la data solo per documenti in copia multipla (verbali e diari di bordo), mentre per gli altri sarà sufficiente il titolo. La versione sarà indicata nel nome del file con il suffisso *“-v0.0”*, dove la cifra maggiore indica una versione stabile e validata, mentre quella minore rappresenta modifiche in corso all’interno della stessa versione.
- È stata avviata una discussione sulla possibilità di *formalizzare i ruoli*: come tracciarli, in che formato e come definire l’uso delle ore produttive. La questione resta aperta e va definita con maggior dettaglio.
- Si è evidenziata la necessità di una revisione del *Way of Working*, data la crescente quantità di contenuti: vanno aggiunte introduzioni che spieghino destinatari e scopo del documento, oltre ad ampliare le definizioni includendo “verbale interno” e “verbale esterno”.
- È stata discussa la distinzione tra *Norme di Progetto* e *Way of Working*: è necessario chiarire se siano equivalenti o documenti distinti.
- Si è introdotta la necessità di valutare strumenti per la creazione di *grafici nei documenti Typst* (Gantt, PERT, WBS, UML). Per ora si propende per l’uso diretto delle librerie Typst, pur restando aperti a soluzioni alternative.
- È necessario comprendere meglio che cosa sia l’*Analisi dei Requisiti* e iniziare a definirne la struttura.
]


#insertArabicNumberedPages("Decisioni","Verbale interno",giornoRiunione )[
= Decisioni
#let contatoreDecisioni= counter("decisioni")
#contatoreDecisioni.update(1)
#let prefisso="VI.5."

#let decisioni=(
    ([#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],[Foglio Excel per rotazione dei ruoli],[Semplice ed efficace],[]),
    ([#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],[Approvazione del contenuto Way of Working],[Coerente con il pensiero del gruppo],[]),
    ([#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],[Applicazione dell'issue template],[Standardizza la scrittura delle issue],[]),
    ([#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],[Fissata milestone RTB],[Data sensata e coerente con i consigli del prof. Vardanega e con i gruppi degli anni precedenti],[]),
    ([#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],[Documento unico per il glossario],[Soluzione semplice e centralizzata],[IEEE 29148-2018 — “Requirements Engineering"]),
    ([#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],[Aggiornamento script sito web],[Rendere più visibili i file più recenti],[]),
    ([#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],[Aggiornamento README e struttura della repo],[Maggiore ordine e chiarezza],[]),
    ([#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],[Studio e bozza della struttura dei documenti per la RTB],[Avanzamento verso la milestone RTB],[]),

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
  ([#getCode(prefisso:prefisso,contatore:contatoreTodo)],[Aldo Bettega \ Ana Maria Draghici \ Felician Mario Necsulescu],[#inserisciLink(url:"https://github.com/GroupRubberDuck/Documentazione/issues/33")[Stesura verbale 2025-11-20]],[-]),
  )
#utilityTable(TODO,header: ("Codice","Assegnatari","Task (GitHub)","Decisione di riferimento"),columns: (auto,auto,1fr,auto),)

]
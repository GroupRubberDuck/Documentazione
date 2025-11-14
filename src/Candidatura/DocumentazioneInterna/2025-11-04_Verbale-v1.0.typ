#import "/src/config.typ": *
#import template_dir + "/frontPage.typ": frontPage
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/statusTab.typ": statusTab
#import template_dir + "/utilityTable.typ": getCode, utilityTable

#set text(size: 12pt)
#set heading(numbering: "1.1)")
#show heading.where(level: 1): set text(size: 18pt)
#show heading.where(level: 2): set text(size: 16pt)
#let giornoRiunione = datetime(year: 2025, month: 11, day: 4)

#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages( "Stato del documento", "Verbale Interno",giornoRiunione)[
  #statusTab(
    stato: "In validazione",
    versione: "1.0",
    autori: ("Davide Lorenzon",),
    revisori: ("Aldo Bettega",),
    validatori: ("-",),
    uso: "Interno",
    destinatari: ("Tutto il gruppo",),
  )
]
#insertRomanNumberedPages("Registro Modifiche","Verbale interno",giornoRiunione )[


  #let header=("Versione","Data","Descrizione","Autore","Revisore","Validatore")
  #let modifiche=(

    ([1.0],[#giornoRiunione.display()],[Stesura del verbale],[Davide Lorenzon],[Aldo Bettega],[-]),
      
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
- *Motivazione*: Riunione di emergenza, a seguito della sospensione dell'aggiudicazione
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
- Aldo Bettega

]
]


#insertArabicNumberedPages("Ordine del giorno","Verbale interno",giornoRiunione )[
  = Ordine del giorno
  - Cambio della scelta del capitolato
  - Analisi delle criticità messe in evidenza dal Professor Tullio Vardanega
]

#insertArabicNumberedPages("Riassunto della riunione","Verbale interno",giornoRiunione )[

  = Riassunto della riunione
  #set enum(numbering: "1.1)",full:true)

  Gli argomenti di discussione trattati sono i seguenti:
  #list(
    [La discussione della scelta del capitolato ha messo in evidenza le opinioni del gruppo, arrivando alla conclusione che non era conveniente nella nostra situazione attuale rimanere in concorrenza per l'appalto *C7*. \
    In considerazione della disponibilità di uno slot libero relativo al capitolato *C1*, che era comunque la seconda preferenza del gruppo, si è scelto di candidarsi per suddetto appalto. 
  ],
    [Si è discusso delle carenze e criticità messe in evidenza:
    #enum(
    [Regole di rotazione dei ruoli e la tabella delle ore/persona],
    [Organizzazione della repo in modo da mettere in evidenza le baseline],
    [Comportamento del sito, apertura dei documenti in una nuova scheda],
    [Versionamento, a ogni revisione dovrebbe corrispondere una validazione],
    [Tutti i verbali (anche
quelli esterni) sono attesi riportare
decisioni prese a valle della
discussione, e le azioni tracciabili
che da esse scaturiscono]
      )
    
  ]
    )


]


#insertArabicNumberedPages("Risultato del brainstorming","Verbale interno",giornoRiunione )[
== Risultato del brainstorming 

    === Ruoli:
  - *Autore*, scrive il documento.
  - *Revisore*, prende la versione proposta dall'autore e ne migliora forma e contenuti.
  - *Validatore*, valuta il lavoro svolto sul documento ed eventualmente approva lo spostamento in done. \ Se non viene approvato, deve fornire una lista di correzioni da apportare.

  N.B.) Non vi possono essere sovrapposizioni nei ruoli, relativamente a un singolo documento.
  === Rotazione dei ruoli <Rotazione>
    *Rotazione su documenti semplici*:
  - Ogni membro del team segue una sequenza ciclica: \ Validatore → Autore → Revisore → Validatore
  - Criterio di rotazione per documenti semplici (bassa complessità e ridotto numero di pagine): #list(
    [Ogni ruolo ha cardinalità 1],
    [Vengono definite delle code per ciascun ruolo],
    [Ogni coda contiene 2 membri distinti del gruppo (nessuno può stare in 2 code)],
    [La persona che costituisce la testa della coda viene assegnata al ruolo associato alla coda],
    [Una volta completato il ciclo di vita del documento, i membri del gruppo vengono inseriti alla fine della coda del ruolo successivo]
  )
  Tale criterio garantisce che tutti i membri del gruppo attraversino tutti i ruoli e che la tupla \<Autore, Revisore, Validatore\> sia diversa rispetto a quella dei 2 documenti precedenti.
 *Rotazione su documenti complessi*:
  Per documenti più complessi vi è maggiore flessibilità, al fine di distribuire meglio il carico di lavoro:

- Gli autori possono essere assegnati come revisori/verificatori su sezioni non da loro prodotte

- Il revisore o validatore non può operare su contenuti di propria creazione

- Ogni sezione deve essere verificata da almeno un soggetto che non ha partecipato alla sua stesura

- In caso di conflitto di interessi, il rispettivo si auto-esclude dalla valutazione

Il coordinatore del documento (o responsabile, per tradurre in ruoli del progetto) è responsabile del rispetto di queste regole.


*Aggiornamenti di emergenza*

In caso si pongano in essere condizioni straordinarie che rendano necessaria una quanto più tempestiva risposta si possono ignorare i criteri sulla rotazione dei ruoli (chi può fare per primo fa), lasciando il vincolo di indipendenza  (Autore $eq.not$ Revisore $eq.not$ Verificatore) 


=== Stati del documento <Workflow>
  - *Backlog*, magazzino delle attività da svolgere, ogni documento inizia in questo stato.
  - *In progress*, il documento è stato preso in carico da un autore.
  - *In review* , il lavoro dell'autore è finito e il documento deve essere revisionato oppure il documento non è stato approvato nella fase verifica.
  - *Verifica*, il lavoro del revisore è finito e  il documento va valutato per l'approvazione.

  === Separazione tra area di rilascio e area di lavoro <separazione>
    Il gruppo si è trovato bene a lavorare usando GitHub per condividere il proprio lavoro e si è scelto di sfruttare le funzionalità di branching per attuare tale separazione.

    La scelta su quantità e funzione dei branch è stato rimandata per necessità di ulteriori analisi, con l'unica condizione di avere un branch main in cui l'unica operazione attuabile sono i rilasci corrispondente alle baseline.
]


#insertArabicNumberedPages("Decisioni","Verbale interno",giornoRiunione )[
= Decisioni
#let contatoreDecisioni= counter("decisioni")
#contatoreDecisioni.update(1)
#let prefisso="VI.4."

#let decisioni=(
    ([#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],[Aggiornare opportunamente i documenti relativi alla candidatura.],[Il gruppo ha deciso cambiare la scelta del capitolato],[]),
        ([#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],[Aggiornare il preventivo dei costi in considerazione delle criticità.],[Il gruppo ha deciso cambiare la scelta del capitolato],[]),
  ([#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],[Migliorare e ufficializzare il way of working per l'area documentale],[#upper("è") una delle criticità, un way of working chiaro e ufficiale permette di velocizzare e migliorare le attività, oltre a facilitare il miglioramento del way of working stesso],[]),
  ([#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
      [Nuovo workflow per la repo documentale],[Una delle criticità rilevate],[Descrizione più completa *#ref(<Workflow>) *]),
  ([#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
      [Cambio struttura delle cartelle],[Modifica di cui si era già parlato, anticipata e ufficializzata in seguito alla revisione della candidatura],[]),
  ([#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
    [Separazione di area di sviluppo e area di rilascio],
    [Una delle criticità messe in evidenza],[Descrizione più completa *#ref(<separazione>) *]),
  ([#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
    [Stabiliti dei criteri per la rotazione dei ruoli],
    [Una delle criticità messe in evidenza],[Descrizione più completa *#ref(<Rotazione>) *]),

)

#utilityTable(decisioni,header:("Codice","Descrizione","Motivazioni","Riferimenti"),columns:(auto,2fr,2fr,1fr))

]



#insertArabicNumberedPages("TODO","Verbale interno",giornoRiunione )[

= TODO
#let prefisso="TD.4."
#let contatoreTodo= counter("todo")
#contatoreTodo.update(1)
I punti da approfondire nelle prossime riunioni o in vista di esse individuati sono stati i seguenti:
#let TODO=(
  ([#getCode(prefisso:prefisso,contatore:contatoreTodo)],[Ana Maria Draghici \ Felician Mario Necsulescu \ Davide Lorenzon],[#inserisciLink(url:"https://github.com/GroupRubberDuck/Documentazione/issues/15")[Aggiornamento dei documenti]],[VI.4.1 \ VI.4.2]),
  ([#getCode(prefisso:prefisso,contatore:contatoreTodo)],[Aldo Bettega \ Davide Testolin],[#inserisciLink(url:"https://github.com/GroupRubberDuck/Documentazione/issues/19")[Stilare la dichiarazione di way of working, al fine di formalizzare e completare il risultato del brainstorming]],[VI.4.1 \ VI.4.3]),
    ([#getCode(prefisso:prefisso,contatore:contatoreTodo)],[Davide Testolin],[#inserisciLink(url:"https://github.com/GroupRubberDuck/Documentazione/issues/21")[Cambiare la struttura delle cartelle e gestire l'integrazione]],[VI.4.5 ]),
      ([#getCode(prefisso:prefisso,contatore:contatoreTodo)],
      [Aldo Bettega \ Davide Testolin],
      [#inserisciLink(url:"https://github.com/GroupRubberDuck/Documentazione/issues/20")[Approfondire la ristrutturazione a branch del repository]],
      [VI.4.6 \ VI.4.3]),
        ([#getCode(prefisso:prefisso,contatore:contatoreTodo)],
      [Aldo Bettega],
      [#inserisciLink(url:"https://github.com/GroupRubberDuck/Documentazione/issues/22")[Analizzare e ufficializzare le regole per l'alternanza dei ruoli]],
      [VI.4.7 \ VI.4.3]),
        ([#getCode(prefisso:prefisso,contatore:contatoreTodo)],
      [],
      [#inserisciLink(url:"https://github.com/GroupRubberDuck/Documentazione/issues/23")[Produrre il documento Dichiarazione di way of working]],
      [VI.4.3]),
        ([#getCode(prefisso:prefisso,contatore:contatoreTodo)],
      [Davide Lorenzon],
      [#inserisciLink(url:"https://github.com/GroupRubberDuck/Documentazione/issues/24")[Stilare verbale della riunione]],
      [-]),
  
  
  )
#utilityTable(TODO,header: ("Codice","Assegnatari","Task (GitHub)","Decisione di riferimento"),columns: (auto,auto,1fr,auto),)

]
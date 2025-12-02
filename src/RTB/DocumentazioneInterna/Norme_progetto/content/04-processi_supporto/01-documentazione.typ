#set heading(numbering: "1.1)")
#set footnote.entry(
  separator: repeat[.],
  indent: 0em
)
Il processo di documentazione ha lo scopo di registrare le informazioni prodotte da processi primari. 

Permette di tracciare più facilemente le decisioni intraprese, evitare fraintendimenti, favorire l'organizzazione del lavoro asincrono.

Le attività costituenti di questo processo sono le seguenti:
#enum(numbering: "1.1)",
  [Implementazione del processo ],
  [Progettazione e sviluppo],
  [Produzione],
  [Manutenzione],
)

=== Strumenti di supporto
#list(
  [
    *Typst*: \ Linguaggio di markup moderno per la composizione e la tipografia di documenti, pensato come alternativa più semplice e veloce a LaTeX. \
    Ha una sintassi più intuitiva e supporta automazioni tramite template, funzioni e regole di stile riutilizzabili. \
    La caratteristica più utile è la preview istantanea del documento.
  ],
  [
    *GitHub*: \
    Il gruppo ha deciso di usare GitHub come strumento di condivisione del lavoro e il suo sistema di issue tracking system per l'assegnazione delle attività.
    Viene inoltre usata una GitHub action per la compilazione automatica dei documenti.
    Tutta la documentazione è reperibile nel seguente #link("https://github.com/GroupRubberDuck/Documentazione")[repository].
    #upper("è") stato predisposto un sito web, sfruttando la funzionalità GitHub pages per facilitare la consultazione della documentazione.
  ],
)
=== Posizione del Documento
I documenti sono salvati su un apposito repository.

Il path relativo è ricavabile nel seguente modo:
 \ (Fanno eccezione i diari di bordo, in quanto fanno parte delle regole di progetto, ma non fanno supporto ad alcun processo primario, perciò sono salvati nella cartella *./\<Type\>src/DiariDiBordo*)

#align(center)[
*./\<Type\>/\<Milestone\>/\<Destinatari\>/\<Cartella del Documento\>*

]

#terms(separator:[: \ ], hanging-indent:2em,
  ([Type],[ - *src* per i file in formato typst. \
  - *output* per i pdf.
  ]),
  ([Milestone],[- *RTB* per i documenti allo stato della RTB. \
                - *PB* per i documenti allo stato della PB.]),
  ([Destinatari],[- DocumentazioneInterna per i documenti ad uso interno. \
                  - DocumentazioneEsterna per i documenti ad uso esterno.]),
  ([Cartella del Documento],[ 
    - VerbaliInterni
    - VerbaliEsterni
    - Per documenti complessi coincide con il nome del documento #footnote()[
      Per motivi di manutenibilità e facilità di aggiornamento i contenuti del file sono stati divisi in più file quando una loro sezione diventa eccessivamente corposa.
    ]
    ]),
)


=== Identificazione dei documenti <Identificazione>
  #upper("è") una fase di pianificazione. \
  Quasi ogni documento viene identificato dalle seguenti caratteristiche

  #enum(numbering: "a-",
  [Titolo],
  [Scopo],
  [Destinatari],
  [
    Procedure e responsabilità nell'attività di documentazione.
    #terms(separator: ": ",
      ([Input],[Quali dati servono per scriverlo]),
      ([Sviluppo],[Chi lo redige]),
      ([Verifica],[Chi lo controlla]),
      ([Modifica],[Chi può aggiornarlo]),
      ([Approvazione],[Chi lo approva]),
      ([Produzione],[Come viene prodotto]),
      ([Archiviazione e distribuzione],[Strumenti e tecniche]),
      ([Manutenzione e gestione della configurazione],[Versioni, tracciabilità]),
    )
  ],
  [Pianificazione di revisioni intermedie e finali],
  )

==== Informazioni comuni <informazioni_comuni>


Ogni documento presenta una sezione iniziale standardizzata per tutti i membri del team. 
Questa sezione viene generata utilizzando un apposito template centrale e unico, al fine di garantire coerenza e facilitare la compilazione. 

La sezione iniziale è composta dai seguenti elementi: 

*1. Pagina di copertina* contenente il titolo del documento, il nome e il logo del gruppo e le relative informazioni di contatto.

*2. Tabella dello stato * che riassume lo stato del documento e informazioni generali quali versione, autori, verificatori, uso e destinatari.

*3. Registro delle modifiche * costituito da una tabella contenente le informazioni sul versionamento e sulla tracciabilità.

*4. Indice dei contenuti * aggiornato automaticamente  tramite sintassi Typst.

*5. Indice delle immagini e delle tabelle* presente solo nei documenti che ne contengono. 

==== Elenco dei documenti
#outline( target: figure.where(kind: "Documenti"), title: none)


#figure(kind:"Documenti",supplement: "Documento", caption:"Verbali")[
#align(left)[
  ==== Verbali
#terms(separator:": ", indent: 0em, hanging-indent: 1em, tight: false,
  ([Titolo],[Verbale riunione _data della riunione_ .]),
  ([Scopo],[Ha una finalità riassuntiva della riunione mettendo in evidenza l'agenda, le decisioni e le attività identificate (TODO).]),
  ([Destinatari],[Membri del gruppo, se il verbale è esterno anche la proponente, BlueWind.]),
  ([Procedure e responsabilità],[Per la redazione del documento è necessario un riassunto della riunione (ottenuto sia da appunti presi manualmente, sia dalla trascrizione da parte di tool AI). \
  La redazione è a carico del Responsabile e la verifica a carico del verificatore.
  L'approvazione è a carico del responsabile. \
  ]),
  ([Revisioni],[Il verbale viene revisionato e approvato quando pronto]),
  ([Struttura],[#enum( numbering: "1.1)",full: true, start:0,
    [Informazioni Comuni #ref(<informazioni_comuni>)],
    [Informazioni Generali \ 
    Data e luogo della riunione, orario di inizio e fine, partecipanti, Scriba della riunione, motivo della riunione. 
    ],
    [Ordine del giorno],
    [Riassunto della riunione],
    [Decisioni],
    [TODO],
  )]),
)
]


]
#pagebreak()



#figure(kind:"Documenti",supplement: "Documento", caption:"Diario di Bordo")[
#align(left)[
==== Diario di Bordo
Nell’ambito del progetto di Ingegneria del Software, il Prof. Tullio Vardanega ha previsto delle attività volte ad accertare, in maniera condivisa, lo stato di progresso per ogni gruppo.
#terms(separator:": ", indent: 0em, hanging-indent: 1em, tight: false,
  ([Titolo],[Diario di bordo _data_.]),
  ([Scopo],[Permette ai gruppi di avere un feedback sulle attività svolte e di portare all'attenzione di tutti i dubbi sulle attività di processo]),
  ([Destinatari],[Prof. Tullio Vardanega, altri gruppi.]),
  ([Procedure e responsabilità],[
  La redazione è a carico del Responsabile e la verifica a carico del verificatore.
  L'approvazione è a carico del responsabile.
  I diari di bordo sono salvati nella sezione src/DiariDiBordo/Data Data_Diario_di_bordo.typ\
  ]),
  ([Revisioni],[Revisonato e approvato entro ]),
  ([Struttura],[#enum( numbering: "1.1)",full: true, start:1,
    [Principali traguardi raggiunti],
    [Attività da completare],
    [Difficoltà incontrate],
    [Principali dubbi],

  )]),
)
]


]
#pagebreak()


#figure(kind:"Documenti",supplement: "Documento", caption:"Piano di Progetto")[
#align(left)[

==== Piano di Progetto
#terms(separator:": ", indent: 0em, hanging-indent: 1em, tight: false,
  ([Titolo],[Piano di Progetto]),
  ([Scopo],[Documento necessario ad attuare uno sviluppo plan-driven. \ 
  Le principali informazioni che contiene sono l'ambito del progetto, preventivo iniziale, risorse disponibili, analisi e piano di gestione dei rischi, suddivisione e scheduling del lavoro.]),
  ([Destinatari],[Interni, esterni ( BlueWind s.r.l. , professori )]),
  ([Procedure e responsabilità],[
    La redazione del documento è in carico al responsabile, ? analista per l'analisi dei rischi ?.
    La verifica è a carico del verificatore.
    L'approvazione è a carico del responsabile.
    Il piano di progetto è salvato nel seguente path src/RTB/DocumentazioneEsterna/Piano_di_progetto-vx.y.z.typ
  ]),
  ([Revisioni],[Sono previste revisioni intermedie al termine di ogni periodo e un'approvazione finale per la RTB.]),
)
]


]
#pagebreak()
#figure(kind:"Documenti",supplement: "Documento", caption:"Analisi dei Requisiti",)[
#align(left)[
==== Analisi dei Requisiti
#terms(separator:": ", indent: 0em, hanging-indent: 1em, tight: false,
  ([Titolo],[Analisi dei Requisiti]),
  ([Scopo],[

  ]),
  ([Destinatari],[

  ]),
  ([Procedure e responsabilità],[
    
  ]),
  ([Revisioni],[

  ]),
)
]


]
#pagebreak()
#figure(kind:"Documenti",supplement: "Documento", caption:"Verbali")[
#align(left)[

]


]
#pagebreak()



=== Progettazione dei documenti
Ogni documento identificato all'interno dello sviluppo software deve rispettare alcuni standard di documentazione uguali per tutti: 
#pad(left: 1em)[
  - Essere in formato A4; 
  - I contenuti inseriti devono essere coerenti con lo scopo del documento stesso, definito nella sezione #ref(<Identificazione>) di questo documento;
  - Tutti i documenti devono includere un indice dei contenuti e delle relative sottosezioni visibile all'inizio (ad eccezione del diario di bordo, che ne è esentato);
  - Ogni pagina deve contenere nell'header e nel footer:
   1. La sezione corrente del documento (in alto a sinistra);
   2. Il nome del gruppo (in alto a destra);
   3. Il titolo del documento (in basso a sinistra);
   4. Il numero della pagina : espresso in numeri romani per la prefazione e in numeri arabi per le pagine del corpo del documento. 
]
Per la redazione dei documenti è corretto e necessario fare riferimento a fonti autorevoli e aggiornate, quali standard ISO, università e organizzazioni ufficialmente riconosciute, materiale didattico e link di approfondimento forniti durante il corso. Eventuali informazioni provenienti da altre fonti, se ritenute utili, devono essere obbligatoriamente verificate per accertarne la correttezza e l'affidabilità.


=== Produzione 
I documenti vengono ricompilati automaticamente in PDF tramite GitHub Action e sono consultabili da tutti i membri del team.
Sono disponibili nella repository del gruppo dedicata alla #link("https://github.com/GroupRubberDuck/Documentazione")[Documentazione].  

Per facilitarne la consultazione è inoltre possibile accedere al  #link("https://grouprubberduck.github.io/Documentazione")[sito web ufficiale] del gruppo, creato appositamente per visualizzare e navigare i documenti in modo più immediato.

La versione del documento e la tracciabilità delle modifiche sono gestite tramite il Registro delle Modifiche, integrato direttamente all’interno di ciascun documento.


=== Manutenzione 

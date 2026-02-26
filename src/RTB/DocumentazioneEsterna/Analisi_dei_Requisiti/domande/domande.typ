#import "/src/config.typ":template_dir
#import template_dir+"/diarioTemplate.typ": slides
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label

// #show: slides.with(
//     numero: 7,
//   data: "08-01-2026",
// ) 
// #set page(paper:"a4")
#import template_dir + "/setUpPageLayout.typ": insertArabicNumberedPagesSenzaData


#insertArabicNumberedPagesSenzaData(PageTitle: "Dubbi", documentType: "Dubbi")[

= Dubbi
Quanto devo andare a fondo nella scomposizione degli use case, dovrei mettere un use case per ogni interazione o inserimento di informazione


= Contesto
Per aiutarmi a capire come non fare cavolate, mi serve un parere. 
Come esempio uso l'importazione di informazione dai file.

Ogni file contiene le informazioni di uno o più asset, per ogni asset devono essere fornite tutta una serie di informazioni

I file devono essere in formato json,xml o csv.

= Cosa fa l'utente
Qua descrivo tutti i passaggi che avvengono (diverso dallo scenario principale)



+ L'utente seleziona i file da importare
+ Il sistema fa controlli di validità sul file 
  - Generici: file non vuoto, estensione, dimensione accettabile
  - Specifici, ogni file deve avere una specifica struttura
+ Le informazioni prive di errori vengono importante
+ Viene mostrato un riepilogo con le informazioni importate correttemente e quali no, con rispettivo errore
+ Nel riepilogo si mostrano anche i conflitti

+ I conflitti si possono gestire in vari modi, inserimento manuale delle info, accettare una versione specifica o fare fast forward e accettare la più recente


Ho scomposto in questi casi d'uso

#enum(
  numbering: "UC1.1-",
  [
    Importazione di una lista di file
    + Errore nel processo del merge
  ],
  [
    Importazione di un singolo file
    + Errore nell'importazione
  ],
  [Visualizzazione del riepilogo],
  
  [
    Gestione dei conflitti
    + Visualizza lista conflitti
      + Visualizza conflitto
        + Risolvi conflitto
          - fast forward
          - accetta specifico
          - inserimento manuale
          - scarta tutto
        + Visualizza i dettagli (sarebbero use case singoli ma non saprei cosa inserire)
  ],
)

#image("/src/RTB/DocumentazioneEsterna/Analisi_dei_Requisiti/immagini/UC3.drawio.png")

La numerazione è a caso

Le sezione inclusioni ed estensioni è vuota perché non li inserisco prima di aver deciso i codici della numerazione
#let base-level=2
= Importazione


#use-case-template(
    codice:"UC-03",
    nome:"Importazione documenti tecnici",
    livello-intestazione:base-level,
    attore-principale:"Utente",
    scenario-principale:[
      + L'utente seleziona uno o più file da importare
      + Per ogni file importato
        + Il sistema importa le informazioni contenute nel singolo documento tecnico
        + Il sistema registra l'esito dell'importazione
      + Il sistema unisce i dati estratti
      + L'utente visualizza un riepilogo delle informazioni caricate #sym.arrow 
    ],
    pre-condizioni:[
      - L'utente è autenticato correttamente
      ],
    post-condizioni:[
      - Il sistema ha caricato correttamente le informazioni contenute nel documento 
      ],
    scenari-alternativi:[
      - Vi sono conflitti tra i file caricati #sym.arrow
      - L'utente annulla l'importazione #sym.arrow
      ],
    trigger:[L'utente seleziona la funzionalità di importazione dei file contenti la specifica tecnica degli asset],
    inclusioni:[
      - 
],
    estensioni:[
      - 
      ],
    generalizzazioni:none,    

)

#use-case-template(
    codice:"UC-03.1",
    nome:"Annullamento importazione",
    livello-intestazione:base-level+1,
    attore-principale:"Utente",
    scenario-principale:[
      + Il sistema annulla il processo di importazione
      + Il sistema libera le risorse
    ],
    pre-condizioni:[
      - L'utente ha iniziato un'importazione
      - L'utente annulla l'importazione

      ],
    post-condizioni:[
      - Il sistema non ha caricato alcuna informazione
      - L'utente torna alla dashboard
      ],
)

#use-case-template(
    codice:"UC-03.2",
    nome:"Errore nel merge delle informazioni",
    livello-intestazione:base-level+1,
    attore-principale:"Utente",
    scenario-principale:[
      + Il sistema sospende l'importazione delle informazione soggette a un conflitto
    ],
    pre-condizioni:[
      - L'utente ha iniziato un'importazione
      - I file sono stati importati correttamente
      - Vi sono informazioni conflittuali tra 2 o più file o con le informazioni già caricate nel sistema

      ],
    post-condizioni:[
      - Il caricamento delle informazioni è sospeso 
      - L'utente visualizza un messaggio di errore esplicativo
      - L'utente può scegliere di risolvere i conflitti o annullare l'importazione
      ],
)



#use-case-template(
    codice:"UC-04",
    nome:"Importazione singolo documento tecnico",
    livello-intestazione:base-level,
    attore-principale:"Utente",
    scenario-principale:[
      + Il sistema esegue controlli generici di validità sui file 
      + Il sistema interpreta il file 
      + Il sistema salva internamente le informazioni lette dai file 
    ],
    pre-condizioni:[
      - L'utente è autenticato correttamente
      ],
    post-condizioni:[
      - Il sistema ha caricato correttamente le informazioni contenute nel documento 
      ],
    scenari-alternativi:[
      - L'utente seleziona un file non valido #sym.arrow
      ],
    inclusioni:[
      - 
    ],
    estensioni:[
      - 
      ],
    generalizzazioni:none,    
)


#use-case-template(
    codice:"UC-04.1",
    nome:"Errore file non valido",
    livello-intestazione:base-level+1,
    attore-principale:"Utente",
    scenario-principale:[
      + Il sistema annulla il caricamento delle informazioni dal file
    ],
    pre-condizioni:[
      - L'utente è autenticato correttamente
      - L'utente ha selezionato per l'importazione un file non valido per una delle seguenti ragioni #footnote[Sta roba non so dove metterla, ma sono sicuro al 99% che non vada qua]:
        - Formato non valido 
        - File troppo grande
        - File vuoto
        - Struttura interna non valida
      ],
    post-condizioni:[
      - Il sistema ha annullato il caricamento delle informazioni del file
      - L'utente vede un messaggio di errore
      ],

)



#use-case-template(
    codice:"UC-05",
    nome:"Importazione singolo documento tecnico .json",
    livello-intestazione:base-level,
    attore-principale:"Utente",
    scenario-principale:[
      + L'utente ha importato un file json
    ],
    pre-condizioni:[
      - L'utente è autenticato correttamente
      ],
    post-condizioni:[
      - Il sistema ha caricato correttamente le informazioni contenute nel documento 
      ],    
)

#use-case-template(
    codice:"UC-06",
    nome:"Importazione singolo documento tecnico .xml",
    livello-intestazione:base-level,
    attore-principale:"Utente",
    scenario-principale:[
      + L'utente ha importato un file json
    ],
    pre-condizioni:[
      - L'utente è autenticato correttamente
      ],
    post-condizioni:[
      - Il sistema ha caricato correttamente le informazioni contenute nel documento 
      ],    
)

#use-case-template(
    codice:"UC-07",
    nome:"Importazione singolo documento tecnico .csv",
    livello-intestazione:base-level,
    attore-principale:"Utente",
    scenario-principale:[
      + L'utente ha importato un file json
    ],
    pre-condizioni:[
      - L'utente è autenticato correttamente
      ],
    post-condizioni:[
      - Il sistema ha caricato correttamente le informazioni contenute nel documento 
      ],    
)

#use-case-template(
    codice:"UC-08",
    nome:"Visualizza lista conflitti",
    livello-intestazione:base-level,
    attore-principale:"Utente",
    scenario-principale:[
      + Per ogni conflitto
        L'utente vede i dettagli del conflitto 
    ],
    pre-condizioni:[
      - L'utente è autenticato correttamente
      - Il sistema ha registrato dei conflitti
      ],
    post-condizioni:[
      - L'utente vede tutti i conflitti tra gli asset
      ],
    trigger:[L'utente seleziona la funzionalità di visualizzazione dei conflitti],
    inclusioni:[
      - 
],
    estensioni:[
      - 
      ],

)

#use-case-template(
    codice:"UC-09",
    nome:"Visualizza dettaglio del conflitto",
    livello-intestazione:base-level,
    attore-principale:"Utente",
    scenario-principale:[
      + L'utente visualizza il campo che crea conflitti
      + L'utente vede i file interessati
      + L'utente vede i valori dei dati che hanno generato il conflitto
    ],
    pre-condizioni:[
      - L'utente è autenticato correttamente
      - Il sistema ha registrato dei conflitti
      ],
    post-condizioni:[
      - L'utente vede tutti i conflitti tra gli asset
      ],
    trigger:[L'utente seleziona la funzionalità di visualizzazione dei conflitti],
    inclusioni:[
      - 
],
    estensioni:[
      - 
      ],

)

#use-case-template(
    codice:"UC-09",
    nome:"Risolvi conflitto",
    livello-intestazione:base-level,
    attore-principale:"Utente",
    scenario-principale:[
      + L'utente risolve il conflitto
      + Il sistema salva le modifiche apportate
    ],
    pre-condizioni:[
      - L'utente è autenticato correttamente
      - Il sistema ha registrato dei conflitti
      - L'utente sta visualizzando il dettaglio del conflitto
      ],
    post-condizioni:[
      - Il conflitto viene rimosso dalla lista dei conflitti
      ],
    trigger:[L'utente seleziona la funzionalità di risoluzione dei conflitti durante la visualizzazione del dettaglio del conflitto],
    inclusioni:[
      - 
],
    estensioni:[
      - 
      ],

)

#box(fill:red, inset: 2em)[
  #text(fill: white)[Non ho capito come scrivere la descrizione testuale di una generalizzazione, ci ho provato con l'import del file, ma non lo rifaccio qua.
  
  Cosa so
  - Le precondizioni devono essere uguali o più forti
  - Le post condizioni devono essere uguali o più rilassate
  Non so 
  - Come scrivere lo scenario principale
  - Come segnarle nello use case padre
  ]
]

#use-case-template(
    codice:"UC-10",
    nome:"Visualizza riepilogo importazione",
    livello-intestazione:base-level,
    attore-principale:"Utente",
    scenario-principale:[
      + L'utente riepilogo di visualizzazione
      + L'utente vede i file importati
      + L'utente vede un indice delle informazioni estratte
      + L'utente vede quali errori ci sono stati nell'importazione
      + L'utente vede quali conflitti ci sono stati nell'importazione

    ],
    pre-condizioni:[
      - L'utente è autenticato correttamente
      - L'utente ha eseguito almeno un'importazione 
      ],
    post-condizioni:[
      - L'utente vede il riepilogo dell importazioni
      ],
    trigger:[L'utente seleziona la funzionalità di visualizzazione del riepilogo delle importazioni],
    inclusioni:[
      - 
],
    estensioni:[
      - 
      ],

)



]
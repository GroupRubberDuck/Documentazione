#import "/src/config.typ": inserisciLink, template_dir

// Configurazione globale per i blocchi di codice (i campi `nome`)
#show raw: it => box(
  fill: rgb("#f4f4f4"),
  stroke: 0.5pt + luma(200),
  inset: (x: 4pt, y: 2pt),
  radius: 2pt,
  text(font: ("Courier New", "monospace"), size: 9pt, it.text)
)

#let tabella_schema(titolo, ..righe) = {
  block(width: 100%, breakable: false)[
    // Set locale: influisce solo su questa tabella
    #set text(font: ("Arial", "Helvetica", "sans-serif"), size: 10pt)
    #set align(left)
    
    #text(weight: "bold", fill: luma(80), size: 11pt)[#titolo]
    #v(2pt)
    #line(length: 100%, stroke: 0.5pt + luma(200))
    #v(4pt)
    
    #table(
      columns: (auto, auto, 1fr),
      stroke: 0.5pt + luma(200),
      // Intestazione con colore crema e testo grassetto
      fill: (x, y) => if y == 0 { rgb("#f4f4ec") } else { none },
      inset: 8pt,
      align: horizon,
      [*Campo*], [*Tipo BSON*], [*Descrizione*],
      ..righe
    )
  ]
}


== Schema dati <vista-dati>
In questa sezione viene illustrata l'organizzazione logica dei dati all'interno del database MongoDB.

A differenza dei sistemi relazionali tradizionali, *MongoDB* è un database *NoSQL* orientato ai documenti che adotta intrinsecamente una natura *schema-flexible*.
\ Questa scelta architetturale è motivata dalla necessità di gestire strutture dati gerarchiche e variabili (come gli alberi decisionali e le liste di asset), che risulterebbero eccessivamente rigide e onerose da gestire in termini di join all'interno di uno schema SQL classico.

Per la modellazione visiva, non essendo i diagrammi Entity-Relationship (ER) idonei a rappresentare l'annidamento e il polimorfismo dei documenti, si è scelto di adottare il formalismo di  #inserisciLink(url: "https://grouprubberduck.github.io/Documentazione/output/")[Hackolade].
Tale standard industriale permette di descrivere con precisione la gerarchia dei campi, i tipi di dato BSON e le relazioni di inclusione (embedding), garantendo una documentazione chiara e allineata alle best practice del settore.

L'architettura dei dati si basa su due collection principali, progettate per separare le definizioni normative dalle istanze operative:

- *Collection "Modelli"*: funge da catalogo dei template di valutazione. Contiene le definizioni degli standard e la logica statica degli alberi decisionali.

- *Collection "Dispositivi"*: rappresenta il registro dinamico dei dispositivi censiti. Memorizza lo stato delle valutazioni, le risposte fornite e il legame con gli asset specifici, mantenendo il riferimento al modello normativo di appartenenza.

=== Schema Dati Dispositivo
Il documento Dispositivo rappresenta l'entità centrale del sistema, in quanto oggetto diretto della valutazione di conformità. La sua modellazione adotta una struttura gerarchica che rispecchia la scomposizione fisica e funzionale dell'oggetto analizzato, organizzando i dati in tre blocchi logici principali:

1. *Header Identificativo e Tecnico (Root Node)* : Rappresenta il punto d'ingresso del documento e contiene le informazioni anagrafiche e tecniche generali.

2. *Sub-documenti degli Asset (Nodi Figli)*: Invece di una struttura piatta, il documento utilizza un array di oggetti (lista_asset) per modellare le componenti o funzionalità del dispositivo (es. modulo Wi-Fi, interfaccia web). Ogni asset contiene: *Metadati dell'Asset* e l'*ambito di Valutazione*.
3. *Registro delle Valutazioni* (Nodi Terminali): Situato all'interno di ogni asset, l'array lista_valutazioni raccoglie gli esiti dei requisiti applicati.


#figure(caption:"Schema dati dispositivo")[
  #image("/src/PB/DocumentazioneEsterna/Specifica_Tecnica/images/schema_dati_dispositivo.drawio.png")
]

// SCHEMA DISPOSITIVO ROOT
#figure(
  caption: [Schema dati Root --- Dispositivo (Dispositivo)],
  
)[
  #tabella_schema(
    "Root --- Dispositivo (Dispositivo)",
    
    [`_id`], 
    [ObjectId], 
    [Identificativo univoco del dispositivo generato automaticamente dal database.],

    [`nome_dispositivo`], 
    [string], 
    [Nome mnemonico assegnato dall'utente al dispositivo. Deve essere non vuoto.],

    [`os_dispositivo`], 
    [string], 
    [Sistema operativo o firmware installato.],

    [`descrizione_dispositivo`], 
    [string], 
    [Testo libero descrittivo del dispositivo.],

    [`ref_modello`], 
    [document], 
    [Sub-documento con i metadati del modello di riferimento usato per la valutazione. Contiene i campi `id_modello`, `nome_modello` e `versione_modello`.],

    [`lista_asset`], 
    [array], 
    [Elenco degli asset associati al dispositivo. Può essere vuoto. Ogni elemento è un sub-documento `asset`.]
  )
]
\ 
// schema ref_modello
#figure(
  caption: [Schema dati Sub_documento --- ref_modello (Dispositivo)],
)[
  #tabella_schema(
    "Sub_documento --- ref_modello (Dispositivo)",
    
    [`id_modello`], 
    [string], 
    [Identificativo del modello di riferimento nel sistema esterno.],

    [`nome_modello`], 
    [string], 
    [Nome leggibile del modello.],

    [`versione_modello`], 
    [string], 
    [Versione del modello applicata alla valutazione (es. `"1.0"`, `"2.3"`).]
  )
]
// schema lista_asset
#figure(
  caption: [Schema dati Sub-documento ---- Lista_asset[N] (Dispositivo)],
)[
  #tabella_schema(
    "Sub-documento ---- Lista_asset[N] (Dispositivo)",
    
    [`id_asset`], 
    [string], 
    [ID generato a livello applicativo per identificare univocamente l'asset all'interno del dispositivo.],

    [`nome_asset`], 
    [string], 
    [Nome descrittivo dell'asset.],

    [`descrizione_asset`], 
    [string], 
    [Testo libero descrittivo dell'asset.],

    [`tipo_asset`], 
    [enum #footnote[Il tipo `enum` non è un tipo BSON nativo: viene implementato a livello applicativo come `string`, con la validazione dei valori ammessi delegata alla Business Logic.] ], 
    [Categoria dell'asset. Valori ammessi: `security`, `network`.],

    [`lista_valutazioni`], 
    [array], 
    [Elenco delle risposte fornite per questo asset. Può essere un array vuoto `[]`. Ogni elemento è un sub-documento _valutazione_.]
  )
]


// schema lista_valutazioni
#figure(
  caption: [Schema dati Sub_documento --- Lista_valutazioni [N] (Dispositivo)],
)[
  #tabella_schema(
    "Sub_documento --- Lista_valutazioni [N] (Dispositivo)",
    
    [`id_requisito`], 
    [string], 
    [Riferimento al codice del requisito presente nel modello.],

    [`valutazione`], 
    [dictionary], 
    [Contiene la chiave `value` con l'esito finale della valutazione. Valori ammessi: `PASS`, `FAIL`, `NA`.],

    [`valutazione.key`], 
    [string], 
    [Chiave del dizionario valutazione (es. la stringa `"value"`).],

    [`valutazione.value`], 
    [bool], 
    [Valore booleano associato alla chiave. Rappresenta l'esito `0` (falso / FAIL / NA) o `1` (vero / PASS).],

    [`giustificazione`], 
    [string], 
    [Testo descrittivo della motivazione inserito dall'utente. *Obbligatorio* quando `valutazione.value` è `FAIL` o `NA`. Opzionale per esito `PASS`.]
  )
]

=== Schema dati Modello
La collection "Modelli" funge da catalogo statico (sola lettura durante le valutazioni) e contiene la definizione strutturale degli standard normativi. A differenza del documento Dispositivo, che è orientato allo stato, il Modello è orientato alla logica e alla gerarchia dei requisiti.

La struttura è divisa in due componenti principali:

+ *Metadata del Modello*: Informazioni di versionamento e identificazione.

+ *Albero dei Requisiti*: Un array di oggetti complessi che definiscono non solo il testo della norma, ma anche la logica decisionale (nodi e archi) necessaria per guidare l'utente verso un esito.

#figure(caption:"Schema dati modello")[
  #image("/src/PB/DocumentazioneEsterna/Specifica_Tecnica/images/schema_dati_modello.drawio.png")
]
// SCHEMA MODELLO ROOT
#figure(
  caption: [Schema dati Root --- Modello (Modello)],
)[
  #tabella_schema(
    "Root --- Modello (Modello)",
    
    [`_id`], 
    [ObjectId], 
    [Identificativo univoco del modello.],

    [`nome_modello`], 
    [string], 
    [Nome dello standard (es. "ETSI EN 303 645").],

    [`versione_modello`], 
    [string], 
    [Identificativo della versione del modello.],

    [`is_default`], 
    [bool], 
    [Flag che indica se il modello è quello predefinito per le nuove valutazioni.],

    [`lista_requisiti`], 
    [array], 
    [Elenco dei requisiti che compongono la normativa. Ogni elemento è un sub-documento `requisito`.]
  )
]

// SCHEMA REQUISITO
#figure(
  caption: [Schema dati Sub_documento --- lista_requisiti [N]  (Modello) ],
)[
  #tabella_schema(
    "Sub_documento --- lista_requisiti [N]  (Modello)",
    
    [`codice_requisito`], 
    [string], 
    [Identificativo testuale del requisito (es. "4.3-1").],

    [`nome_requisito`], 
    [string], 
    [Titolo sintetico del requisito.],

    [`descrizione_requisito`], 
    [document], 
    [Contiene i testi estesi: `descrizione_norma_requisito` e `descrizione_target_requisito`.],

    [`nodo_root`], 
    [document], 
    [Il punto di inizio dell'albero decisionale per questo requisito. Può essere un `nodo_decisione` o un `nodo_foglia`.],

    [`lista_dipendenze`], 
    [array], 
    [Elenco di `codice_requisito` che devono essere soddisfatti prima di poter valutare questo elemento.]
  )
]

// SCHEMA NODO DECISIONALE
#figure(
  caption: [Schema dati Sub_documento --- Nodo_decisione (Modello)],
)[
  #tabella_schema(
    "Sub_documento --- Nodo_decisione (Modello)",
    
    [`nodo_decisione_codice`], 
    [string], 
    [Codice identificativo del nodo logico.],

    [`nodo_decisione_domanda`], 
    [string], 
    [Testo della domanda da porre all'utente.],

    [`nodo_figlio_si`], 
    [document], 
    [Riferimento al nodo successivo in caso di risposta affermativa (struttura ricorsiva).],

    [`nodo_figlio_no`], 
    [document], 
    [Riferimento al nodo successivo in caso di risposta negativa (struttura ricorsiva).]
  )
]

// SCHEMA NODO FOGLIA (ESITO)
#figure(
  caption: [Schema dati Sub_documento --- Nodo_foglia (Documento)],
)[
  #tabella_schema(
    "Sub_documento --- Nodo_foglia (Documento)",
    
    [`esito`], 
    [enum], 
    [Stato finale del percorso logico. Valori ammessi: `pass`, `fail`, `not_applicable`.],

    [`not_applicable`], 
    [string], 
    [Testo esplicativo opzionale in caso di non applicabilità.],

    [`pass`], 
    [string], 
    [Messaggio di conferma del soddisfacimento del requisito.],

    [`fail`], 
    [string], 
    [Messaggio di errore o indicazioni sul mancato soddisfacimento.]
  )
]

=== Persistenza degli Esiti e Normalizzazione Selettiva
La scelta di adottare una normalizzazione selettiva — ovvero memorizzare nella `lista_valutazioni` esclusivamente l'esito finale e non l'intera struttura dell'albero decisionale — risponde a due requisiti architetturali fondamentali:

+ *Snapshot della Conformità*: Il dispositivo non salva il percorso logico (il "come"), ma il risultato (il "cosa") deciso in un determinato momento, creando una cronologia immutabile della valutazione.

+ *Disaccoppiamento e Performance*: Il database rimane agnostico rispetto alla complessità normativa, delegando l'interpretazione dei nodi al Motore di Valutazione. Questo elimina la necessità di migrare i documenti "Dispositivo" ad ogni aggiornamento del modello e, non duplicando l'albero decisionale, mantiene i documenti BSON leggeri e gli esiti (`PASS`, `FAIL`, `NA`) come campi atomici — pronti per report e dashboard senza rielaborazioni.

=== Gestione delle Rivalutazioni e Versioning
Un aspetto critico del design riguarda la coerenza dei dati in caso di aggiornamento degli standard normativi. Le valutazioni esistenti rimangono ancorate alla versione referenziata in `ref_modello`, garantendo l'integrità del "punto nel tempo" in cui la conformità è stata dichiarata. Solo avviando una nuova sessione di analisi — e scegliendo esplicitamente di aggiornare il riferimento — il sistema caricherà la logica dell'albero più recente.

=== Flessibilità del Database e Validazione dei Dati
L'adozione di MongoDB permette di distinguere tre categorie di campi in base al loro grado di obbligatorietà:

- *Campi Obbligatori (Core)*: Informazioni come `nome_dispositivo`, `ref_modello` e `codice_requisito` devono essere sempre presenti per garantire l'identità dell'oggetto e la consistenza tra dispositivo e normativa.

- *Campi Opzionali*: Strutture come `lista_asset` possono essere omesse o inizializzate come array vuoto `[]`, permettendo di censire un dispositivo prima ancora di averne definito i moduli tecnici o avviato l'audit.

- *Campi Condizionali*: Il campo `giustificazione` è opzionale per esito `pass`, ma obbligatorio per `fail` e `not_applicable`. Questa validazione incrociata viene delegata interamente alla Business Logic applicativa, mantenendo il livello di persistenza leggero e disaccoppiato — senza ricorrere a _check constraints_ o trigger SQL.



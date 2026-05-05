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
    #set text(font: ("Arial", "Helvetica", "sans-serif"), size: 10pt)
    #set align(left)
    
    #text(weight: "bold", fill: luma(80), size: 11pt)[#titolo]
    #v(2pt)
    #line(length: 100%, stroke: 0.5pt + luma(200))
    #v(4pt)
    
    #table(
      columns: (auto, auto, 1fr),
      stroke: 0.5pt + luma(200),
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

=== Scelte Architetturali e Formalismo
A differenza dei sistemi relazionali basati su tabelle, MongoDB è un database *NoSQL orientato ai documenti* con struttura _schema-flexible_. Questa scelta architetturale è ideale per gestire strutture dati gerarchiche e dinamiche (come gli alberi decisionali), evitando il sovraccarico computazionale derivante da query di JOIN complesse.

Per la modellazione visiva non si utilizzano diagrammi Entity-Relationship, in quanto non idonei ai database documentali. 

Si adotta invece il formalismo di Hackolade (consultabile al link: #link("https://hackolade.com/schemas/Yelp_Challenge_dataset_documentation.html")), che descrive chiaramente la gerarchia dei campi, i tipi di dato e le nidificazioni.

*Nota sulla validazione dei dati:*
Benché i documenti vengano illustrati con tipi logici (incluso il tipo `enum` per chiarezza espositiva), la validazione strutturale di base sarà garantita dall'adapter predisposto alle comunicazioni col database

Le due _collection_ principali del database sono:
- *Collection "Compliance Standards"*: Catalogo di sola lettura dei template. Contiene le definizioni degli standard, le versioni e la logica degli alberi decisionali.
- *Collection "Devices"*: Registro dinamico dei device censiti. Memorizza lo stato delle valutazioni e il riferimento puntuale al modello normativo applicato.

=== Schema Dati Device
Il documento _Device_ è l'entità centrale del sistema. La sua struttura gerarchica rispecchia la scomposizione fisica e funzionale dell'oggetto analizzato in tre blocchi logici:

+ *Header Identificativo (Root)*: Informazioni anagrafiche, tecniche e puntatore al modello normativo.
+ *Lista Asset (Nodi Figli)*: Array di sub-documenti che modellano le singole componenti o funzionalità del dispositivo.
+ *Registro Valutazioni (Nodi Terminali)*: Dizionario delle risposte fornite per i requisiti applicabili a ciascun asset.

#figure(caption:"Schema logico: Documento Device")[
  #image("/src/PB/DocumentazioneEsterna/Specifica_Tecnica/images/schema_dati_dispositivo.drawio.png")
]

#figure(
  caption: [Schema dati: Root --- Device],
)[
  #tabella_schema(
    "Root --- Device",
    [`_id`], [ObjectId], [Identificativo univoco generato dal database.],
    [`name`], [string], [Nome assegnato dall'utente al dispositivo. Valore obbligatorio.],
    [`os`], [string], [Sistema operativo o firmware installato.],
    [`description`], [string], [Testo libero descrittivo del dispositivo.],
    [`evaluation_cs`], [document], [Metadati del modello di riferimento (compliance standard) usato per la valutazione (`id`, `name`, `version`).],
    [`assets`], [array], [Elenco degli asset associati al dispositivo. Può essere inizializzato come array vuoto `[]`.]
  )
]

#figure(
  caption: [Schema dati: Sub-documento --- evaluation_cs],
)[
  #tabella_schema(
    "Sub-documento --- evaluation_cs",
    [`id`], [string], [Identificativo del modello di riferimento nel sistema esterno.],
    [`name`], [string], [Nome leggibile del modello.],
    [`version`], [string], [Versione del modello applicata alla valutazione.]
  )
]

#figure(
  caption: [Schema dati: Sub-documento --- assets[N]],
)[
  #tabella_schema(
    "Sub-documento --- assets[N]",
    [`id`], [string], [ID applicativo per l'identificazione univoca dell'asset nel dispositivo.],
    [`name`], [string], [Nome descrittivo dell'asset.],
    [`description`], [string], [Testo libero descrittivo dell'asset.],
    [`type`], [enum], [Categoria logica dell'asset. Valori ammessi: `security`, `network`.],
    [`evaluations`], [array], [Elenco delle valutazioni fornite per questo asset. Può essere vuoto `[]`.]
  )
]

#figure(
  caption: [Schema dati: Sub-documento --- evaluations[N]],
)[
  #tabella_schema(
    "Sub-documento --- evaluations[N]",
    [`id`], [string], [Riferimento al codice del requisito presente nel modello.],
    [`evaluation_map`], [dictionary], [Mappa chiave-valore delle risposte. La chiave (string) corrisponde al codice del nodo decisionale, il valore (enum) rappresenta l'esito logico: `PASS`, `FAIL`, `NA` (Not Applicable).],
    [`justification`], [string], [Testo descrittivo della motivazione. Obbligatorio a livello applicativo in caso di esito `FAIL` o `NA`.]
  )
]

=== Schema ComplianceStandard
La collection "Modelli" contiene la definizione strutturale degli standard normativi. A differenza del Dispositivo, orientato allo stato, il Modello descrive la logica di valutazione. Si suddivide in:
- *Metadati*: Versionamento e identificazione.
- *Albero dei Requisiti*: Struttura che definisce il testo della norma e la logica decisionale per guidare l'utente alla valutazione finale.

#figure(caption:"Schema logico: ComplianceStandard")[
  #image("/src/PB/DocumentazioneEsterna/Specifica_Tecnica/images/schema_dati_modello.drawio.png")
]

#figure(
  caption: [Schema dati: Root --- ComplianceStandard],
)[
  #tabella_schema(
    "Root --- ComplianceStandard",
    [`_id`], [ObjectId], [Identificativo univoco del modello.],
    [`name`], [string], [Nome dello standard normativo.],
    [`version`], [string], [Identificativo della versione del modello.],
    [`is_default`], [bool], [Flag che indica se il modello è quello predefinito per nuove valutazioni.],
    [`requirements`], [array], [Elenco dei requisiti che compongono la normativa.]
  )
]

#figure(
  caption: [Schema dati: Sub-documento --- requirements[N]],
)[
  #tabella_schema(
    "Sub-documento --- requirements[N]",
    [`id`], [string], [Identificativo testuale univoco del requisito.],
    [`name`], [string], [Titolo sintetico del requisito.],
    [`description`], [document], [Testo descrittivi del contesto normativo (`norm_description`, `target_description`).],
    [`decision_tree`], [document], [Albero decisionale per questo requisito.],
    [`dependencies`], [array], [Elenco di codici di requisiti propedeutici da soddisfare prima della valutazione.]
  )
]


#figure(
  caption: [Schema dati: Sub-documento --- DecisionTree],
)[
  #tabella_schema(
    "Sub-documento --- DecisionNode",
    [`root_node`], [string], [Codice identificativo del nodo logico iniziale.],
    [`nodes`], [array], [Lista dei nodi che compongono il decision tree.
    
    Il node_type funge da discriminante tra nodi di decisione e nodi foglia.
    
    Valori ammessi da node_type:decision_node | leaf_node.],
  )
]

#figure(
  caption: [Schema dati: Sub-documento --- DecisionNode],
)[
  #tabella_schema(
    "Sub-documento --- DecisionNode",
    [`id`], [string], [Codice identificativo del nodo logico.],
    [`node_type`], [enum], [decision_node, identifica un nodo  di decisione.],

    [`question`], [string], [Testo della domanda posta all'utente.],
    [`child_yes`], [document], [Riferimento al nodo successivo sul ramo associato alla risposta affermativa.],
    [`child_no`], [document], [Riferimento al nodo successivo sul ramo associato alla risposta negativa.]
  )
]

#figure(
  caption: [Schema dati: Sub-documento --- LeafNode],
)[
  #tabella_schema(
    "Sub-documento --- LeafNode",
    [`id`], [string], [Codice identificativo del nodo foglia.],
    [`node_type`], [enum], [leaf_node, identifica un nodo foglia.],
    [`result`], [enum], [Stato terminale del percorso logico. Valori ammessi: `PASS`, `FAIL`, `NA`.],

  )
]


=== Gestione degli Esiti e Storicità
La separazione netta tra Modello e Dispositivo ottimizza la memorizzazione e la gestione dei dati portando i seguenti vantaggi:

- *Zero Ridondanza*: Il documento Dispositivo salva unicamente il dizionario delle risposte fornite, mentre il documento Modello conserva esclusivamente la struttura statica dell'albero. Questo evita di duplicare l'intera gerarchia normativa per ogni dispositivo.
- *Disaccoppiamento*: Viene lasciato alla logica applicativa il compito di "fondere" i dati, compilando a runtime il template del Modello con le risposte storicizzate nel Dispositivo.
- *Versionamento*: La collection Modelli conserva tutte le versioni rilasciate di uno standard. Poiché il Dispositivo punta esplicitamente a una singola e specifica versione, lo storico delle certificazioni passate rimane inalterato e coerente anche a fronte di futuri aggiornamenti normativi.
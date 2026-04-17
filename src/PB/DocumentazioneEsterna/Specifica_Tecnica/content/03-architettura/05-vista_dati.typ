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
- *Collection "Modelli"*: Catalogo di sola lettura dei template. Contiene le definizioni degli standard, le versioni e la logica degli alberi decisionali.
- *Collection "Dispositivi"*: Registro dinamico dei device censiti. Memorizza lo stato delle valutazioni e il riferimento puntuale al modello normativo applicato.

=== Schema Dati Dispositivo
Il documento Dispositivo è l'entità centrale del sistema. La sua struttura gerarchica rispecchia la scomposizione fisica e funzionale dell'oggetto analizzato in tre blocchi logici:

+ *Header Identificativo (Root)*: Informazioni anagrafiche, tecniche e puntatore al modello normativo.
+ *Lista Asset (Nodi Figli)*: Array di sub-documenti che modellano le singole componenti o funzionalità del dispositivo.
+ *Registro Valutazioni (Nodi Terminali)*: Dizionario delle risposte fornite per i requisiti applicabili a ciascun asset.

#figure(caption:"Schema logico: Documento Dispositivo")[
  #image("/src/PB/DocumentazioneEsterna/Specifica_Tecnica/images/schema_dati_dispositivo.drawio.png")
]

#figure(
  caption: [Schema dati: Root --- Dispositivo],
)[
  #tabella_schema(
    "Root --- Dispositivo",
    [`_id`], [ObjectId], [Identificativo univoco generato dal database.],
    [`nome_dispositivo`], [string], [Nome assegnato dall'utente al dispositivo. Valore obbligatorio.],
    [`os_dispositivo`], [string], [Sistema operativo o firmware installato.],
    [`descrizione_dispositivo`], [string], [Testo libero descrittivo del dispositivo.],
    [`ref_modello`], [document], [Metadati del modello di riferimento usato per la valutazione (`id_modello`, `nome_modello`, `versione_modello`).],
    [`lista_asset`], [array], [Elenco degli asset associati al dispositivo. Può essere inizializzato come array vuoto `[]`.]
  )
]

#figure(
  caption: [Schema dati: Sub-documento --- ref_modello],
)[
  #tabella_schema(
    "Sub-documento --- ref_modello",
    [`id_modello`], [string], [Identificativo del modello di riferimento nel sistema esterno.],
    [`nome_modello`], [string], [Nome leggibile del modello.],
    [`versione_modello`], [string], [Versione del modello applicata alla valutazione.]
  )
]

#figure(
  caption: [Schema dati: Sub-documento --- lista_asset[N]],
)[
  #tabella_schema(
    "Sub-documento --- lista_asset[N]",
    [`id_asset`], [string], [ID applicativo per l'identificazione univoca dell'asset nel dispositivo.],
    [`nome_asset`], [string], [Nome descrittivo dell'asset.],
    [`descrizione_asset`], [string], [Testo libero descrittivo dell'asset.],
    [`tipo_asset`], [enum], [Categoria logica dell'asset. Valori ammessi: `security`, `network`.],
    [`lista_valutazioni`], [array], [Elenco delle valutazioni fornite per questo asset. Può essere vuoto `[]`.]
  )
]

#figure(
  caption: [Schema dati: Sub-documento --- lista_valutazioni[N]],
)[
  #tabella_schema(
    "Sub-documento --- lista_valutazioni[N]",
    [`id_requisito`], [string], [Riferimento al codice del requisito presente nel modello.],
[`valutazione`], [dictionary], [Mappa chiave-valore delle risposte. La chiave (string) corrisponde al codice del nodo decisionale, il valore (enum) rappresenta l'esito logico: `PASS`, `FAIL`, `NA` (Not Applicable).],
    [`giustificazione`], [string], [Testo descrittivo della motivazione. Obbligatorio a livello applicativo in caso di esito `FAIL` o `NA`.]
  )
]

=== Schema Dati Modello
La collection "Modelli" contiene la definizione strutturale degli standard normativi. A differenza del Dispositivo, orientato allo stato, il Modello descrive la logica di valutazione. Si suddivide in:
- *Metadati*: Versionamento e identificazione.
- *Albero dei Requisiti*: Struttura che definisce il testo della norma e la logica decisionale per guidare l'utente alla valutazione finale.

#figure(caption:"Schema logico: Documento Modello")[
  #image("/src/PB/DocumentazioneEsterna/Specifica_Tecnica/images/schema_dati_modello.drawio.png")
]

#figure(
  caption: [Schema dati: Root --- Modello],
)[
  #tabella_schema(
    "Root --- Modello",
    [`_id`], [ObjectId], [Identificativo univoco del modello.],
    [`nome_modello`], [string], [Nome dello standard normativo.],
    [`versione_modello`], [string], [Identificativo della versione del modello.],
    [`is_default`], [bool], [Flag che indica se il modello è quello predefinito per nuove valutazioni.],
    [`lista_requisiti`], [array], [Elenco dei requisiti che compongono la normativa.]
  )
]

#figure(
  caption: [Schema dati: Sub-documento --- lista_requisiti[N]],
)[
  #tabella_schema(
    "Sub-documento --- lista_requisiti[N]",
    [`codice_requisito`], [string], [Identificativo testuale univoco del requisito.],
    [`nome_requisito`], [string], [Titolo sintetico del requisito.],
    [`descrizione_requisito`], [document], [Testo descrittivi del contesto normativo (`descrizione_norma`, `descrizione_target`).],
    [`nodo_root`], [document], [Punto d'ingresso dell'albero decisionale per questo requisito.],
    [`lista_dipendenze`], [array], [Elenco di codici di requisiti propedeutici da soddisfare prima della valutazione.]
  )
]

#figure(
  caption: [Schema dati: Sub-documento --- Nodo_decisione],
)[
  #tabella_schema(
    "Sub-documento --- Nodo_decisione",
    [`nodo_decisione_codice`], [string], [Codice identificativo del nodo logico.],
    [`nodo_decisione_domanda`], [string], [Testo della domanda posta all'utente.],
    [`nodo_figlio_si`], [document], [Riferimento al nodo successivo sul ramo associato alla risposta affermativa.],
    [`nodo_figlio_no`], [document], [Riferimento al nodo successivo sul ramo associato alla risposta negativa.]
  )
]

#figure(
  caption: [Schema dati: Sub-documento --- Nodo_foglia],
)[
  #tabella_schema(
    "Sub-documento --- Nodo_foglia",
    [`esito`], [enum], [Stato terminale del percorso logico. Valori ammessi: `pass`, `fail`, `not_applicable`.],
    [`not_applicable`], [string], [Testo esplicativo in caso di non applicabilità.],
    [`pass`], [string], [Messaggio di conferma del soddisfacimento.],
    [`fail`], [string], [Messaggio di errore o indicazioni di mitigazione.]
  )
]


=== Gestione degli Esiti e Storicità
La separazione netta tra Modello e Dispositivo ottimizza la memorizzazione e la gestione dei dati portando i seguenti vantaggi:

- *Zero Ridondanza*: Il documento Dispositivo salva unicamente il dizionario delle risposte fornite, mentre il documento Modello conserva esclusivamente la struttura statica dell'albero. Questo evita di duplicare l'intera gerarchia normativa per ogni dispositivo.
- *Disaccoppiamento*: Viene lasciato alla logica applicativa il compito di "fondere" i dati, compilando a runtime il template del Modello con le risposte storicizzate nel Dispositivo.
- *Versionamento*: La collection Modelli conserva tutte le versioni rilasciate di uno standard. Poiché il Dispositivo punta esplicitamente a una singola e specifica versione, lo storico delle certificazioni passate rimane inalterato e coerente anche a fronte di futuri aggiornamenti normativi.
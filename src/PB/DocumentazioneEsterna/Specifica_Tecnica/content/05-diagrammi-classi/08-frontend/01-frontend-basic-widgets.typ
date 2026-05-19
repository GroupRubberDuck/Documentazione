== Architettura Frontend: Widget Semplici

L'approccio server-side rendering adottato nel progetto è integrato da componenti
e widget reattivi realizzati con Vue 3 (Composition API). Per ogni pagina, Flask
renderizza il template Jinja con i dati statici, mentre le parti interattive
vengono delegate a "isole" Vue indipendenti, montate su specifici punti del DOM.

Il sistema frontend gestisce solo l'aspetto grafico e la reattività, altre operazioni vengono realizzate tramite chiamate API. 

Per mantenere il codice aderente ai principi SOLID — in particolare Single
Responsibility e Dependency Inversion — l'architettura frontend si sviluppa
su tre livelli:

#enum(
  reversed: true,
  [
    *Componenti Dumb*

    Componenti UI generici e riutilizzabili, privi di qualsiasi conoscenza
    del dominio applicativo. Ricevono dati e callback esclusivamente tramite
    props ed emettono eventi verso il padre. Non accedono a store, non
    eseguono chiamate di rete, non conoscono la struttura degli URL.

  ],
  [
    *Widget Smart*

    Isole applicative che orchestrano uno o più componenti dumb per
    realizzare una funzionalità di dominio specifica. Contengono la
    logica di business (chiamate HTTP, validazione, gestione del
    redirect post-azione) e compongono i componenti dumb passando
    loro i dati necessari. Ogni widget è autocontenuto nella propria
    cartella.
  ],
  [
    *Entry Point (Mount Point)*

    Livello di integrazione tra il mondo Flask/Jinja e Vue. Ogni entry
    point legge i dati iniettati dal server tramite attributi data-\* del
    DOM, li converte nel formato atteso dal widget e monta l'applicazione
    Vue sul nodo HTML corrispondente. Non contiene logica di business
    né di presentazione.
  ]
)

*Logica Condivisa (Shared)*
Trasversalmente ai tre livelli, la cartella shared contiene logica
riutilizzabile che non è legata a un singolo widget né costituisce
un componente visuale:

- *Composable* — Funzioni che incapsulano stato reattivo e logica
  riutilizzabile tra widget diversi. Seguono la convenzione Vue `use*`.
  Esempio: `useFormModel`, che gestisce lo stato dei campi, la
  validazione client-side e l'integrazione con errori server-side.

- *Definizioni di dominio* — Oggetti che descrivono la struttura
  dei dati condivisi tra widget. Esempio: `deviceFormFields` e
  `assetFormFields`, che definiscono campi e regole di validazione
  dei rispettivi form, condivisi tra i widget di creazione e modifica.

- *Utilità* — Funzioni pure senza dipendenze da Vue, utilizzabili
  sia dai widget che dagli entry point. Esempio: `navigationGuard`,
  che gestisce il blocco di navigazione per le pagine con dati
  non salvati.

Questa separazione garantisce che i componenti dumb siano riutilizzabili
tra widget diversi, che i widget siano testabili in isolamento, e che
la dipendenza dagli URL e dai dati del server sia confinata
esclusivamente nel livello di integrazione.




=== Shared





=== Component
==== AsyncButton
#figure(caption: "Componente - AsyncButton")[
#image("/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/componenti/asyncButton.png")
]
*Descrizione*

Componente generico che esegue una funzione asincrona al click, gestendo lo stato di caricamento e la cattura degli errori. 
\
Non possiede alcuna conoscenza del dominio applicativo: riceve la funzione da eseguire come parametro e comunica l'esito tramite eventi.

*Attributi*
- `- action: Function` : Funzione da eseguire al click del pulsante
- `- Label: String` : Testo del bottone. 
- `- loadingLabel: String` : Testo del bottone durante l'esecuzione della funzione. 
- `- buttonClass: String` : Stringa contente l'elenco delle classi da applicare al pulsante


- `- isLoading : Boolean` — indica se la funzione asincrona è in esecuzione. Durante il caricamento il bottone è disabilitato per prevenire click multipli.

- `error : String` — contiene il messaggio dell'ultimo errore verificatosi, null se l'ultima esecuzione ha avuto successo.

*Metodi*
- `+ AsyncButton(action:Function, label:string, loadingLabel:String, buttonClass:String)` — costruttore. Riceve la funzione asincrona da eseguire, il testo del bottone nei due stati (default e caricamento), e una classe CSS opzionale per lo stile.

`- handleClick()` — metodo privato invocato al click. Verifica che non sia già in corso un'esecuzione, imposta lo stato di caricamento, esegue la funzione asincrona e gestisce il risultato.

- `+ success(result)` — evento emesso al completamento con successo della funzione asincrona. Trasporta il valore restituito dalla funzione.

- `+ error(err)` — evento emesso in caso di fallimento. Trasporta l'eccezione catturata.
==== BaseModal 
#figure(caption:"Componente - BaseModal")[
#image("/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/componenti/BaseModal.png")
]
*Descrizione*
Componente generico che fornisce l'infrastruttura per qualsiasi finestra di dialogo.
Non possiede attributi interni né conosce il contenuto che ospita, interamente delegato a uno slot. 

La decisione di quando il modale debba apparire o scomparire è responsabilità del componente padre, che lo monta e smonta tramite direttiva condizionale.

*Attributi*:
- `- ContentClass: String` : Stringa contente l'elenco delle classi da applicare al contenuto del modal.
- `- Content: Slot` : slot di default che accetta il contenuto del modale. Il componente padre inietta tramite questo slot titolo, messaggio, bottoni e qualsiasi altro elemento necessario. Il BaseModal non ha alcuna conoscenza di ciò che lo slot contiene.

*Metodi*:
- `+ BaseModal(contentClass:String)` : Stringa contente l'elenco delle classi da applicare al contenuto del modal.
- `- onKeyDown(Event:KeyboardEvent)`: metodo privato registrato come listener globale al mount. Intercetta la pressione del tasto Escape e emette l'evento di chiusura.
- `-  onOverlayClick(event)` — metodo privato invocato al click sull'overlay. Emette l'evento di chiusura solo se il click avviene sull'overlay stesso e non su un elemento figlio.

- `close()` — evento emesso quando l'utente richiede la chiusura del modale (tramite Escape o click sull'overlay). Il padre decide come reagire.
==== FormField 
#figure(caption: "Componente - FormField")[

#image("/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/componenti/FormField.png")
]
*Descrizione*:

Componente generico che funge da wrapper per un singolo campo di un form. Si occupa di mostrare la label associata al campo e l'eventuale messaggio di errore di validazione. Non conosce il tipo di input che ospita — il campo vero e proprio (text, select, textarea, radio) è delegato allo slot.

*Attributi*:

- `- label: String` : Testo da mostrare nella label del campo di input.
- `- error: String` : Testo da mostrare in caso di errore.
- `- Content: Slot` : slot di default che accetta l'input vero e proprio. Il widget padre inietta tramite questo slot il campo appropriato con il relativo binding ai dati.

*Metodi*:

- `+ FormField(label:String, error: String)`: 

Costruttore. Riceve il testo della label e l'eventuale messaggio di errore. Se error è null il campo è considerato valido e il messaggio non viene mostrato.
==== Toast

#figure(caption: "Componente - Toast")[

#image("/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/componenti/Toast.png")
]

*Descrizione*:

Componente generico che mostra un messaggio temporaneo a schermo sotto forma di notifica. Scompare automaticamente dopo un tempo definito senza richiedere interazione da parte dell'utente. Non mantiene stato interno — il padre lo monta quando serve mostrare un messaggio e lo smonta quando riceve l'evento di chiusura.

*Attributi*:
- `- message:String`: messaggio da mostrare.
- `- duration:Number`: durata a schermo del componente.

*Metodi*:

- `+ Toast(message:String, duration:Number)`: costruttore. Riceve il testo del messaggio e la durata in millisecondi prima della chiusura automatica. Al mount del componente viene avviato un timer che, allo scadere, emette l'evento di chiusura.

- `+ close()`:evento emesso alla scadenza del timer. Il padre reagisce smontando il componente.

==== FileDropZone
#figure(caption:"Componente - FileDropZone")[
#image("/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/componenti/FileDropZone.png")
  
]

*Descrizione*:

Componente generico che realizza un'area di caricamento file con supporto per drag & drop e selezione tramite click. Gestisce il feedback visivo durante il trascinamento, valida il tipo di file in base alle estensioni accettate e comunica il file selezionato al padre tramite evento. Non conosce cosa verrà fatto del file — l'upload o l'elaborazione sono responsabilità del widget che lo utilizza.

*Attributi*:

- `- accept:String[]`: Elenco di estensioni supportate. 
- `- placeholder: String`: Testo del placeholder.
- `- hint: String`: Suggerimento testuale sui formati accettati.
- `- disabled: Boolean`: Flag per disabilitare l'interazione.
- `- isDragging: Boolean`: Indica se un file è attualmente trascinato sopra l'area di drop. Utilizzato per il feedback visivo.
- `- selectedFile: File`: Riferimento al file selezionato dall'utente, null se nessun file è stato scelto.

*Metodi*:
- `+ FileDropZone(accept: String[], placeholder: String, hint: String, disabled: Boolean)`:Costruttore. Riceve le estensioni accettate, il testo placeholder, un suggerimento sui formati supportati e un flag per disabilitare l'interazione.
- `- handleFileChange(event:Event)`:  Metodo privato invocato alla selezione di un file tramite il file picker nativo del browser.
- `- handleDropEvent(event:DragEvent)`: Metodo privato invocato al rilascio di un file trascinato sull'area di drop. Valida il file e lo accetta o emette un errore.
- `- isFileAccepted(file:File)`: Metodo privato che verifica se l'estensione del file è tra quelle accettate.
- `- formatSize(bytes:Number)`: Metodo privato che converte una dimensione in byte in formato leggibile (Bytes, KB, MB).
- `+ reset()`:  Metodo pubblico esposto al padre tramite template ref. Resetta lo stato del componente rimuovendo il file selezionato.
- `+ select(file:File)`: Evento emesso quando un file valido viene selezionato o trascinato.
- `+ error(message:String)`: Evento emesso quando il file trascinato non supera la validazione del formato.
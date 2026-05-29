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

    Livello di integrazione tra Flask/Jinja e Vue. Ogni entry
    point legge i dati iniettati dal server tramite attributi data-\* del
    DOM, li converte nel formato atteso dal widget e monta l'applicazione
    Vue sul nodo HTML corrispondente. Non contiene logica di business
    né di presentazione.
  ],
)

*Logica Condivisa (Shared)*
Trasversalmente ai tre livelli, vi è logica shared riutilizzabile che non è legata a un singolo widget né costituisce
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

Questa separazione garantisce che i componenti semplici siano riutilizzabili
tra widget diversi, che i widget siano testabili in isolamento, e che
la dipendenza dagli URL e dai dati del server sia confinata
esclusivamente nel livello di integrazione.




=== Shared

==== Validation Rule
#figure(caption: "Shared - ValidationRule")[
  #image(
    "/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/shared/ValidationRule.drawio.png",
  )
]
*Descrizione*:


Viene utilizzato per la validazione dei dati inseriti dall'utente.
Rappresenta un contratto, un oggetto deve esporre un metodo validate che accetta un valore primitivo, effettua un controllo, ritorna un messaggio di errore che indica perché non ha superato il controllo, se lo ha superato non ritorna nulla.

*Attributi*:

Le interfacce non hanno attributi

*Metodi*:
- `+ validate(value:String|Number|Boolean):String|null`:Accetta un valore primitivo, effettua un controllo, ritorna un messaggio di errore che indica perché non ha superato il controllo, se lo ha superato non ritorna nulla.

==== Field Definition
#figure(caption: "Shared - FieldDefinition")[
  #image(
    "/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/shared/FieldDefinition.drawio.png",
  )
]

*Descrizione*:

Rappresenta un contratto strutturale che definisce i campi che un oggetto deve esporre per poter essere usato nel model di un form.

*Attributi*:
L'interfaccia non ha attributi.

*Metodi*:
- `+ initialValue():String|Number|Boolean`:Il valore primitivo di default con cui il campo deve essere inizializzato nel DOM e a cui deve essere ripristinato in fase di reset.
- `+ rules(): ValidationRule[]` :Un array di elementi che implementano l'interfaccia `ValidationRule`, contenente l'elenco delle funzioni di validazione associate al campo.

==== Use Form Model
#figure(caption: "Shared - UseFormModel")[
  #image(
    "/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/shared/UseFormModel.png",
  )
]

*Descrizione*:


Inizializza e gestisce lo stato reattivo di un form di dominio a partire dalle sue definizioni. Si occupa della validazione client-side e dell'integrazione degli errori inviati dal server, isolando completamente la logica di business dal template visivo.

*Attributi*:

- `- fieldDefinitions : Map<String, FieldDefinition>`: Conserva internamente le field definition ricevute alla costruzione e le usa per usarlo nelle funzioni.
- `+ fields: Map<String, String | Number | Boolean>` : Mappa reattiva che memorizza i valori correnti inseriti dall'utente per ciascun campo del form.
- `+ errors: Map<String, String | null>` : Mappa reattiva che associa a ogni campo il relativo messaggio di errore (impostato a `null` se il campo è valido).
- `+ isValid: Boolean` : Proprietà calcolata (computed). Restituisce `true` solo se tutti gli elementi all'interno di `errors` sono pari a `null`.

*Metodi*:
- `+ useFormModel(fieldDefinitions: Map<String, FieldDefinition>)` : Costruttore/Funzione di inizializzazione. Riceve la configurazione dei campi e genera le strutture reattive per `fields` ed `errors` impostando i valori iniziali.
- `+ validate(): Boolean` : Esegue la validazione su tutti i campi del form. Restituisce `true` se l'intero modulo è valido, altrimenti aggiorna la mappa degli errori e restituisce `false`.
- `+ validateField(name: String): Boolean` : Invocato per convalidare un singolo campo. Applica le regole in ordine sequenziale e si interrompe al primo fallimento.
- `+ setServerErrors(serverErrors: Map<String, String>): void` : Riceve una mappa di errori generati dalle API di Flask (backend) e li inietta direttamente nello stato `errors` per mostrarli all'utente.
- `+ reset(): void` : Svuota tutti i messaggi di errore e ripristina i valori di `fields` allo stato iniziale definito in `FieldDefinition`.

==== Definizioni di Dominio (Constants)
#figure(caption: "Shared - Form Fields Configurations")[
  #image(
    "/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/shared/DomainConstants.png",
  )
]

*Descrizione*:


Oggetti JavaScript esportati come costanti,  che fungono da singolo punto di configurazione per le regole di validazione degli input utente nei form.

Rappresentano una  `Map<String, FieldDefinition>`, questi oggetti isolano le regole di validazione) e i valori iniziali dal resto del codice.
Essendo condivisi, garantiscono una rigorosa simmetria di validazione tra le interfacce di creazione e di modifica.

*Attributi*:

Ogni attributo di questi oggetti rappresenta uno specifico campo del dominio e rispetta rigorosamente la forma definita da `FieldDefinition`:

*Per `deviceFormFields`:*
- `+ deviceName: FieldDefinition`
- `+ deviceOs: FieldDefinition`
- `+ deviceDescription: FieldDefinition`

*Per `assetFormFields`:*
- `+ name: FieldDefinition`
- `+ assetType: FieldDefinition`
- `+ description: FieldDefinition`

*Metodi*:

Trattandosi di oggetti di pura configurazione statica dei dati, non espongono alcun metodo operativo.


=== Component
==== AsyncButton
#figure(caption: "Componente - AsyncButton")[
  #image(
    "/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/componenti/asyncButton.png",
  )
]
*Descrizione*

Componente generico che esegue una funzione asincrona al click, gestendo lo stato di caricamento e la cattura degli errori.
\
Non possiede alcuna conoscenza del dominio applicativo: riceve la funzione da eseguire come parametro e comunica l'esito tramite eventi.

*Attributi*
- `- action: Function` : Funzione da eseguire al click del pulsante
- `- Label: String` : Testo del bottone.
- `- loadingLabel: String` : Testo del bottone durante l'esecuzione della funzione.
- `- buttonClass: String` : Stringa contenente l'elenco delle classi da applicare al pulsante


- `- isLoading : Boolean` — indica se la funzione asincrona è in esecuzione. Durante il caricamento il bottone è disabilitato per prevenire click multipli.

- `- error : String` — contiene il messaggio dell'ultimo errore verificatosi, null se l'ultima esecuzione ha avuto successo.

*Metodi*
- `+ AsyncButton(action:Function, label:string, loadingLabel:String, buttonClass:String)` — costruttore. Riceve la funzione asincrona da eseguire, il testo del bottone nei due stati (default e caricamento), e una classe CSS opzionale per lo stile.

`- handleClick()` — metodo privato invocato al click. Verifica che non sia già in corso un'esecuzione, imposta lo stato di caricamento, esegue la funzione asincrona e gestisce il risultato.

- `+ success(result)` — evento emesso al completamento con successo della funzione asincrona. Trasporta il valore restituito dalla funzione.

- `+ error(err)` — evento emesso in caso di fallimento. Trasporta l'eccezione catturata.
==== BaseModal
#figure(caption: "Componente - BaseModal")[
  #image(
    "/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/componenti/BaseModal.png",
  )
]
*Descrizione*
Componente generico che fornisce l'infrastruttura per qualsiasi finestra di dialogo.
Non possiede attributi interni né conosce il contenuto che ospita, interamente delegato a uno slot.

La decisione di quando il modale debba apparire o scomparire è responsabilità del componente padre, che lo monta e smonta tramite direttiva condizionale.

*Attributi*:
- `- ContentClass: String` : Stringa contenente l'elenco delle classi da applicare al contenuto del modal.
- `- Content: Slot` : slot di default che accetta il contenuto del modale. Il componente padre inietta tramite questo slot titolo, messaggio, bottoni e qualsiasi altro elemento necessario. Il BaseModal non ha alcuna conoscenza di ciò che lo slot contiene.

*Metodi*:
- `+ BaseModal(contentClass:String)` : Stringa contenente l'elenco delle classi da applicare al contenuto del modal.
- `- onKeyDown(Event:KeyboardEvent)`: metodo privato registrato come listener globale al mount. Intercetta la pressione del tasto Escape e emette l'evento di chiusura.
- `-  onOverlayClick(event)` — metodo privato invocato al click sull'overlay. Emette l'evento di chiusura solo se il click avviene sull'overlay stesso e non su un elemento figlio.

- `close()` — evento emesso quando l'utente richiede la chiusura del modale (tramite Escape o click sull'overlay). Il padre decide come reagire.
==== FormField
#figure(caption: "Componente - FormField")[

  #image(
    "/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/componenti/FormField.png",
  )
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

  #image(
    "/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/componenti/Toast.png",
  )
]

*Descrizione*:


Componente generico che mostra un messaggio temporaneo a schermo sotto forma di notifica. Scompare automaticamente dopo un tempo definito senza richiedere interazione da parte dell'utente. Non mantiene stato interno — il padre lo monta quando serve mostrare un messaggio e lo smonta quando riceve l'evento di chiusura.

*Attributi*:
- `- message:String`: messaggio da mostrare.
- `- duration:Number`: durata a schermo del componente.

*Metodi*:

- `+ Toast(message:String, duration:Number)`: costruttore. Riceve il testo del messaggio e la durata in millisecondi prima della chiusura automatica. Al mount del componente viene avviato un timer che, allo scadere, emette l'evento di chiusura.

- `+ close()`: evento emesso alla scadenza del timer. Il padre reagisce smontando il componente.

==== FileDropZone
#figure(caption: "Componente - FileDropZone")[
  #image(
    "/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/componenti/FileDropZone.png",
  )

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
- `+ FileDropZone(accept: String[], placeholder: String, hint: String, disabled: Boolean)`: Costruttore. Riceve le estensioni accettate, il testo placeholder, un suggerimento sui formati supportati e un flag per disabilitare l'interazione.
- `- handleFileChange(event:Event)`:  Metodo privato invocato alla selezione di un file tramite il file picker nativo del browser.
- `- handleDropEvent(event:DragEvent)`: Metodo privato invocato al rilascio di un file trascinato sull'area di drop. Valida il file e lo accetta o emette un errore.
- `- isFileAccepted(file:File)`: Metodo privato che verifica se l'estensione del file è tra quelle accettate.
- `- formatSize(bytes:Number)`: Metodo privato che converte una dimensione in byte in formato leggibile (Bytes, KB, MB).
- `+ reset()`:  Metodo pubblico esposto al padre tramite template ref. Resetta lo stato del componente rimuovendo il file selezionato.
- `+ select(file:File)`: Evento emesso quando un file valido viene selezionato o trascinato.
- `+ error(message:String)`: Evento emesso quando il file trascinato non supera la validazione del formato.

==== Device Form

#figure(caption: "Component - DeviceForm")[
  #image(
    "/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/componenti/DeviceForm.png",
  )
]
*Descrizione*:


Componente di presentazione specifico per il dominio dei dispositivi. Si occupa esclusivamente di renderizzare l'interfaccia utente del modulo e di stabilire un binding bidirezionale con i dati forniti dal componente genitore. È agnostico rispetto al contesto: non sa se sta creando un nuovo dispositivo o modificandone uno esistente, e non esegue alcuna logica di validazione o salvataggio.

*Attributi*:
- `+ fields: JSON`: Oggetto reattivo iniettato dal padre contenente i valori dei campi del dispositivo.
- `+ errors: JSON`: Oggetto iniettato dal padre contenente gli eventuali messaggi di errore da visualizzare per ciascun campo.


*Metodi*:

Il componente è puramente dichiarativo e non espone metodi operativi.
Espone unicamente il costruttore:
- `+ DeviceForm(fields: Map<String, String | Number | Boolean>, errors: Map<String, String | null>)`

==== Asset Form
#figure(caption: "Component - AssetForm")[
  #image(
    "/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/componenti/AssetForm.png",
  )
]

*Descrizione*:

Componente di presentazione delegato al rendering del modulo per la gestione degli Asset.
Si occupa esclusivamente di renderizzare l'interfaccia utente del modulo e di stabilire un binding bidirezionale con i dati forniti dal componente genitore. È agnostico rispetto al contesto: non sa se sta creando un nuovo asset o modificandone uno esistente, e non esegue alcuna logica di validazione o salvataggio.

*Attributi*:
- `+ fields: Map<String, String | Number | Boolean>`: Oggetto reattivo iniettato dal padre contenente i valori dei campi del dispositivo.
- `+ errors: Map<String, String | null>`: Oggetto iniettato dal padre contenente gli eventuali messaggi di errore da visualizzare per ciascun campo.


*Metodi*:

Il componente è puramente dichiarativo e non espone metodi operativi.
Espone unicamente il costruttore:
- `+ AssetForm(fields: Map<String, String | Number | Boolean>, errors: Map<String, String | null>)`


=== Widget

==== AssetCreate
#figure(
  image("../uml/png/frontend/diagrammi_complessivi/AssetCreate.png", width: 130%),
  caption: [AssetCreate],
) <fig-asset-create>

Il diagramma illustra l'architettura del widget dedicato alla creazione di un nuovo asset, che segue il medesimo pattern del widget dispositivo adattando le definizioni di campo e il componente di presentazione al dominio degli asset.


===== AssetCreateWidget
#figure(caption: "Widget - AssetCreateWidget")[
  #image(
    "/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/widget/AssetCreateWidget.png",
  )
]
*Descrizione*:

Rappresenta un'isola applicativa responsabile di orchestrare la creazione di un nuovo Asset. Agisce come controller di facciata: funge da ponte tra il livello di presentazione e il livello di comunicazione col backend. Detiene la logica di business specifica per questa casistica, ma delega il rendering grafico e la gestione reattiva ai componenti e ai composable sottostanti.

*Attributi*:
- `+ submitUrl: String` : L'endpoint Flask a cui inviare il payload POST.
- `+ cancelUrl: String` : L'URL di fallback in caso di annullamento dell'operazione.
- `+ redirectUrl: String` : L'URL a cui reindirizzare l'utente in caso di successo.
- `- formModel: UseFormModel` : Model di riferimento per il componente.
- `- assetForm:AssetForm` : Componente che mostra graficamente il form degli asset.
- `- confirmButton:AsyncButton` : Componente che mostra graficamente il pulsante di conferma.

*Metodi*:

- `+ AssetCreateWidget(submitUrl : String, cancelUrl : String, redirectUrl : String)` :Costruttore che riceve esternamente gli url a cui corrispondono le azioni.
- `- createAsset(): Promise<JSON>` : Metodo asincrono invocato dal bottone di salvataggio. Esegue la validazione invocando il composable, compone il payload JSON e gestisce la chiamata di rete, catturando e smistando eventuali errori server-side, ritorna un oggetto json contenente la risposta.
- `- onSuccess(data: JSON): void` : Callback eseguita al completamento positivo della chiamata.

==== AssetDelete
#figure(
  image("../uml/png/frontend/diagrammi_complessivi/AssetDelete.png", width: 120%),
  caption: [AssetDelete],
) <fig-asset-delete>

Il diagramma illustra l'architettura del widget dedicato all'eliminazione di un asset, che interpone un modale di conferma prima di eseguire la chiamata di cancellazione e gestisce il reindirizzamento al completamento.


===== AssetDeleteWidget
#figure(caption: "Widget - AssetDeleteWidget")[
  #image(
    "/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/widget/AssetDeleteWidget.png",
  )
]
*Descrizione*:

Rappresenta un'isola applicativa responsabile di chiedere conferma dell'eliminazione ed effettuare la chiamata API di eliminazione dell'asset



*Attributi*:
- `+ submitUrl: String`: Url a cui fare la chiamata API per eliminare un asset, passato tramite props
- `+ redirectUrl: String`: Url della pagina a cui reindirizzare dopo l'esecuzione dell'operazione.
- `- deleteButton: AsyncButton`: Componente reattivo che rappresenta un pulsante di eliminazione
- `- deleteModal: BaseModal`: Componente reattivo che rappresenta un modale per richiedere la conferma di eliminazione.
- `- isModalOpen: Boolean`: Indica se il modale deve essere mostrato a schermo o meno



*Metodi*:
- `+ AssetDeleteWidget(submitUrl:string,redirectUrl:String)`:Costruttore che riceve dall'esterno gli url da utilizzare.
- `- openModal()`: Mostra a schermo il modale di conferma.

- `- closeModal()`: Nasconde il modale di conferma.
- `+ DeleteAsset(): Promise<JSON>`: Esegue la chiamata API di eliminazione dell'asset, ritorna un oggetto che rappresenta l'esito dell'operazione

- `- onSuccess()`: Callback eseguita al completamento positivo della chiamata.


==== AssetEditWidget
#figure(
  image("../uml/png/frontend/diagrammi_complessivi/AssetEdit.png", width: 130%),
  caption: [AssetEdit],
) <fig-asset-edit>

Il diagramma illustra l'architettura del widget dedicato alla modifica di un asset esistente, che precarica i valori iniziali nel form condiviso e orchestra la chiamata di aggiornamento verso il backend.

===== AssetEditWidget
#figure(caption: "Widget - AssetEditWidget")[
  #image(
    "/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/widget/AssetEditWidget.png",
  )
]

*Descrizione*:

Rappresenta l'isola applicativa che l'utente usa per modificare i dati di un asset, rappresenta il viewModel del MVVM

*Attributi*:
- `- submitUrl: String`: Url a cui effettuare la chiamata API di modifica.

- `- cancelUrl:String`: Url a cui reindirizzare l'utente in caso di annullamento.

- `- redirectUrl:String`: Url a cui reindirizzare l'utente dopo la modifica.

- `- initialName`: Valore a cui inizializzare i campo del form relativo al nome dell'asset.
- `- initialAssetType`: Valore a cui inizializzare i campo del form relativo al tipo dell'asset.
- `- initialDescription`: Valore a cui inizializzare i campo del form relativo alla descrizione dell'asset.

- `- formModel`: Model di riferimento che tiene traccia dello stato interno.

- `- assetForm: AssetForm`: Componente che visualizza il form per l'inserimento dei dati dell'asset

- `- confirmButton: AsyncButton`: Pulsante per confermare il salvataggio delle modifiche.




*Metodi*:
#set par(justify: false)
- `+ AssetEditWidget(- submitUrl:String, cancelUrl:String, redirectUrl:String, initialName:String, initialAssetType:String,initialDescription:String)`: Costruttore che riceve dall'esterno i valori a cui inizializzare il form  e gli endpoint a cui effettuare le chiamate e reindirizzare l'utente.

- `- updateAsset(): Promise<JSON>`: Effettua la chiamata API per la modifica dell' asset

- `- onSuccess()`: Callback eseguita al completamento positivo della chiamata.


==== DeviceCreate
#figure(
  image("../uml/png/frontend/diagrammi_complessivi/DeviceCreate.png", width: 130%),
  caption: [DeviceCreate],
) <fig-device-create>

Il diagramma illustra l'architettura del widget dedicato alla creazione di un nuovo dispositivo, mostrando come il componente smart orchestri il composable di gestione form, le definizioni di campo e i componenti dumb di presentazione e conferma.


===== DeviceCreateWidget
#figure(caption: "Widget - DeviceCreateWidget")[
  #image(
    "/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/widget/DeviceCreateWidget.png",
  )
]

*Descrizione*:

Rappresenta il widget per la creazione di un nuovo dispositivo.


*Attributi*:
- `- submitUrl: String`: Url a cui effettuare la chiamata API.

- `- cancelUrl: String`: Url a cui reindirizzare l'utente in caso di annullamento dell'operazione.

- `- defaultStandard: String`: Id dello standard di da usare di default durante la valutazione.

- `- formModel: useFormModel`: Model di riferimento che tiene traccia dello stato interno.
- `- deviceForm: DeviceForm`: Componente che permette all'utente di visualizzare il form per la creazione del dispositivo.

- `- confirmButton: AsyncButton`: Bottone per la conferma della creazione del dispositivo.



*Metodi*:
- `+ DeviceCreateWidget( submitUrl: String, cancelUrl: String, defaultStandard: String)`: Costruttore che riceve gli url per gli endpoint e a cui fare i redirect dall'esterno.

- `createDevice(): Promise<JSON>`: Effettua la chiamata API per la creazione di un nuovo dispositivo.

- `-onSuccess()`: Callback eseguita al completamento positivo della chiamata.


==== DeviceEdit
#figure(
  image("../uml/png/frontend/diagrammi_complessivi/DeviceEdit.png", width: 130%),
  caption: [DeviceEdit],
) <fig-device-edit>

Il diagramma illustra l'architettura del widget dedicato alla modifica di un dispositivo esistente, che inizializza il form con i valori correnti ricevuti dal server e delega la validazione e il rendering agli stessi layer condivisi del widget di creazione.

===== DeviceEditWidget
#figure(caption: "Widget - DeviceEditWidget")[
  #image(
    "/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/widget/DeviceEditWidget.png",
  )
]

*Descrizione*:


Rappresenta Il widget per la modifica dei dati del dispositivo.




*Attributi*:
- `- submitUrl: String`: Url a cui effettuare la chiamata API.

- `- cancelUrl`: Url a cui reindirizzare l'utente in caso di annullamento dell'operazione.

- `- initialName: String`: Valore a cui inizializzare il nome del dispositivo.
- `- initialOs: String`: Valore a cui inizializzare il nome del sistema operativo  del dispositivo.
- `- initialDescription: String`: Valore a cui inizializzare la descrizione del dispositivo.
- `- formModel: useFormModel`: Model di riferimento che tiene traccia dello stato interno.
- `- deviceForm: DeviceForm`: Componente che permette all'utente di visualizzare il form per la creazione del dispositivo.

- `- confirmButton: AsyncButton`: Bottone per la conferma della modifica del dispositivo.



*Metodi*:
- `+ DeviceEditWidget(submitUrl:String,cancelUrl:String,initialName:String,initialOs:String,initialDescription:String)`:
Costruttore che riceve gli url come dipendenze dall'esterno.

- `- updateDevice(): Promise<JSON>`: Effettua la chiamata API.



- `- onSuccess()`: Callback eseguita al completamento positivo della chiamata.


==== DeviceExportWidget
#figure(caption: "Widget - DeviceExportWidget")[
  #image(
    "/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/widget/DeviceExportWidget.png",
  )
]

*Descrizione*:

Rappresenta il widget che permette di esportare il dispositivo come file e di selezionare l'estensione desiderata.



*Attributi*:
- `- deviceName: String`: Nome del dispositivo da esportare.

- `- exportBaseUrl: String`: Url per la chiamata API per ricevere il file rappresentante le informazioni del dispositivo.


- `- isModalOpen: Boolean`: Serve a gestire la visibilità del modale a schermo.

- `- exportFormat: String`: Tiene traccia del formato per l'esportazione selezionato dall'utente.





*Metodi*:
- `- openModal()`: Apre il modale per l'esportazione del dispositivo.

- `- closeModal()`: Chiude il modale per l'esportazione.

- `- downloadFile(): Promise<JSON>`: Esegue la chiamata API per scaricare il file.


==== DeviceImport
#figure(
  image("../uml/png/frontend/diagrammi_complessivi/DeviceImport.png", width: 130%),
  caption: [DeviceImport],
) <fig-device-import>
Il diagramma illustra l'architettura del widget dedicato all'importazione di un dispositivo da file, che compone un modale contenente un'area di drag-and-drop per la selezione del file e un pulsante asincrono per l'invio al backend.




===== DeviceImportWidget
#figure(caption: "Widget - DeviceImportWidget")[
  #image(
    "/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/widget/DeviceImportWidget.png",
  )
]

*Descrizione*:

Rappresenta un widget usato durante l'importazioni delle informazioni legate ad un dispositivo tramite file.


*Attributi*:
- `- importUrl: String`: Url da usare per la chiamata API relativa all'importazione del file.

- `- redirectUrl: String`: Url della pagina verso cui reindirizzare l'utente dopo l'importazione.

- `- dropZoneModal: BaseModal`: Modal per l'import del file
- `- dropZone: FileDropZone`: File drop zone per il caricamento di file.
- `- confirmButton: AsyncButton`: Pulsante per la conferma
- `- isModalOpen: Boolean`: Viene usato per gestire la visibilità del modale
- `- selectedFile: File`: Tiene traccia del file caricato dall'utente.
- `- errorMessage: String`: Messaggio di errore da visualizzare a schermo.



*Metodi*:
- `+ DeviceImportWidget(importUrl: String,redirectUrl: String)`: Costruttore che riceve gli url per chiamate e redirect dall'esterno.

- `- openModal()`: Mostra a schermo il modale per l'importazione.

- `- closeModal()`: Nasconde il modale per l'importazione.
- `- onFileSelect()`: Funzione eseguita al caricamento del file per aggiornare lo stato del widget.
- `- onFileError()`: Funzione eseguita in caso di errori nel caricamento del file.

- `- uploadFile()`: Funzione che esegue la chiamata API di importazione.

- `- onSuccess()`: Callback eseguita al completamento positivo della chiamata.


==== SessionClose
#figure(
  image("../uml/png/frontend/diagrammi_complessivi/SessionClose.png", width: 100%),
  caption: [SessionClose],
) <fig-session-close>
Il diagramma illustra l'architettura del widget dedicato alla chiusura di una sessione di valutazione, che richiede conferma esplicita tramite modale prima di eseguire la chiamata di terminazione e reindirizzare l'utente.



===== SessionCloseWidget


#figure(caption: "Widget - SessionCloseWidget")[
  #image(
    "/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/widget/SessionCloseWidget.png",
  )
]


*Descrizione*:

Rappresenta il widget che permette all'utente di chiudere una sessione di valutazione di un dispositivo.


*Attributi*:
- `- closeUrl: String`: Url a cui effettuare la chiamata API per la chiusura della sessione di valutazione.

- `- redirectUrl: String`: Url a cui reindirizzare l'utente dopo la chiusura della sessione.

- `- warningModal: BaseModal`: Modale mostrato all'utente per chiedere conferma della chiusura della sessione.

- `- confirmButton: AsyncButton`: Pulsante per chiudere la sessione.

- `- isModalOpen: Boolean`: Gestisce la visibilità del modale.



*Metodi*:
- `+ SessionCloseWidget(closeUrl: String, redirectUrl: String)`: Costruttore che riceve gli url per le chiamate API e per reindirizzare l'utente.
- `- openModal()`: Apre il modale di conferma.

- `- closeModal()`: Chiude il modale di conferma.

- `- closeSession(): Promise<JSON>`: Effettua la chiamata per chiudere la sessione.


- `- onSuccess()`: Callback eseguita al completamento positivo della chiamata.


==== SessionCommitAndClose
#figure(
  image("../uml/png/frontend/diagrammi_complessivi/SessionCommitAndClose.png", width: 100%),
  caption: [SessionCommitAndClose],
) <fig-session-commit-and-close>
Il diagramma illustra l'architettura del widget dedicato al salvataggio e alla chiusura contestuale della sessione, che consolida le due operazioni in un'unica azione delegata al pulsante asincrono.



===== SessionCommitAndCloseWidget
#figure(caption: "Widget - SessionCommitAndCloseWidget")[
  #image(
    "/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/widget/SessionCommitAndCloseWidget.png",
  )
]


*Descrizione*:

Rappresenta il widget che permette di salvare e chiudere la sessione.



*Attributi*:
- `- commitAndCloseUrl: String`: Url a cui fare la chiamata API per salvare e chiudere la sessione.

- `- redirectUrl: String`: Url a cui reindirizzare l'utente dopo il salvataggio e la chiusura della sessione.



- `- confirmButton: AsyncButton`: Pulsante con cui l'utente salva e chiude la sessione.





*Metodi*:
- `+ SessionCommitAndCloseWidget(commitAndCloseUrl: String, redirectUrl: String)`: Costruttore che riceve gli url per le chiamate API e  i redirect dall'esterno.

- `- commitAndCloseSession():Promise<JSON>`:Effettua la chiamata API per il salvataggio e chiusura della sessione.


- `- onSuccess()`:Callback eseguita al completamento positivo della chiamata.



==== SessionCommit
#figure(
  image("../uml/png/frontend/diagrammi_complessivi/SessionCommit.png", width: 100%),
  caption: [SessionCommit],
) <fig-session-commit>
Il diagramma illustra l'architettura del widget dedicato al salvataggio della sessione attiva, che al completamento positivo della chiamata mostra un messaggio temporaneo tramite il componente Toast.



===== SessionCommitWidget
#figure(caption: "Widget - SessionCommitWidget")[
  #image(
    "/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/widget/SessionCommitWidget.png",
  )
]

*Descrizione*:

Rappresenta il widget che permette all'utente di salvare la session


*Attributi*:
- `- commitUrl:String`:Url a cui fare la chiamata API per il salvataggio della sessione di modifica.


- `- toastMessage:String`:Messaggio da visualizzare tramite toast.


- `- saveButton:AsyncButton`:Pulsante per salvare la sessione

- `- toast:Toast`:Componente visivo  che mostra temporaneamente un messaggio



*Metodi*:
- `+ SessionCommitWidget(commitUrl:String)`:Costruttore che riceve gli url a cui effettuare le chiamate API dall'esterno


- `- onSuccess()`:Callback eseguita al completamento positivo della chiamata.


- `- clearToast()`:Funzione che nasconde il messaggio temporaneo.

- `- commitSession():Promise<JSON>`:Funzione che esegue la chiamata API per il salvataggio della sessione.


==== SessionOpen
#figure(
  image("../uml/png/frontend/diagrammi_complessivi/SessionOpen.png", width: 100%),
  caption: [SessionOpen],
) <fig-session-open>
Il diagramma illustra l'architettura del widget dedicato all'apertura di una nuova sessione di valutazione, che delega l'esecuzione della chiamata al pulsante asincrono e gestisce la visualizzazione di eventuali errori di apertura.


===== SessionOpenWidget


#figure(caption: "Widget - SessionOpenWidget")[
  #image(
    "/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/widget/SessionOpenWidget.png",
  )
]



*Descrizione*:

Rappresenta il widget per l'apertura di una nuova sessione di valutazione.


*Attributi*:
- `- createSessionUrl: String`: Url a cui effettuare la chiamata API per aprire una nuova sessione.
- `- redirectUrlTemplate: String`: Url a cui reindirizzare l'utente dopo l'apertura della sessione.

- `- deviceId: String`: Id del dispositivo a cui associare la sessione di valutazione.


- `- confirmButton: AsyncButton`: Pulsante per aprire una nuova sessione.

- `- errorMessage: String`: Messaggio di errore da far visualizzare all'utente.



*Metodi*:
- `+ SessionOpenWidget(createSessionUrl:String,deviceId:String, redirectUrl:String)`:Costruttore che riceve gli url per chiamate API e redirect dall'esterno.

- `- openSession(): Promise<JSON>`:Funzione per eseguire la chiamata API per aprire una nuova sessione.

- `- onError()`: Funzione eseguita in caso di errori durante l'apertura della sessione.


- `- onSuccess()`: Callback eseguita al completamento positivo della chiamata.




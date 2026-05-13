== Asset<classe_asset>

/*
#image("../uml/png/classe_asset.png")


Il diagramma delle classi illustra la progettazione architetturale per il modulo di Gestione degli Asset. \ Un Asset rappresenta una componente fisica o logica di un Dispositivo e viene sempre gestito nel contesto del Dispositivo padre, identificato tramite device_id.


+ #[ *Inbound Adapter*


<<<<<<< HEAD
 Il pacchetto Inbound Adapter rappresenta il punto di contatto con l’utente. Contiene il flask asset request handler, sviluppato come Blueprint Flask. Il suo unico compito è ricevere le richieste HTTP, tradurle in un formato comprensibile al sistema e restituire una risposta web. Gli endpoint sono annidati gerarchicamente sotto la risorsa Dispositivo, poiché un Asset non esiste in modo autonomo rispetto al Dispositivo padre.
 Questo livello non prende nessuna decisione logica.

 Vengono usati dei DTO specifici per gestire il passaggio dei dati relativi agli asset tra le varie parti del sistema, questo permette al dispositivo di mantenere il possesso esclusivo sugli asset
=======
 Il pacchetto Inbound Adapter rappresenta il punto di contatto con l'utente. Contiene l'AssetController, sviluppato come Blueprint Flask. Il suo unico compito è ricevere le richieste HTTP, tradurle in un formato comprensibile al sistema e restituire una risposta web. Gli endpoint sono annidati gerarchicamente sotto la risorsa Dispositivo, poiché un Asset non esiste in modo autonomo rispetto al Dispositivo padre. Questo livello non prende nessuna decisione logica.
>>>>>>> 5b7f75c1 (Fix: sistemate sezioni 5.3 e 5.4. (issue #165))
]

+ #[ *Application Core e Ports*


 Al centro del diagramma si trova la logica vera e propria del software. Per proteggere questa parte centrale, essa comunica con l'esterno unicamente tramite delle Porte (Interfacce astratte):


<<<<<<< HEAD
   `AssetUseCasePort` (Inbound Port): È l'elenco dei servizi offerti all'utente. Il request handler "utilizza" questa porta per inviare i comandi, senza aver bisogno di sapere come verranno eseguiti.


   `DispositivoService` (Service): Questa classe realizza le funzioni dalle Inbound Port, crea e modifica le entità Asset, ma sempre utilizzando i metodi della classe Device e verifica che i dati rispettino le regole di business.y
=======
   `InterfaceAssetUseCase` (Inbound Port): È l'elenco dei servizi offerti all'utente. Il Controller «utilizza» questa porta per inviare i comandi, senza aver bisogno di sapere come verranno eseguiti. I metodi esposti coprono le operazioni CRUD sugli asset (getListaAsset, creaAsset, getDettaglioAsset, modificaAsset, eliminaAsset), con i parametri che includono sempre il device_id per rispettare la natura gerarchica della relazione.


   `AssetService` (Service): È la classe che svolge il lavoro reale. Implementa `InterfaceAssetUseCase` e riceve i comandi dalla porta Inbound. Crea e modifica le entità Asset e verifica che i dati rispettino le regole di business tramite un metodo privato dedicato (`validaRegoleBusiness`). In particolare, questo metodo garantisce che il campo tipo contenga esclusivamente uno dei valori ammessi dall'enumerazione TipoAsset (Security, Network); questa validazione è delegata interamente al livello applicativo e non al database.
>>>>>>> 5b7f75c1 (Fix: sistemate sezioni 5.3 e 5.4. (issue #165))


   `DeviceRepositoryPort` (Outbound Port): Quando il Service deve salvare i dati, non contatta direttamente il database. Usa invece questa porta di uscita, che dichiara solo il bisogno di salvare o leggere un dato, senza specificare la tecnologia.

]
+ #[ *Outbound Adapter*


 Il pacchetto Outbound Adapter contiene il `MongoDeviceRepository`. Questa classe implementa il contratto richiesto dalla porta `DeviceRepositoryPort` e traduce gli oggetti di dominio in operazioni concrete su MongoDB.
 
 Essendo relazione di composizione tra dispositivo e asset una regola di business, si è preferito mantenere un'unica porta repository e di non permettere il la modifica diretta degli asset senza passare dal device, cosa che rischierebbe di violare le regole di business e di causare stati inconsistenti.
 
 Tuttavia questa scelta richiede di non esporre un metodo granulare per il salvataggio delle modifiche agli asset sul sistema di  persistenza.

 Questo richiederà un'ottimizzazione da parte del repository o causerà un costo in termini di performance.

  #upper("è") in valutazione anche l'introduzione di un'unità di dominio registroModifiche, il cui compito è di tracciare le modifiche e permettere a servizi esterni di replicarle.
]*/
/*
== Modulo di scrittura Asset
#figure(
  image("../uml/png/CreateAsset/WriteAssetModule.png", width: 100%),
  caption: [Modulo di scrittura Asset]
) <fig-write-asset-module>

Il diagramma illustra l'architettura del modulo di scrittura per la gestione degli Asset, coprendo le operazioni di creazione, modifica ed eliminazione secondo i principi dell'architettura esagonale.\ Nei paragrafi seguenti vengono descritti in dettaglio i componenti di ciascun caso d'uso.
*/
=== CreateAsset

#figure(
  image("../uml/png/CreateAsset/CreateAsset.png", width: 100%),
  caption: [Caso d'uso CreateAsset]
) <fig-create-asset>

Il diagramma illustra l'architettura del modulo di creazione di un Asset all'interno di una sessione di valutazione attiva. 

#block(breakable: false)[
==== FlaskWriteAssetController <FlaskWriteAssetController>

#figure(
  image("../uml/png/CreateAsset/FlaskWriteAssetController.png", width: 45%),
  caption: [FlaskWriteAssetController]
) <fig-write-asset-controller>

*Descrizione*

_FlaskWriteAssetController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP relative alla gestione (scrittura) degli Asset e le inoltra al livello applicativo.

*Attributi*

- `- create_asset_use_case: CreateAssetUseCase` — inbound port usata per la creazione di un asset
- `- delete_asset_use_case: DeleteAssetUseCase` — inbound port usata per la rimozione di un asset
- `- update_asset_use_case: UpdateAssetUseCase` — inbound port usata per l'aggiornamento di un asset

*Metodi e funzioni*

- `+ create_asset(req: Request): Response` — riceve la richiesta HTTP di creazione di un nuovo Asset, estrae i dati dal corpo della richiesta e li inoltra al livello applicativo; restituisce una risposta HTTP con l'esito dell'operazione.
- `+ update_asset(req: Request): Response` — riceve la richiesta HTTP di aggiornamento di un Asset esistente, estrae i dati modificati e li inoltra al livello applicativo; restituisce una risposta HTTP con l'esito dell'operazione.
- `+ delete_asset(req: Request): Response` — riceve la richiesta HTTP di eliminazione di un Asset, estrae l'identificativo dalla richiesta e lo inoltra al livello applicativo; restituisce una risposta HTTP con l'esito dell'operazione.
]


==== CreateAssetUseCase
#figure(
  image("../uml/png/CreateAsset/CreateAssetUseCase.png", width: 45%),
  caption: [CreateAssetUseCase]
) <fig-create-asset-use-case>
*Descrizione*

_CreateAssetUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per la creazione di un nuovo Asset all'interno della sessione di valutazione. Viene implementata da _CreateAssetService_ e utilizzata da _FlaskWriteAssetController_.

*Attributi*

_CreateAssetUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ create_asset(asset: CreateAssetCommand): bool` — firma del metodo delegato all'esecuzione della logica di creazione a partire dai dati contenuti nel comando.



==== CreateAssetCommand

#figure(
  image("../uml/png/CreateAsset/CreateAssetCommand.png", width: 35%),
  caption: [CreateAssetCommand]
) <fig-create-asset-command>

*Descrizione*

_CreateAssetCommand_ è il Command Object che veicola i dati necessari alla creazione di un Asset dal controller al service. Separa la struttura dei dati in ingresso dall'entità di dominio, rendendo esplicita l'intenzione dell'operazione.

*Attributi*

- `+ session_id: String` — identificativo della sessione di valutazione attiva a cui l'Asset viene associato.
- `+ device_id: String` — identificativo del dispositivo che lo contiene.
- `+ name: String` — nome del nuovo Asset.
- `+ type: AssetType` — tipo dell'Asset.
- `+ description: String` — descrizione testuale dell'Asset.


*Metodi e funzioni*

_CreateAssetCommand_ non definisce metodi.


==== CreateAssetService


#figure(
  image("../uml/png/CreateAsset/CreateAssetService.png", width: 40%),
  caption: [CreateAssetService]
) <fig-create-asset-service>

*Descrizione*

_CreateAssetService_ è il service applicativo appartenente all'Application Core responsabile della logica di creazione di un Asset. Implementa l'interfaccia _CreateAssetUseCase_, recupera la sessione attiva tramite _GetEvaluationSession_, aggiunge il nuovo _Asset_ e persiste la sessione aggiornata tramite _SaveEvaluationSession_.

*Attributi*

- `- save_evaluation_session_port: SaveSessionPort` — outbound port usata per il salvataggio delle modifiche nella sessione
- `- get_evaluation_session_port: GetEvaluationSessionPort` — outbound port usata per prelevare la sessione di valutazione

*Metodi e funzioni*

- `+ create_asset(asset: CreateAssetCommand): string` — concretizza il contratto definito da _CreateAssetUseCase_. Recupera la sessione attiva, vi aggiunge il nuovo Asset e ne persiste lo stato aggiornato. Ritorna l'id dell'asset creato.



==== Asset <Asset>

#figure(
  image("../uml/png/CreateAsset/Asset.png", width: 45%),
  caption: [Asset]
) <fig-asset-domain>

*Descrizione*

_Asset_ è l'entità di dominio che rappresenta un asset oggetto di valutazione di conformità all'interno di una sessione.

*Attributi*

- `- asset_id: String` — identificativo univoco dell'Asset.
- `- asset_anagraphic: AssetAnagraphic` — oggetto che incapsula i dati anagrafici dell'asset.
- `- asset_proprieties: AssetProprieties` — oggetto che incapsula le proprietà e lo stato valutativo dell'asset.

*Metodi e funzioni*

- `+ set_node_choice(requirement_id: String, node_id: String, value: Bool): void` — imposta o aggiorna la scelta (risposta) effettuata per un determinato nodo decisionale relativo a un requisito.
- `+ set_justification(requirement_id: String, node_id: String, value: Bool): void` — imposta la giustificazione per un determinato nodo di un requisito. 
- `+ update_anagraphic(name: String, type: AssetType, description: String): void` — aggiorna le informazioni anagrafiche dell'asset (nome, tipologia e descrizione), delegando l'aggiornamento all'istanza interna di _AssetAnagraphic_.

#figure(
  image("../uml/png/CreateAsset/AssetAnagraphic.png", width: 20%),
  caption: [AssetAnagraphic]
) <fig-asset-domain>
*Descrizione*

_AssetAnagraphic_ è l'entità delegata alla gestione e all'incapsulamento delle informazioni anagrafiche e dei metadati di base di un generico asset. 

*Attributi*

- `- name: String` --- stringa di testo che rappresenta il nome identificativo dell'asset.
- `- type: AssetType` --- attributo che definisce la tipologia o la categoria di appartenenza dell'asset.
- `- description: String` --- stringa di testo destinata a contenere una descrizione estesa, note o dettagli aggiuntivi riguardanti le caratteristiche fisiche o logiche dell'asset.

*Metodi e funzioni*

_AssetAnagraphic_ non definisce metodi.


==== AssetProprieties <AssetProprieties>

#figure(
  image("../uml/png/CreateAsset/AssetProprieties.png", width: 45%),
  caption: [AssetProprieties]
) <fig-asset-proprieties-domain>

*Descrizione*

_AssetProprieties_ è l'entità delegata alla gestione dello stato valutativo e delle proprietà specifiche di un asset. Presenta una relazione di composizione con la classe _AssetEvidence_ con cardinalità `1..*`, gestendone il ciclo di vita all'interno di una lista.

*Attributi*

- `+ asset_evidence_list: List<AssetEvidence>` — struttura dati che incapsula e gestisce l'elenco delle evidenze (scelte e giustificazioni) associate all'asset.

*Metodi e funzioni*

- `+ set_node_choice(requirement_id: String, node_id: String, value: Bool): void` — imposta o aggiorna la scelta (risposta) effettuata per un determinato nodo decisionale relativo a un requisito.
- `+ set_justification(requirement_id: String, node_id: String, value: Bool): void` — imposta o aggiorna la giustificazione testuale per un determinato nodo di un requisito.
- `+ get_evidence(requirement_id: String): AssetEvidence | void` — recupera l'oggetto _AssetEvidence_ associato a un determinato identificativo di requisito. Restituisce l'evidenza se presente, altrimenti `void` (nessun valore/null).


==== InMemoryEvaluationSessionCache <InMemoryEvaluationSessionCache>

#figure(
  image("../uml/png/CreateAsset/InMemoryEvaluationSessionCache.png", width: 45%),
  caption: [InMemoryEvaluationSessionCache]
) <fig-in-memory-evaluation-session-cache>

*Descrizione*

_InMemoryEvaluationSessionCache_ è la classe dell'Outbound Adapter annotata come _Session Cache_ che implementa entrambe le porte outbound _SaveEvaluationSession_ e _GetEvaluationSession_. Gestisce la persistenza in memoria delle sessioni di valutazione tramite un dizionario indicizzato per `session_id`.

*Attributi*

- `- session: EvaluationSession` — contiene l'oggetto EvaluationSession

*Metodi e funzioni*

- `+ create_evaluation_session(standard: ComplianceStandard, device: Device): EvaluationSession` — crea e registra una nuova sessione di valutazione.
- `+ get_evaluation_session(session_id: String): EvaluationSession` — recupera la sessione corrispondente all'identificativo fornito.
- `+ save_evaluation_session(session: EvaluationSession): void` — aggiorna la sessione in memoria.
- `+ has_active_session(): bool` — verifica se esiste una sessione attiva.
- `+ close_evaluation_session(session_id: String): void` — chiude la sessione identificata da `session_id`.



==== SaveEvaluationSessionPort <SaveEvaluationSessionPort>
#figure(
  image("../uml/png/CreateAsset/SaveEvaluationSessionPort.png", width: 45%),
  caption: [SaveEvaluationSessionPort]
) <fig-save-evaluation-session-port>
*Descrizione*

_SaveEvaluationSessionPort_ è l'interfaccia (Outbound Port) che definisce il contratto per il salvataggio della sessione di valutazione nel sistema di persistenza in memoria. Viene implementata da _InMemoryEvaluationSessionCache_ e utilizzata da tutti i service del modulo che modificano lo stato della sessione, tra cui _CreateAssetService_, _SaveAssetService_ e _DeleteAssetService_.

*Attributi*

_SaveEvaluationSessionPort_ non definisce attributi.

*Metodi e funzioni*

- `+ save_evaluation_session(session: EvaluationSession): void` — firma del metodo che persiste la sessione aggiornata nel sistema in memoria.


==== GetEvaluationSessionPort <GetEvaluationSessionPort>
#figure(
  image("../uml/png/CreateAsset/GetEvaluationSessionPort.png", width: 45%),
  caption: [GetEvaluationSessionPort]
) <fig-get-session-port>
*Descrizione*

_GetEvaluationSessionPort_ è l'interfaccia (Outbound Port) che definisce il contratto per il recupero della sessione di valutazione dal sistema di persistenza in memoria. Viene implementata da _InMemoryEvaluationSessionCache_ e utilizzata da tutti i service del modulo che necessitano di accedere alla sessione corrente, tra cui _CreateAssetService_, _SaveAssetService_, _DeleteAssetService_ e _GetAssetAnagraphicService_.

*Attributi*

_GetEvaluationSessionPort_ non definisce attributi.

*Metodi e funzioni*

- `+ get_evaluation_session(session_id: String): EvaluationSession` — firma del metodo che recupera la sessione di valutazione attiva corrispondente all'identificativo fornito.


=== UpdateAsset

#block(breakable: false)[
#figure(
  image("../uml/png/UpdateAsset/UpdateAsset.png", width: 100%),
  caption: [Caso d'uso UpdateAsset]
) <fig-save-asset>

Il diagramma illustra l'architettura del modulo di modifica di un Asset esistente all'interno di una sessione di valutazione attiva.

- Per la definizione di _FlaskWriteAssetController_, vedere la sezione @FlaskWriteAssetController. \
- Per la definizione di _Asset_, vedere la sezione @Asset. \
- Per la definizione di _SaveEvaluationSession_, vedere la sezione @SaveEvaluationSessionPort. \
- Per la definizione di _GetEvaluationSession_, vedere la sezione @GetEvaluationSessionPort. \
- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la sezione @InMemoryEvaluationSessionCache.

Di seguito vengono documentati esclusivamente i componenti introdotti specificamente per questo caso d'uso.
]

#block(breakable: false)[
==== UpdateAssetUseCase
#figure(
  image("../uml/png/UpdateAsset/UpdateAssetUseCase.png", width: 40%),
  caption: [UpdateAssetUseCase]
) <fig-save-asset-use-case>
*Descrizione*

_UpdateAssetUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per la modifica di un Asset esistente all'interno della sessione di valutazione. Viene implementata da _UpdateAssetService_ e utilizzata da _FlaskWriteAssetController_.

*Attributi*

_UpdateAssetUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ update_asset(asset: UpdateAssetCommand): void` — firma del metodo delegato all'esecuzione della logica di aggiornamento a partire dai dati contenuti nel comando.
]


==== UpdateAssetCommand
#figure(
  image("../uml/png/UpdateAsset/UpdateAssetCommand.png", width: 35%),
  caption: [UpdateAssetCommand]
) <fig-save-asset-command>

*Descrizione*

_UpdateAssetCommand_ è il Command Object che veicola i dati necessari alla modifica di un Asset dal controller al service. Separa la struttura dei dati in ingresso dall'entità di dominio.

*Attributi*

- `+ device_id: String` — identificativo del device a cui appartiene.
- `+ asset_id: String` — identificativo univoco dell'Asset da modificare.
- `+ name: String` — nome aggiornato dell'Asset.
- `+ asset_type: AssetType` — tipo aggiornato dell'Asset.
- `+ description: String` — descrizione testuale aggiornata dell'Asset.
- `+ session_id: String` — identificativo della sessione di valutazione attiva.

*Metodi e funzioni*

_UpdateAssetCommand_ non definisce metodi.


#block(breakable: false)[
==== UpdateAssetService

#figure(
  image("../uml/png/UpdateAsset/UpdateAssetService.png", width: 45%),
  caption: [UpdateAssetService]
) <fig-save-asset-service>

*Descrizione*

_UpdateAssetService_ è il service applicativo appartenente all'Application Core responsabile della logica di aggiornamento di un Asset esistente. Implementa l'interfaccia _UpdateAssetUseCase_, recupera la sessione attiva tramite _GetEvaluationSession_, aggiorna l'Asset corrispondente e persiste la sessione modificata tramite _SaveEvaluationSession_.

*Attributi*

- `- save_evaluation_session_port: SaveSessionPort` — outbound port usata per il salvataggio delle modifiche nella sessione
- `- get_evaluation_session_port: GetEvaluationSessionPort` — outbound port usata per prelevare la sessione di valutazione

*Metodi e funzioni*

- `+ udpate_asset(asset: UpdateAssetCommand): void` — concretizza il contratto definito da _UpdateAssetUseCase_. Recupera la sessione attiva, individua l'Asset da aggiornare tramite `asset_id` e ne persiste lo stato modificato.
]

=== DeleteAsset <DeleteAsset>

#block(breakable: false)[
#figure(
  image("../uml/png/DeleteAsset/DeleteAsset.png", width: 100%),
  caption: [Caso d'uso DeleteAsset]
) <fig-delete-asset>

Il diagramma illustra l'architettura del modulo di eliminazione di un Asset esistente all'interno di una sessione di valutazione attiva. 

- Per la definizione di _FlaskWriteAssetController_, vedere la sezione @FlaskWriteAssetController. \
- Per la definizione di _Asset_, vedere la sezione @Asset. \
- Per la definizione di _SaveEvaluationSession_, vedere la sezione @SaveEvaluationSessionPort. \
- Per la definizione di _GetEvaluationSession_, vedere la sezione @GetEvaluationSessionPort. \
- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la sezione @InMemoryEvaluationSessionCache.

Di seguito vengono documentati esclusivamente i componenti introdotti specificamente per questo caso d'uso.
]


==== DeleteAssetCommand

#figure(
  image("../uml/png/DeleteAsset/DeleteAssetCommand.png", width: 40%),
  caption: [DeleteAssetCommand]
) <fig-delete-asset-command>

*Descrizione*

_DeleteAssetCommand_ è il Command Object utilizzato per trasportare i dati necessari all'eliminazione di un Asset dalla sessione di valutazione. Incapsula i parametri di input del metodo esposto da _DeleteAssetUseCase_.

*Attributi*

- `+ device_id: String` — identificativo univoco del dispositivo che contiene l'asset.
- `+ asset_id: String` — identificativo univoco del Asset da eliminare.
- `+ session_id: String` — identificativo univoco della sessione.

*Metodi e funzioni*

_DeleteAssetCommand_ non definisce metodi propri.

==== DeleteAssetUseCase

#figure(
  image("../uml/png/DeleteAsset/DeleteAssetUseCase.png", width: 45%),
  caption: [DeleteAssetUseCase]
) <fig-delete-asset-use-case>

*Descrizione*

_DeleteAssetUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per l'eliminazione di un Asset dalla sessione di valutazione. Viene implementata da _DeleteAssetService_ e utilizzata da _FlaskWriteAssetController_.

*Attributi*

_DeleteAssetUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ delete_asset(command: DeleteAssetCommand): void` — firma del metodo delegato all'esecuzione della logica di eliminazione a partire dai dati contenuti nel Command.

==== DeleteAssetService

#figure(
  image("../uml/png/DeleteAsset/DeleteAssetService.png", width: 45%),
  caption: [DeleteAssetService]
) <fig-delete-asset-service>

*Descrizione*

_DeleteAssetService_ è il service applicativo appartenente all'Application Core responsabile della logica di eliminazione di un Asset. Implementa l'interfaccia _DeleteAssetUseCase_, riceve un _DeleteAssetCommand_ contenente gli identificativi necessari, recupera la sessione tramite _GetEvaluationSession_, rimuove l'Asset corrispondente e persiste la sessione aggiornata tramite _SaveEvaluationSession_.

*Attributi*

- `- save_evaluation_session_port: SaveSessionPort` — outbound port usata per il salvataggio delle modifiche nella sessione
- `- get_evaluation_session_port: GetEvaluationSessionPort` — outbound port usata per prelevare la sessione di valutazione

*Metodi e funzioni*

- `+ delete_asset(command: DeleteAssetCommand): void` — concretizza il contratto definito da _DeleteAssetUseCase_. Recupera la sessione attiva, individua e rimuove l'Asset corrispondente e ne persiste lo stato aggiornato.

=== GetAssetAnagraphic <GetAssetAnagraphic>

#figure(
  image("../uml/png/GetAssetAnagraphic/GetAssetAnagraphic.png", width: 90%),
  caption: [Caso d'uso GetAssetAnagraphic]
) <fig-get-asset-detail>

Il diagramma illustra l'architettura del modulo dedicato al recupero del dettaglio di un Asset all'interno di una sessione di valutazione attiva. 

- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la sezione @InMemoryEvaluationSessionCache.

Di seguito vengono documentati esclusivamente i componenti introdotti specificamente per questo caso d'uso.


==== FlaskAssetAnagraphicController



==== GetAssetAnagraphicCommand

#figure(
  image("../uml/png/GetAssetAnagraphic/GetAssetAnagraphicCommand.png", width: 30%),
  caption: [GetAssetAnagraphicCommand]
) <fig-get-asset-detail-command>

*Descrizione*

_GetAssetAnagraphicCommand_ è il Command Object utilizzato per trasportare i dati necessari al recupero del dettaglio di un Asset. Incapsula i parametri di input del metodo esposto da _GetAssetAnagraphicUseCase_.

*Attributi*

- `+ device_id: String` — identificativo univoco del device che contiene l'asset
- `+ asset_id: String` — identificativo univoco dell'Asset di cui recuperare il dettaglio.
- `+ session_id: String` — identificativo univoco della sessione di valutazione corrente.

*Metodi e funzioni*

_GetAssetAnagraphicCommand_ non definisce metodi propri.

==== GetAssetAnagraphicUseCase

#figure(
  image("../uml/png/GetAssetAnagraphic/GetAssetAnagraphicUseCase.png", width: 60%),
  caption: [GetAssetAnagraphicUseCase]
) <fig-get-asset-detail-use-case>

*Descrizione*

_GetAssetAnagraphicUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per il recupero del dettaglio di un Asset. Viene implementata da _GetAssetAnagraphicService_.

*Attributi*

_GetAssetAnagraphicUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ get_asset_anagraphic(command: GetAssetAnagraphicCommand): AssetAnagraphic` — firma del metodo delegato al recupero dedi anagrafica dell'asset ricercato.

==== GetAssetAnagraphicService

#figure(
  image("../uml/png/GetAssetAnagraphic/GetAssetAnagraphicService.png", width: 45%),
  caption: [GetAssetAnagraphicService]
) <fig-get-asset-detail-service>

*Descrizione*

_GetAssetAnagraphicService_ è il service applicativo appartenente all'Application Core responsabile del recupero del dettaglio di un Asset. Implementa l'interfaccia _GetAssetAnagraphicUseCase_, recupera la sessione attiva tramite _GetEvaluationSession_ e ritorna l'_AssetAnagraphic_ tramite _Asset_.

*Attributi*

- `- get_evaluation_session_port: GetEvaluationSessionPort` — outbound port usata per prelevare la sessione di valutazione

*Metodi e funzioni*

- `+ get_asset_anagraphic(command: GetAssetAnagraphicCommand): AssetAnagraphic` — concretizza il contratto definito da _GetAssetAnagraphicUseCase_. Recupera la sessione attiva, individua l'Asset richiesto e ne estrae l'_AssetAnagraphic_.



==== AssetAnagraphic

#figure(
  image("../uml/png/GetAssetAnagraphic/AssetAnagraphic.png", width: 40%),
  caption: [AssetAnagraphic]
) <fig-asset-anagraphic>

*Descrizione*

_AssetAnagraphic_ è un oggetto di dominio che contiene le informazioni anagrafiche dell'asset.

*Attributi*

- `+ name: String` — nome dell'Asset.
- `+ asset_type: AssetType` — tipo dell'Asset.
- `+ description: String` — descrizione testuale dell'Asset.

*Metodi e funzioni*

_AssetAnagraphic_ non definisce metodi.

=== GetAssetEvaluationDetail
#figure(
  image("../uml/png/GetAssetEvaluationDetail/GetAssetEvaluationDetail.png", width: 100%),
  caption: [GetAssetEvaluationDetail],
) <fig-get-device-evaluation-detail>

Il diagramma illustra l'architettura del modulo dedicato al recupero di un _AssetEvaluationDetail_ contenente informazioni anagrafiche e stato di valutazione del dispositivo.
- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la sezione @InMemoryEvaluationSessionCache.
- Per la definizione di _GetEvaluationSessionPort_, vedere la sezione @GetEvaluationSessionPort. \

==== FlaskAssetEvaluationDetailController


==== GetAssetEvaluationDetailCommand

#figure(
  image("../uml/png/GetAssetEvaluationDetail/GetAssetEvaluationDetailCommand.png", width: 40%),
  caption: [GetAssetEvaluationDetailCommand],
) <fig-get-device-evaluation-detail-command>

*Descrizione*

_GetAssetEvaluationDetailCommand_ è il Command Object utilizzato per trasportare i dati necessari al recupero di un _AssetEvaluationDetail_. Incapsula i parametri di input del metodo esposto da _GetAssetEvaluationDetailUseCase_.

*Attributi*

- `+ session_id: String` — identificativo univoco della sessione
- `+ device_id: String` — identificativo univoco del Dispositivo di cui recuperare le informazioni.

*Metodi e funzioni*

_GetAssetEvaluationDetailCommand_ non definisce metodi propri.

==== GetAssetEvaluationDetailUseCase

#figure(
  image("../uml/png/GetAssetEvaluationDetail/GetAssetEvaluationDetailUseCase.png", width: 40%),
  caption: [GetAssetEvaluationDetailUseCase],
) <fig-get-device-evaluation-detail-use-case>

*Descrizione*

_GetAssetEvaluationDetailUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per il recupero di un _AssetEvaluationDetail_. Viene implementata da _GetAssetEvaluationDetailService_ e utilizzata da _FlaskAssetEvaluationDetailController_.

*Attributi*

_GetAssetEvaluationDetailUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ get_asset(command: GetAssetEvaluationDetailCommand): AssetEvaluationDetail` — firma del metodo delegato al recupero e all'aggregazione delle informazioni della sessione di valutazione.

==== GetAssetEvaluationDetailService

#figure(
  image("../uml/png/GetAssetEvaluationDetail/GetAssetEvaluationDetailService.png", width: 50%),
  caption: [GetAssetEvaluationDetailService],
) <fig-get-device-evaluation-detail-service>

*Descrizione*

Concretizza il contratto definito da _GetAssetEvaluationDetailUseCase_. Recupera la sessione di valutazione specificata, esegue la valutazione del dispositivo tramite l'engine e isola i risultati dell'Asset richiesto. Infine, aggrega i dati anagrafici di tale Asset con i risultati della valutazione dei suoi requisiti, restituendo la rappresentazione _AssetEvaluationDetail_

*Attributi*

_GetAssetEvaluationDetailService_ non definisce attributi propri.

*Metodi e funzioni*

- `+ get_asset(command: GetAssetEvaluationDetailCommand): AssetEvaluationDetail` —
concretizza il contratto definito da _GetAssetEvaluationDetailUseCase_. Recupera la sessione attiva, aggrega le informazioni del Dispositivo e dei suoi Asset e restituisce la rappresentazione _AssetEvaluationDetail_.

==== AssetEvaluationDetail
#figure(
  image("../uml/png/GetAssetEvaluationDetail/AssetEvaluationDetail.png", width: 45%),
  caption: [AssetEvaluationDetail],
)

*Descrizione*

_AssetEvaluationDetail_ è l'oggetto di dominio che contiene le informazioni anagrafiche dell'asset ed il suo stato di valutazione attuale.

*Attributi*

- `asset_id: String` è l'identificativo univoco dell'asset
- `name: String` è il nome dell'asset
- `asset_type: AssetType` è il tipo dell'asset
- `description: String` è la descrizione dell'asset
- `requirement_details: List<RequirementEvaluationDetail>` è la lista di requisiti che appartengono all'asset
- `verdict: EvaluationState` è lo stato della valutazione dell'asset


*Metodi e funzioni*

_AssetEvaluationDetail_ non definisce metodi.




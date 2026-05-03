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



#figure(
  image("../uml/png/CreateAsset/WriteAssetModule.png", width: 100%),
  caption: [Modulo di scrittura Asset]
) <fig-write-asset-module>

Il diagramma illustra l'architettura del modulo di scrittura per la gestione degli Asset, coprendo le operazioni di creazione, modifica ed eliminazione secondo i principi dell'architettura esagonale.\ Nei paragrafi seguenti vengono descritti in dettaglio i componenti di ciascun caso d'uso.

=== CreateAsset

#figure(
  image("../uml/png/CreateAsset/CreateAsset.png", width: 100%),
  caption: [Caso d'uso CreateAsset]
) <fig-create-asset>

Il diagramma illustra l'architettura del modulo di creazione di un Asset all'interno di una sessione di valutazione attiva. 

#block(breakable: false)[
==== WriteAssetController <WriteAssetController>

#figure(
  image("../uml/png/CreateAsset/WriteAssetController.png", width: 45%),
  caption: [WriteAssetController]
) <fig-write-asset-controller>

*Descrizione*

_WriteAssetController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP relative alla gestione (scrittura) degli Asset e le inoltra al livello applicativo.

*Attributi*

_WriteAssetController_ non definisce attributi propri.

*Metodi e funzioni*

- `+ create_asset(req: Request): Response` — riceve la richiesta HTTP di creazione di un nuovo Asset, estrae i dati dal corpo della richiesta e li inoltra al livello applicativo; restituisce una risposta HTTP con l'esito dell'operazione.
- `+ update_asset(req: Request): Response` — riceve la richiesta HTTP di aggiornamento di un Asset esistente, estrae i dati modificati e li inoltra al livello applicativo; restituisce una risposta HTTP con l'esito dell'operazione.
- `+ delete_asset(req: Request): Response` — riceve la richiesta HTTP di eliminazione di un Asset, estrae l'identificativo dalla richiesta e lo inoltra al livello applicativo; restituisce una risposta HTTP con l'esito dell'operazione.
]

#block(breakable: false)[
==== CreateAssetUseCase
#figure(
  image("../uml/png/CreateAsset/CreateAssetUseCase.png", width: 45%),
  caption: [CreateAssetUseCase]
) <fig-create-asset-use-case>
*Descrizione*

_CreateAssetUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per la creazione di un nuovo Asset all'interno della sessione di valutazione. Viene implementata da _CreateAssetService_ e utilizzata da _WriteAssetController_.

*Attributi*

_CreateAssetUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ create_asset(asset: CreateAssetCommand): bool` — firma del metodo delegato all'esecuzione della logica di creazione a partire dai dati contenuti nel comando.
]


==== CreateAssetCommand

#figure(
  image("../uml/png/CreateAsset/CreateAssetCommand.png", width: 35%),
  caption: [CreateAssetCommand]
) <fig-create-asset-command>

*Descrizione*

_CreateAssetCommand_ è il Command Object che veicola i dati necessari alla creazione di un Asset dal controller al service. Separa la struttura dei dati in ingresso dall'entità di dominio, rendendo esplicita l'intenzione dell'operazione.

*Attributi*

- `+ name: String` — nome del nuovo Asset.
- `+ type: AssetType` — tipo dell'Asset.
- `+ description: String` — descrizione testuale dell'Asset.
- `+ session_id: String` — identificativo della sessione di valutazione attiva a cui l'Asset viene associato.

*Metodi e funzioni*

_CreateAssetCommand_ non definisce metodi.


==== CreateAssetService


#figure(
  image("../uml/png/CreateAsset/CreateAssetService.png", width: 40%),
  caption: [CreateAssetService]
) <fig-create-asset-service>

*Descrizione*

_CreateAssetService_ è il service applicativo appartenente all'Application Core responsabile della logica di creazione di un Asset. Implementa l'interfaccia _CreateAssetUseCase_, recupera la sessione attiva tramite _GetSessionPort_, aggiunge il nuovo _Asset_ e persiste la sessione aggiornata tramite _SaveSessionPort_.

*Attributi*

_CreateAssetService_ non definisce attributi propri.

*Metodi e funzioni*

- `+ create_asset(asset: CreateAssetCommand): bool` — concretizza il contratto definito da _CreateAssetUseCase_. Recupera la sessione attiva, vi aggiunge il nuovo Asset e ne persiste lo stato aggiornato.



==== Asset <Asset>

#figure(
  image("../uml/png/CreateAsset/Asset.png", width: 25%),
  caption: [Asset]
) <fig-asset-domain>

*Descrizione*

_Asset_ è l'entità di dominio che rappresenta un asset oggetto di valutazione di conformità all'interno di una sessione. È associata a _ComplianceStandard_ e ad _Answer_ con cardinalità `1..*`.

*Attributi*

- `- id: String` — identificativo univoco dell'Asset.
- `- name: String` — nome dell'Asset.
- `- type: AssetType` — tipo dell'Asset.
- `- description: String` — descrizione testuale dell'Asset.

*Metodi e funzioni*

_Asset_ non definisce metodi.



==== EvaluationSession <EvaluationSession>

#figure(
  image("../uml/png/CreateAsset/EvaluationSession.png", width: 35%),
  caption: [EvaluationSession]
) <fig-evaluation-session-domain>

*Descrizione*

_EvaluationSession_ è l'entità di dominio che aggrega gli Asset oggetto di valutazione e mantiene il riferimento alla sessione di valutazione corrente. È associata a _Device_ e _ComplianceStandard_.

*Attributi*

- `- session_id: String` — identificativo univoco della sessione di valutazione.

*Metodi e funzioni*

_EvaluationSession_ non espone metodi pubblici nel diagramma.



==== InMemoryEvaluationSessionCache <InMemoryEvaluationSessionCache>

#figure(
  image("../uml/png/CreateAsset/InMemoryEvaluationSessionCache.png", width: 45%),
  caption: [InMemoryEvaluationSessionCache]
) <fig-in-memory-evaluation-session-cache>

*Descrizione*

_InMemoryEvaluationSessionCache_ è la classe dell'Outbound Adapter annotata come _Session Cache_ che implementa entrambe le porte outbound _SaveSessionPort_ e _GetSessionPort_. Gestisce la persistenza in memoria delle sessioni di valutazione tramite un dizionario indicizzato per `session_id`.

*Attributi*

- `- sessions: dictionary[string: EvaluationSession]` — struttura dati in memoria che mantiene le sessioni di valutazione attive, indicizzate per `session_id`.

*Metodi e funzioni*

- `+ create_session(): EvaluationSession` — crea e registra una nuova sessione di valutazione.
- `+ delete_session(session_id: String): void` — rimuove la sessione identificata da `session_id`.
- `+ get_session(session_id: String): EvaluationSession` — recupera la sessione corrispondente all'identificativo fornito.
- `+ save_session(session: EvaluationSession): void` — aggiorna la sessione nel dizionario in memoria.
- `+ has_active_session(device_id: String): bool` — verifica se esiste una sessione attiva per il Dispositivo identificato da `device_id`.


#block(breakable: false)[
==== SaveSessionPort <SaveSessionPort>
#figure(
  image("../uml/png/CreateAsset/SaveSessionPort.png", width: 45%),
  caption: [SaveSessionPort]
) <fig-save-session-port>
*Descrizione*

_SaveSessionPort_ è l'interfaccia (Outbound Port) che definisce il contratto per il salvataggio della sessione di valutazione nel sistema di persistenza in memoria. Viene implementata da _InMemoryEvaluationSessionCache_ e utilizzata da tutti i service del modulo che modificano lo stato della sessione, tra cui _CreateAssetService_, _SaveAssetService_ e _DeleteAssetService_.

*Attributi*

_SaveSessionPort_ non definisce attributi.

*Metodi e funzioni*

- `+ save_session(session: EvaluationSession): void` — firma del metodo che persiste la sessione aggiornata nel sistema in memoria.
]

#block(breakable: false)[
==== GetSessionPort <GetSessionPort>
#figure(
  image("../uml/png/CreateAsset/GetSessionPort.png", width: 45%),
  caption: [GetSessionPort]
) <fig-get-session-port>
*Descrizione*

_GetSessionPort_ è l'interfaccia (Outbound Port) che definisce il contratto per il recupero della sessione di valutazione dal sistema di persistenza in memoria. Viene implementata da _InMemoryEvaluationSessionCache_ e utilizzata da tutti i service del modulo che necessitano di accedere alla sessione corrente, tra cui _CreateAssetService_, _SaveAssetService_, _DeleteAssetService_ e _GetAssetDetailService_.

*Attributi*

_GetSessionPort_ non definisce attributi.

*Metodi e funzioni*

- `+ get_session(session_id: String): EvaluationSession` — firma del metodo che recupera la sessione di valutazione attiva corrispondente all'identificativo fornito.
]

=== SaveAsset

#block(breakable: false)[
#figure(
  image("../uml/png/SaveAsset/SaveAsset.png", width: 100%),
  caption: [Caso d'uso SaveAsset]
) <fig-save-asset>

Il diagramma illustra l'architettura del modulo di modifica di un Asset esistente all'interno di una sessione di valutazione attiva.

- Per la definizione di _WriteAssetController_, vedere la sezione @WriteAssetController. \
- Per la definizione di _Asset_, vedere la sezione @Asset. \
- Per la definizione di _EvaluationSession_, vedere la sezione @EvaluationSession. \
- Per la definizione di _SaveSessionPort_, vedere la sezione @SaveSessionPort. \
- Per la definizione di _GetSessionPort_, vedere la sezione @GetSessionPort. \
- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la sezione @InMemoryEvaluationSessionCache.

Di seguito vengono documentati esclusivamente i componenti introdotti specificamente per questo caso d'uso.
]

#block(breakable: false)[
==== SaveAssetUseCase
#figure(
  image("../uml/png/SaveAsset/SaveAssetUseCase.png", width: 40%),
  caption: [SaveAssetUseCase]
) <fig-save-asset-use-case>
*Descrizione*

_SaveAssetUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per la modifica di un Asset esistente all'interno della sessione di valutazione. Viene implementata da _SaveAssetService_ e utilizzata da _WriteAssetController_.

*Attributi*

_SaveAssetUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ save_asset(asset: SaveAssetCommand): bool` — firma del metodo delegato all'esecuzione della logica di aggiornamento a partire dai dati contenuti nel comando.
]


==== SaveAssetCommand
#figure(
  image("../uml/png/SaveAsset/SaveAssetCommand.png", width: 35%),
  caption: [SaveAssetCommand]
) <fig-save-asset-command>

*Descrizione*

_SaveAssetCommand_ è il Command Object che veicola i dati necessari alla modifica di un Asset dal controller al service. Separa la struttura dei dati in ingresso dall'entità di dominio.

*Attributi*

- `+ asset_id: String` — identificativo univoco dell'Asset da modificare.
- `+ name: String` — nome aggiornato dell'Asset.
- `+ type: AssetType` — tipo aggiornato dell'Asset.
- `+ description: String` — descrizione testuale aggiornata dell'Asset.
- `+ session_id: String` — identificativo della sessione di valutazione attiva.

*Metodi e funzioni*

_SaveAssetCommand_ non definisce metodi.


#block(breakable: false)[
==== SaveAssetService

#figure(
  image("../uml/png/SaveAsset/SaveAssetService.png", width: 45%),
  caption: [ SaveAssetService]
) <fig-save-asset-service>

*Descrizione*

_SaveAssetService_ è il service applicativo appartenente all'Application Core responsabile della logica di aggiornamento di un Asset esistente. Implementa l'interfaccia _SaveAssetUseCase_, recupera la sessione attiva tramite _GetSessionPort_, aggiorna l'Asset corrispondente e persiste la sessione modificata tramite _SaveSessionPort_.

*Attributi*

_SaveAssetService_ non definisce attributi propri.

*Metodi e funzioni*

- `+ save_asset(asset: SaveAssetCommand): bool` — concretizza il contratto definito da _SaveAssetUseCase_. Recupera la sessione attiva, individua l'Asset da aggiornare tramite `asset_id` e ne persiste lo stato modificato.
]

=== DeleteAsset <DeleteAsset>

#block(breakable: false)[
#figure(
  image("../uml/png/DeleteAsset/DeleteAsset.png", width: 100%),
  caption: [Caso d'uso DeleteAsset]
) <fig-delete-asset>

Il diagramma illustra l'architettura del modulo di eliminazione di un Asset esistente all'interno di una sessione di valutazione attiva. 

Per la definizione di _WriteAssetController_, vedere la sezione @WriteAssetController. \
Per la definizione di _Asset_, vedere la sezione @Asset. \
Per la definizione di _EvaluationSession_, vedere la sezione @EvaluationSession. \
Per la definizione di _SaveSessionPort_, vedere la sezione @SaveSessionPort. \
Per la definizione di _GetSessionPort_, vedere la sezione @GetSessionPort. \
Per la definizione di _InMemoryEvaluationSessionCache_, vedere la sezione @InMemoryEvaluationSessionCache.

Di seguito vengono documentati esclusivamente i componenti introdotti specificamente per questo caso d'uso.
]

#block(breakable: false)[
==== DeleteAssetUseCase
#figure(
  image("../uml/png/DeleteAsset/DeleteAssetUseCase.png", width: 45%),
  caption: [DeleteAssetUseCase]
) <fig-delete-asset-use-case>
*Descrizione*

_DeleteAssetUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per l'eliminazione di un Asset dalla sessione di valutazione. Viene implementata da _DeleteAssetService_ e utilizzata da _WriteAssetController_.

*Attributi*

_DeleteAssetUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ delete_asset(device_id: String, session_id: String): void` — firma del metodo delegato all'esecuzione della logica di eliminazione a partire dall'identificativo dell'Asset e della sessione.
]

#block(breakable: false)[
==== DeleteAssetService

#figure(
  image("../uml/png/DeleteAsset/DeleteAssetService.png", width: 45%),
  caption: [DeleteAssetService]
) <fig-delete-asset-service>

*Descrizione*

_DeleteAssetService_ è il service applicativo appartenente all'Application Core responsabile della logica di eliminazione di un Asset. Implementa l'interfaccia _DeleteAssetUseCase_ e, a differenza dei service di creazione e modifica, non richiede un Command Object: riceve direttamente gli identificativi necessari, recupera la sessione tramite _GetSessionPort_, rimuove l'Asset corrispondente e persiste la sessione aggiornata tramite _SaveSessionPort_.

*Attributi*

_DeleteAssetService_ non definisce attributi propri.

*Metodi e funzioni*

- `+ delete_asset(device_id: String, session_id: String): void` — concretizza il contratto definito da _DeleteAssetUseCase_. Recupera la sessione attiva, individua e rimuove l'Asset corrispondente e ne persiste lo stato aggiornato.
]

=== GetAssetDetail <GetAssetDetail>

#block(breakable: false)[
#figure(
  image("../uml/png/GetAssetDetail/GetAssetDetail.png", width: 100%),
  caption: [Diagramma delle classi — Caso d'uso GetAssetDetail]
) <fig-get-asset-detail>

Il diagramma illustra l'architettura del modulo dedicato al recupero del dettaglio di un Asset all'interno di una sessione di valutazione attiva. 

Per la definizione di _EvaluationSession_, vedere la sezione @EvaluationSession. \
Per la definizione di _GetSessionPort_, vedere la sezione @GetSessionPort. \
Per la definizione di _InMemoryEvaluationSessionCache_, vedere la sezione @InMemoryEvaluationSessionCache.

Di seguito vengono documentati esclusivamente i componenti introdotti specificamente per questo caso d'uso.
]

#block(breakable: false)[
==== QueryDashboardController
#figure(
  image("../uml/png/GetAssetDetail/QueryDashboardController.png", width: 45%),
  caption: [QueryDashboardController]
) <fig-query-dashboard-controller>
*Descrizione*

_QueryDashboardController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP di lettura relative alla dashboard e agli Asset. Delega la logica applicativa al livello sottostante tramite le rispettive interfacce.

*Attributi*

_QueryDashboardController_ non definisce attributi propri.

*Metodi e funzioni*

- `+ get_device_dashboard(req: Request): Response` — riceve la richiesta HTTP di recupero della dashboard del Dispositivo e restituisce una risposta HTTP con i dati aggregati.
- `+ get_asset_detail(req: Request): Response` — riceve la richiesta HTTP di recupero del dettaglio di un Asset specifico e restituisce una risposta HTTP con i dati completi.
]

#block(breakable: false)[
==== GetAssetDetailUseCase
 <GetAssetDetailUseCase>

#figure(
  image("../uml/png/GetAssetDetail/GetAssetDetailUseCase.png", width: 55%),
  caption: [GetAssetDetailUseCase]
) <fig-get-asset-detail-use-case>

*Descrizione*

_GetAssetDetailUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per il recupero delle informazioni dettagliate relative a un singolo Asset. Viene utilizzata per visualizzare i parametri specifici di una risorsa (come sensori o attuatori) all'interno delle dashboard di monitoraggio.

*Attributi*

_GetAssetDetailUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ get_detail(device_id: String, asset_id: String): AssetDetail` — firma del metodo che, dati gli identificativi del Dispositivo e dell'Asset, restituisce un oggetto _AssetDetail_ contenente tutte le informazioni informative e lo stato corrente della risorsa.

*Descrizione*

_GetAssetDetailUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per il recupero del dettaglio di un Asset. Viene implementata da _GetAssetDetailService_ e utilizzata da _QueryDashboardController_.

*Attributi*

_GetAssetDetailUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ get_asset(session_id: String, asset_id: String): AssetDetail` — firma del metodo delegato al recupero del dettaglio dell'Asset corrispondente agli identificativi forniti.
]

==== GetAssetDetailService

#figure(
  image("../uml/png/GetAssetDetail/GetAssetDetailService.png", width: 45%),
  caption: [GetAssetDetailService]
) <fig-get-asset-detail-service>

*Descrizione*

_GetAssetDetailService_ è il service applicativo appartenente all'Application Core responsabile del recupero del dettaglio di un Asset. Implementa l'interfaccia _GetAssetDetailUseCase_, recupera la sessione attiva tramite _GetSessionPort_ e costruisce il  _AssetDetail_ aggregando le informazioni dell'Asset con il suo stato di valutazione.

*Attributi*

_GetAssetDetailService_ non definisce attributi propri.

*Metodi e funzioni*

- `+ get_asset(session_id: String, asset_id: String): AssetDetail` — concretizza il contratto definito da _GetAssetDetailUseCase_. Recupera la sessione attiva, individua l'Asset richiesto e ne costruisce la rappresentazione _AssetDetail_.



==== AssetDetail

#figure(
  image("../uml/png/GetAssetDetail/AssetDetail.png", width: 40%),
  caption: [AssetDetail]
) <fig-asset-detail>

*Descrizione*

_AssetDetail_ è il Data Transfer Object che veicola la rappresentazione completa di un Asset verso il livello di presentazione. Aggrega le informazioni dell'Asset con il suo stato di valutazione e la lista dei requisiti valutati, evitando di esporre direttamente l'entità di dominio.

*Attributi*

- `+ asset_id: String` — identificativo univoco dell'Asset.
- `+ name: String` — nome dell'Asset.
- `+ type: AssetType` — tipo dell'Asset.
- `+ description: String` — descrizione testuale dell'Asset.
- `+ aggregate_status: EvaluationState` — stato di valutazione aggregato dell'Asset.
- `+ requirement_list: List<RequirementEval>` — lista dei requisiti valutati associati all'Asset.

*Metodi e funzioni*

_AssetDetail_ non definisce metodi.


#block(breakable: false)[
==== RequirementEval
#figure(
  image("../uml/png/GetAssetDetail/RequirementEval.png", width: 35%),
  caption: [RequirementEval]
) <fig-requirement-eval-domain>

*Descrizione*

_RequirementEval_ è il Data Transfer Object che rappresenta la valutazione di un singolo requisito di conformità associato all'Asset. È contenuto nella lista `requirement_list` di _AssetDetail_.

*Attributi*

- `+ codice_requisito: String` — codice identificativo del requisito di conformità.
- `+ stato_valutazione: EvaluationState` — stato di valutazione del requisito.

*Metodi e funzioni*

_RequirementEval_ non definisce metodi.
]


==== EvaluationSheet

#figure(
  image("../uml/png/GetAssetDetail/EvaluationSheet.png", width: 45%),
  caption: [EvaluationSheet]
) <fig-evaluation-sheet-domain>

*Descrizione*

_EvaluationSheet_ è l'entità di dominio che coordina la valutazione di conformità di un Asset rispetto a uno standard. Espone i metodi necessari per valutare i requisiti e aggregare lo stato complessivo della valutazione.

*Attributi*

_EvaluationSheet_ non definisce attributi propri nel diagramma.

*Metodi e funzioni*

- `+ __init__(device: Device, standard: ComplianceStandard): EvaluationSheet` — inizializza il foglio di valutazione per il Dispositivo e lo standard forniti.
- `+ evaluate_requirements(asset_id: String, requirements_id: List<String>): EvaluationState` — valuta i requisiti specificati per l'Asset indicato e restituisce lo stato risultante.
- `+ evaluate_asset(asset: Asset): EvaluationState` — valuta lo stato complessivo dell'Asset fornito.
- `+ evaluate_device(): EvaluationState` — valuta lo stato complessivo del Dispositivo associato alla sessione.

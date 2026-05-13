
== Device <classe_disp>


/*
// #image("../uml/png/classe_dispositivo.png")

Il diagramma delle classi illustra la progettazione architetturale per il modulo di Gestione dei Dispositivi.

+ #[*Inbound Adapter*

  Il pacchetto Inbound Adapter rappresenta il punto di contatto con l'utente. Contiene il DispositivoController, sviluppato con il framework Flask. Il suo unico compito è ricevere le richieste HTTP, tradurle in un formato comprensibile al sistema e restituire una risposta web. Questo livello non prende nessuna decisione logica.
]
+ #[ *Application Core e Ports*

  Al centro del diagramma si trova la logica vera e propria del software. Per proteggere questa parte centrale, essa comunica con l'esterno unicamente tramite delle Porte rappresentate da interfacce:

    `InterfaceDispositivoUseCase` (Inbound Port): È l'elenco dei servizi offerti all'utente. Il Controller "utilizza" questa porta per inviare i comandi, senza aver bisogno di sapere come verranno eseguiti.

    `DispositivoService` (Service): È la classe che svolge il lavoro reale. Riceve i comandi dalla porta Inbound, crea le entità (`Dispositivo`) e verifica che i dati rispettino le regole del progetto tramite un metodo privato dedicato (`validaRegoleBusiness`).

    `InterfaceDispositivoRepository` (Outbound Port): Quando il Service ha finito i controlli e deve salvare i dati, non contatta direttamente il database. Usa invece questa porta di uscita, che dichiara solo il bisogno di salvare o leggere un dato, senza specificare la tecnologia.
]
#[ *Outbound Adapter*

  Il pacchetto Outbound Adapter contiene il `MongoDispositivoAdapter`. Questa classe implementa il contratto richiesto dalla porta in uscita e traduce gli oggetti del programma in documenti fisici salvati su MongoDB.

]
*/

#block(breakable: false)[
  === WriteDeviceModule
  #figure(
    image("../uml/png/CreateDevice/WriteDeviceModule.png", width: 100%),
    caption: [ Modulo di scrittura Dispositivi],
  ) <fig-write-device-module>

  Il diagramma offre una visione d'insieme del modulo di scrittura per la gestione dei Dispositivi, mostrando come i tre casi d'uso — _CreateDevice_, _SaveDevice_ e _DeleteDevice_ — condividano gli stessi componenti infrastrutturali (_FlaskWriteDeviceController_ e _MongoDeviceAdapter_) pur introducendo ciascuno le proprie interfacce e service dedicati. I componenti sono descritti in dettaglio nelle sezioni seguenti.
]
=== CreateDevice <CreateDevice>

#figure(
  image("../uml/png/CreateDevice/CreateDevice.png", width: 100%),
  caption: [ Caso d'uso CreateDevice],
) <fig-create-device>

Il diagramma illustra l'architettura del modulo di scrittura per la gestione dei Dispositivi, coprendo le operazioni di creazione, modifica ed eliminazione secondo i principi dell'architettura esagonale.

==== FlaskWriteDeviceController <FlaskWriteDeviceController>

#figure(
  image("../uml/png/CreateDevice/FlaskWriteDeviceController.png", width: 45%),
  caption: [FlaskWriteDeviceController],
) <fig-write-device-controller>

*Descrizione*

_FlaskWriteDeviceController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP relative alla gestione dei Dispositivi e le inoltra al livello applicativo.

*Attributi*

- `- create_device_use_case: CreateDeviceUseCase` — inbound port usata per la creazione di un device
- `- update_device_use_case: UpdateDeviceUseCase` — inbound port usata per la modifica di un device
- `- delete_device_use_case: DeleteDeviceUseCase` — inbound port usata per l'eliminazione di un device

*Metodi e funzioni*

- `+ create_device(req: Request): Response` — riceve la richiesta HTTP di creazione di un nuovo Dispositivo, estrae i dati dal corpo della richiesta e li inoltra al livello applicativo; restituisce una risposta HTTP con l'esito dell'operazione.
- `+ update_device(req: Request): Response` — riceve la richiesta HTTP di modifica di un Dispositivo esistente, estrae i dati aggiornati e li inoltra al livello applicativo; restituisce una risposta HTTP con l'esito dell'operazione.
- `+ delete_device(req: Request): Response` — riceve la richiesta HTTP di eliminazione di un Dispositivo, estrae l'identificativo dalla richiesta e lo inoltra al livello applicativo; restituisce una risposta HTTP con l'esito dell'operazione.

==== CreateDeviceUseCase

#figure(
  image("../uml/png/CreateDevice/CreateDeviceUseCase.png", width: 35%),
  caption: [ CreateDeviceUseCase],
) <fig-create-device-use-case>

*Descrizione*

_CreateDeviceUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per la creazione di un nuovo Dispositivo. Viene implementata da _CreateDeviceService_ e utilizzata da _FlaskWriteDeviceController_.

*Attributi*

_CreateDeviceUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ create(command: CreateDeviceCommand): void` — firma del metodo delegato all'esecuzione della logica di creazione a partire dai dati contenuti nel comando.

==== CreateDeviceCommand

#figure(
  image("../uml/png/CreateDevice/CreateDeviceCommand.png", width: 35%),
  caption: [CreateDeviceCommand],
) <fig-create-device-command>

*Descrizione*

_CreateDeviceCommand_ è il Command Object che veicola i dati necessari alla creazione di un Dispositivo dal controller al service. L'uso di questo pattern separa la struttura dei dati in ingresso dall'entità di dominio, rendendo esplicita l'intenzione dell'operazione.

*Attributi*

- `+ device_name: String` — nome del nuovo Dispositivo.
- `+ device_os: String` — sistema operativo del Dispositivo.
- `+ device_description: String` — descrizione testuale del Dispositivo.
- `+ standard_id: String` — identificativo dello standard di conformità associato.

*Metodi e funzioni*

_CreateDeviceCommand_ non definisce metodi.

==== CreateDeviceService

#figure(
  image("../uml/png/CreateDevice/CreateDeviceService.png", width: 45%),
  caption: [CreateDeviceService],
) <fig-create-device-service>

*Descrizione*

_CreateDeviceService_ è il service applicativo appartenente all'Application Core responsabile della logica di creazione di un Dispositivo. Implementa l'interfaccia _CreateDeviceUseCase_, riceve il comando in ingresso, costruisce l'entità di dominio e ne coordina la persistenza tramite _RegisterDevicePort_.

*Attributi*

- `- register_device_port: RegisterDevicePort` — porta outbound utilizzata per la persistenza del nuovo Dispositivo.

*Metodi e funzioni*

- `+ create(command: CreateDeviceCommand): void` — concretizza il contratto definito da _CreateDeviceUseCase_. Mappa i dati del comando nell'entità _Device_ e ne richiede la registrazione tramite _RegisterDevicePort_.

==== Device <Device>

#figure(
  image("../uml/png/CreateDevice/Device.png", width: 35%),
  caption: [Device],
) <fig-device>

*Descrizione*

_Device_ è l'entità centrale del dominio che rappresenta il Dispositivo oggetto della valutazione di conformità. È associata alla classe _Asset_ con una relazione di composizione avente cardinalità `0..*`.

*Attributi*

- `- id: String` — identificativo univoco del Dispositivo.
- `- standard_id: String` — identificativo dello standard di conformità associato al dispositivo.
- `- name: String` — nome del Dispositivo.
- `- os: String` — sistema operativo del Dispositivo.
- `- description: String` — descrizione testuale del Dispositivo.
- `- assets: Map<String, Asset>` — mappa degli asset associati al Dispositivo, indicizzati per il loro identificativo.

*Metodi e funzioni*

- `+ create(device_id: String, standard_id: String, name: String, os: String, description: String, assets: List<Asset>): Device` — metodo per la creazione e istanziazione di un nuovo oggetto Dispositivo.
- `+ get_asset(asset_id: String): Asset` — recupera l'Asset corrispondente all'identificativo fornito.
- `+ update_info(name: String, os: String, description: String): void` — aggiorna le informazioni anagrafiche del Dispositivo (nome, sistema operativo e descrizione).
- `+ add_asset(asset: Asset): void` — aggiunge un nuovo _Asset_ alla mappa del Dispositivo.
- `+ remove_asset(asset_id: String): void` — rimuove l'_Asset_ identificato da `asset_id` dalla mappa del Dispositivo.
- `+ update_asset(asset: Asset): void` — aggiorna un _Asset_ esistente

==== RegisterDevicePort <RegisterDevicePort>

#figure(
  image("../uml/png/CreateDevice/RegisterDevicePort.png", width: 35%),
  caption: [RegisterDevicePort],
) <fig-register-device-port>

*Descrizione*

_RegisterDevicePort_ è l'interfaccia (Outbound Port) che definisce il contratto per la registrazione di un nuovo Dispositivo nel sistema di persistenza. Viene implementata da _MongoDeviceAdapter_ e utilizzata da _CreateDeviceService_.

*Attributi*

_RegisterDevicePort_ non definisce attributi.

*Metodi e funzioni*

- `+ register(device: Device): void` — firma del metodo che esegue l'inserimento fisico del Dispositivo nel sistema di persistenza.

==== MongoDeviceAdapter <MongoDeviceAdapter>

#figure(
  image("../uml/png/CreateDevice/MongoDeviceAdapter.png", width: 45%),
  caption: [MongoDeviceAdapter],
) <fig-mongo-device-adapter>

*Descrizione*

_MongoDeviceAdapter_ è la classe dell'Outbound Adapter che implementa le porte outbound del sistema, traducendo le operazioni del dominio in interazioni concrete con MongoDB tramite `pymongo.Collection`.

*Attributi*

- `- collection: pymongo.Collection` — riferimento alla collezione MongoDB su cui vengono eseguite le operazioni di persistenza.

*Metodi e funzioni*

- `+ save(device: Device): void` — salva le modifiche a un Dispositivo esistente nella collezione.
- `+ register(device: Device): void` — inserisce un nuovo Dispositivo nella collezione.
- `+ delete(device_id: String): void` — rimuove il Dispositivo identificato da `device_id` dalla collezione.
- `+ find_by_id(device_id: String): Device` — recupera il Dispositivo corrispondente all'identificativo fornito.
- `+ find_all(): List<DeviceSummary>` — recupera la lista sintetica di tutti i Dispositivi presenti nella collezione.

=== DeleteDevice

#figure(
  image("../uml/png/DeleteDevice/DeleteDevice.png", width: 90%),
  caption: [Caso d'uso DeleteDevice],
) <fig-delete-device>

Il diagramma illustra l'architettura del modulo dedicato all'eliminazione di un Dispositivo.

- Per la definizione di _FlaskWriteDeviceController_, vedere la sezione @FlaskWriteDeviceController. \
- Per la definizione di _Device_, vedere la sezione @Device. \
- Per la definizione di _MongoDeviceAdapter_, vedere la sezione @MongoDeviceAdapter.

Di seguito vengono documentati esclusivamente i componenti introdotti specificamente per questo caso d'uso.
==== DeleteDeviceUseCase
#figure(
  image("../uml/png/DeleteDevice/DeleteDeviceUseCase.png", width: 40%),
  caption: [DeleteDeviceUseCase],
) <fig-delete-device-use-case>
*Descrizione*

_DeleteDeviceUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per l'eliminazione di un Dispositivo. Viene implementata da _DeleteDeviceService_ e utilizzata da _FlaskWriteDeviceController_.

*Attributi*

_DeleteDeviceUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ delete(device_id: String): void` — firma del metodo delegato all'esecuzione della logica di eliminazione a partire dall'identificativo del Dispositivo.

==== DeleteDeviceCommand

#figure(
  image("../uml/png/DeleteDevice/DeleteDeviceCommand.png", width: 35%),
  caption: [DeleteDeviceCommand],
) <fig-delete-device-command>

*Descrizione*

_DeleteDeviceCommand_ è il Command Object utilizzato per trasportare i dati necessari all'eliminazione di un Dispositivo.

*Attributi*

- `+ device_id: String` — identificativo univoco del Dispositivo da eliminare.

*Metodi e funzioni*

_DeleteDeviceCommand_ non definisce metodi propri.

==== DeleteDeviceService

#figure(
  image("../uml/png/DeleteDevice/DeleteDeviceService.png", width: 45%),
  caption: [DeleteDeviceService],
) <fig-delete-device-service>

*Descrizione*

_DeleteDeviceService_ è il service applicativo appartenente all'Application Core responsabile della logica di eliminazione di un Dispositivo. Implementa l'interfaccia _DeleteDeviceUseCase_ e riceve un _DeleteDeviceCommand_ contenente l'identificativo del Dispositivo, coordinandone la rimozione dal sistema.

*Attributi*

- `- delete_device_port: DeleteDevicePort` — porta outbound utilizzata per eliminare il device

*Metodi e funzioni*

- `+ delete(command: DeleteDeviceCommand): void` — riceve il Command Object contenente l'identificativo univoco del Dispositivo e ne coordina la rimozione tramite _DeleteDevicePort_.
==== DeleteDevicePort

#figure(
  image("../uml/png/DeleteDevice/DeleteDevicePort.png", width: 40%),
  caption: [DeleteDevicePort],
) <fig-delete-device-port>
*Descrizione*

_DeleteDevicePort_ è l'interfaccia (Outbound Port) che definisce il contratto per la rimozione fisica di un Dispositivo dal sistema di persistenza. Viene implementata da _MongoDeviceAdapter_ e utilizzata da _DeleteDeviceService_.

*Attributi*

_DeleteDevicePort_ non definisce attributi.

*Metodi e funzioni*

- `+ delete(device_id: String): void` — firma del metodo che esegue la rimozione fisica del Dispositivo identificato da `device_id` dal sistema di persistenza.


// Update

=== UpdateDevice <UpdateDevice>


#figure(
  image("../uml/png/UpdateDevice/UpdateDevice.png", width: 100%),
  caption: [Caso d'uso UpdateDevice],
) <fig-udpate-device>

Il diagramma illustra l'architettura del modulo dedicato alla modifica e al salvataggio dello stato di un Dispositivo esistente.

- Per la definizione di _FlaskWriteDeviceController_, vedere la sezione @FlaskWriteDeviceController. \
- Per la definizione di _Device_, vedere la sezione @Device. \
- Per la definizione di _MongoDeviceAdapter_, vedere la sezione @MongoDeviceAdapter.

Di seguito vengono documentati esclusivamente i componenti introdotti specificamente per questo caso d'uso.

==== UpdateDeviceUseCase

#figure(
  image("../uml/png/UpdateDevice/UpdateDeviceUseCase.png", width: 40%),
  caption: [UpdateDeviceUseCase],
) <fig-update-device-use-case>
*Descrizione*

_UpdateDeviceUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per la modifica di un Dispositivo esistente. Viene implementata da _UpdateDeviceService_ e utilizzata da _FlaskWriteDeviceController_.

*Attributi*

_UpdateDeviceUseCase_ non definisce attributi.

*Metodi e funzioni*

- `update_device(command: UpdateDeviceCommand)` — firma del metodo delegato all'esecuzione della logica di aggiornamento a partire dai dati contenuti nel comando.

==== UpdateDeviceCommand

#figure(
  image("../uml/png/UpdateDevice/UpdateDeviceCommand.png", width: 35%),
  caption: [UpdateDeviceCommand],
) <fig-update-device-command>

*Descrizione*

_UpdateDeviceCommand_ è il Command Object che veicola i dati necessari alla modifica di un Dispositivo dal controller al service. Analogamente a _CreateDeviceCommand_, separa la struttura dei dati in ingresso dall'entità di dominio.

*Attributi*

- `+ device_id: String` — identificativo univoco del Dispositivo da aggiornare.
- `+ device_name: String` — nome aggiornato del Dispositivo.
- `+ device_os: String` — sistema operativo aggiornato.
- `+ device_description: String` — descrizione testuale aggiornata.

*Metodi e funzioni*

_UpdateDeviceCommand_ non definisce metodi.

==== UpdateDeviceService

#figure(
  image("../uml/png/UpdateDevice/UpdateDeviceService.png", width: 45%),
  caption: [UpdateDeviceService],
) <fig-udpate-device-service>

*Descrizione*

_UpdateDeviceService_ è il service applicativo appartenente all'Application Core responsabile della logica di aggiornamento di un Dispositivo esistente. Implementa l'interfaccia _UpdateDeviceUseCase_, riceve il comando in ingresso e ne coordina la persistenza tramite _SaveDevicePort_.

*Attributi*

- `- find_device_port: FindDevicePort` — utilizza la porta di outbound per prelevare il device
- `- save_device_port: SaveDevicePort` — utilizza la porta di outbound per salvare le modifiche

*Metodi e funzioni*

- `+ udpate_device(command: UpdateDeviceCommand): void` — concretizza il contratto definito da _SaveDeviceUseCase_. Mappa i dati del comando nell'entità _Device_ e ne richiede l'aggiornamento tramite _SaveDevicePort_.

==== SaveDevicePort <SaveDevicePort>

#figure(
  image("../uml/png/UpdateDevice/SaveDevicePort.png", width: 30%),
  caption: [SaveDevicePort],
) <fig-save-device-port>
*Descrizione*

_SaveDevicePort_ è l'interfaccia (Outbound Port) che definisce il contratto per l'aggiornamento fisico di un Dispositivo nel sistema di persistenza. Viene implementata da _MongoDeviceAdapter_ e utilizzata da _UpdateDeviceService_.

*Attributi*

_UpdateDevicePort_ non definisce attributi.

*Metodi e funzioni*

- `+ save(device: Device): void` — firma del metodo che esegue l'aggiornamento fisico del Dispositivo nel sistema di persistenza.

==== FindDevicePort <FindDevicePort>

#figure(
  image("../uml/png/UpdateDevice/FindDevicePort.png", width: 30%),
  caption: [FindDevicePort],
) <fig-find-device-port>
*Descrizione*

_FindDevicePort_ è l'interfaccia (Outbound Port) che definisce il contratto per prelevare un Device tramite id. Viene implementata da _MongoDeviceAdapter_ e utilizzata da _UpdateDeviceService_.

*Attributi*

_FindDevicePort_ non definisce attributi.

*Metodi e funzioni*

- `+ find_by_id(device_id: String): Device` — firma del metodo che esegue l'aggiornamento fisico del Dispositivo nel sistema di persistenza.


=== ReadDeviceModule <ReadDeviceModule>


#figure(
  image("../uml/png/GetDeviceDetail/QueryDeviceModule.png", width: 100%),
  caption: [Modulo di lettura Dispositivi],
) <fig-read-device-module>

Il diagramma illustra l'architettura del modulo di lettura per la gestione dei Dispositivi, coprendo le operazioni di recupero del dettaglio di un singolo Dispositivo e della lista sintetica di tutti i Dispositivi registrati.

- Per la definizione di _Device_, vedere la sezione @Device. \
- Per la definizione di _MongoDeviceAdapter_, vedere la sezione @MongoDeviceAdapter.
- Per la definizione di _FindDevicePort_, vedere la sezione @FindDevicePort.

Di seguito vengono documentati esclusivamente i componenti introdotti specificamente per questo modulo.

=== GetDeviceDetail

#figure(
  image("../uml/png/GetDeviceDetail/GetDeviceDetail.png", width: 100%),
  caption: [GetDeviceDetail],
) <fig-get-device-detail>

Il diagramma illustra l'architettura del modulo dedicato al recupero del dettaglio di un Dispositivo.
- Per la definizione di _Device_, vedere la sezione @Device. \
- Per la definizione di _MongoDeviceAdapter_, vedere la sezione @MongoDeviceAdapter.
- Per la definizione di _FindDevicePort_, vedere la sezione @FindDevicePort.
Di seguito vengono documentati esclusivamente i componenti introdotti specificamente per questo caso d'uso.


==== FlaskQueryDeviceController <FlaskQueryDeviceController>

#figure(
  image("../uml/png/GetDeviceDetail/FlaskQueryDeviceController.png", width: 45%),
  caption: [FlaskQueryDeviceController],
) <fig-query-device-controller>

*Descrizione*

_FlaskQueryDeviceController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP di lettura relative ai Dispositivi e le inoltra al livello applicativo.

*Attributi*

- `- get_device_list_use_case: GetDeviceListUseCase` — inbound port usata per prendere la lista dei dispostivi
- `- get_device_detail_use_case: GetDeviceDetailUseCase` — inbound port usata per prendere il dettaglio di un dispositivo
- `- get_compliance_standard_use_case: GetComplianceStandardUseCase` — inbound port usata per prendere lo Standard

*Metodi e funzioni*

- `+ get_device_list(req: Request): Response` — riceve la richiesta HTTP di recupero della lista dei Dispositivi e restituisce una risposta HTTP con l'elenco sintetico.
- `+ get_device_detail(req: Request): Response` — riceve la richiesta HTTP di recupero del dettaglio di un Dispositivo specifico e restituisce una risposta HTTP con i dati completi, per recuperare questi dati utilizza le porte _GetDeviceDetailUseCase_ per le informazioni del dispositivo e _GetComplianceStandardUseCase_ per recuperare lo standard associato.

==== GetDeviceDetailUseCase
#figure(
  image("../uml/png/GetDeviceDetail/GetDeviceDetailUseCase.png", width: 35%),
  caption: [GetDeviceDetailUseCase],
) <fig-get-device-detail-use-case>
*Descrizione*

_GetDeviceDetailUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per il recupero del dettaglio di un Dispositivo. Viene implementata da _GetDeviceDetailService_ e utilizzata da _FlaskQueryDeviceController_.

*Attributi*

_GetDeviceDetailUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ get_device(command: GetDeviceDetailCommand): Device` — firma del metodo delegato al recupero del Dispositivo corrispondente al Command fornito.

==== GetDeviceDetailService

#figure(
  image("../uml/png/GetDeviceDetail/GetDeviceDetailService.png", width: 45%),
  caption: [GetDeviceDetailService],
) <fig-get-device-detail-service>

*Descrizione*

_GetDeviceDetailService_ è il service applicativo appartenente all'Application Core responsabile del recupero del dettaglio di un Dispositivo. Implementa l'interfaccia _GetDeviceDetailUseCase_ e coordina il recupero dei dati tramite la porta outbound _FindDevicePort_.

*Attributi*

- `find_device_port: FindDevicePort` — outbound port usata per prelevare un dispositivo.

*Metodi e funzioni*

- `+ get_device(command: GetDeviceDetailCommand): Device` — concretizza il contratto definito da _GetDeviceDetailUseCase_. Recupera il Dispositivo corrispondente all'identificativo contenuto nel Command tramite _FindDevicePort_.

==== GetDeviceDetailCommand

#figure(
  image("../uml/png/GetDeviceDetail/GetDeviceDetailCommand.png", width: 35%),
  caption: [GetDeviceDetailCommand],
) <fig-get-device-detail-command>

*Descrizione*

_GetDeviceDetailCommand_ è  utilizzato per trasportare i dati necessari al recupero del dettaglio di un Dispositivo. Incapsula i parametri di input del metodo esposto da _GetDeviceDetailUseCase_.

*Attributi*

- `+ device_id: String` — identificativo univoco del Dispositivo di cui recuperare il dettaglio.

*Metodi e funzioni*

_GetDeviceDetailCommand_ non definisce metodi propri.

==== GetComplianceStandardUseCase
#figure(
  image("../uml/png/GetDeviceDetail/GetComplianceStandardUseCase.png", width: 35%),
  caption: [GetComplianceStandardUseCase]
) <fig-get-compliance-standard-use-case>
*Descrizione*

_GetComplianceStandardUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per il recupero dello standard. Viene implementata da _GetComplianceStandardService_ e utilizzata da _FlaskQueryDeviceController_.

*Attributi*

_GetComplianceStandardUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ get_compliance_standard(command: GetComplianceStandardCommand): ComplianceStandard` — firma del metodo delegato al recupero dello Standard corrispondente al Command fornito.

==== GetComplianceStandardService
#figure(
  image("../uml/png/GetDeviceDetail/GetComplianceStandardService.png", width: 45%),
  caption: [GetComplianceStandardService]
) <fig-get-compliance-standard-service>

*Descrizione*

_GetComplianceStandardService_ è il service applicativo appartenente all'Application Core responsabile del recupero di un Compliance Standard. Implementa l'interfaccia _GetComplianceStandardUseCase_ e coordina il recupero dei dati tramite la porta outbound _FindStandardPort_.

*Attributi*

- `find_standard_port: FindStandardPort` — outbound port usata per prelevare lo Standard.

*Metodi e funzioni*

- `+ get_compliance_standard(command: GetComplianceStandardCommand): ComplianceStandard` — concretizza il contratto definito da _GetComplianceStandardUseCase_. Recupera il Compliance Standard corrispondente all'identificativo contenuto nel Command tramite _FindStandardPort_.

==== GetComplianceStandardCommand
#figure(
  image("../uml/png/GetDeviceDetail/GetComplianceStandardCommand.png", width: 35%),
  caption: [GetComplianceStandardCommand],
) <fig-get-compliance-standard-command>

*Descrizione*

_GetComplianceStandardCommand_ è  utilizzato per trasportare i dati necessari al recupero del dettaglio di un Compliance Standard. Incapsula i parametri di input del metodo esposto da _GetComplianceStandardUseCase_.

*Attributi*

- `+ standard_id: String` — identificativo univoco dello Standard di cui recuperare il dettaglio.

*Metodi e funzioni*

_GetComplianceStandardCommand_ non definisce metodi propri.

==== FindStandardPort <FindStandardPort>
#figure(
  image("../uml/png/GetDeviceDetail/FindStandardPort.png", width: 50%),
  caption: [FindStandardPort],
) <fig-find-standard-port>
*Descrizione*

_FindStandardPort_ è l'interfaccia (Outbound Port) che definisce il contratto per il recupero di uno standard di conformità dal sistema di persistenza. Viene implementata da _MongoStandardAdapter_ e utilizzata da _OpenEvaluationSessionService_.

*Attributi*

_FindStandardPort_ non definisce attributi.

*Metodi e funzioni*

- `+ find_by_id(standard_id: String): ComplianceStandard` — firma del metodo che recupera lo standard di conformità corrispondente all'identificativo fornito.

==== ComplianceStandard

#figure(
  image("../uml/png/GetDeviceDetail/ComplianceStandard.png", width: 35%),
  caption: [ComplianceStandard],
) <fig-standard>

*Descrizione*

_ComplianceStandard_ rappresenta il documento che contiene le regole alle quali i dispositivi devono sottostare.

*Attributi*

- `- id: String` — identificativo univoco dello standard.
- `- name: String` — nome dello Standard.
- `- version_number: String` — versione dello Standard.
- `- requirements: Map<String, Requirement>` — mappa i requisiti dello standard, indicizzati per il loro identificativo.

*Metodi e funzioni*

- `+ get_requirement(requirement_id: String): Requirement` — recupera il requisito corrispondente all'identificativo fornito.
- `+ evaluate_requirement(requirement_id: String, answers: AssetEvidence): EvaluationState` — valuta un requisito inserendo le answers, ritorna un _EvaluationState_

==== MongoStandardAdapter <MongoStandardAdapter>
#figure(
  image("../uml/png/GetDeviceDetail/MongoStandardAdapter.png", width: 50%),
  caption: [MongoStandardAdapter],
) <fig-mongo-standard-adapter>
*Descrizione*

_MongoStandardAdapter_ è la classe dell'Outbound Adapter annotata come _Mongo Repository_ che implementa _FindStandardPort_, traducendo le operazioni di recupero degli standard di conformità in interazioni concrete con MongoDB.

*Attributi*

_MongoStandardAdapter_ non definisce attributi propri nel diagramma.

*Metodi e funzioni*

- `+ save(standard: ComplianceStandard): void` — persiste uno standard di conformità nel database.
- `+ find_by_id(standard_id: String): ComplianceStandard` — recupera lo standard di conformità corrispondente all'identificativo fornito.

=== GetDeviceList


#figure(
  image("../uml/png/GetDeviceList/GetDeviceList.png", width: 100%),
  caption: [Caso d'uso GetDeviceList],
) <fig-get-device-list>

Il diagramma illustra l'architettura del modulo dedicato al recupero della lista sintetica dei Dispositivi.

Per la definizione di _FlaskQueryDeviceController_, vedere la sezione @FlaskQueryDeviceController. \
Per la definizione di _Device_, vedere la sezione @Device. \
Per la definizione di _MongoDeviceAdapter_, vedere la sezione @MongoDeviceAdapter.

Di seguito vengono documentati esclusivamente i componenti introdotti specificamente per questo caso d'uso.



==== GetDeviceListUseCase
#figure(
  image("../uml/png/GetDeviceList/GetDeviceListUseCase.png", width: 35%),
  caption: [GetDeviceListUseCase],
) <fig-get-device-list-use-case>
*Descrizione*

_GetDeviceListUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per il recupero della lista sintetica dei Dispositivi. Viene implementata da _GetDeviceListService_ e utilizzata da _FlaskQueryDeviceController_.

*Attributi*

_GetDeviceListUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ get_list(): List<DeviceSummary>` — firma del metodo delegato al recupero della lista sintetica di tutti i Dispositivi presenti nel sistema.

==== GetDeviceListService

#figure(
  image("../uml/png/GetDeviceList/GetDeviceListService.png", width: 45%),
  caption: [GetDeviceListService],
) <fig-get-device-list-service>

*Descrizione*

_GetDeviceListService_ è il service applicativo appartenente all'Application Core responsabile del recupero della lista sintetica dei Dispositivi. Implementa l'interfaccia _GetDeviceListUseCase_ e coordina il recupero tramite la porta outbound _FindAllDevicesPort_.

*Attributi*

- `- find_port: FindAllDevicesPort` — porta outbound utilizzata per il recupero della lista dei Dispositivi dal sistema di persistenza.

*Metodi e funzioni*

- `+ get_list(): List<DeviceSummary>` — concretizza il contratto definito da _GetDeviceListUseCase_. Recupera la lista sintetica di tutti i Dispositivi tramite _FindAllDevicesPort_.

==== DeviceSummary
#figure(
  image("../uml/png/GetDeviceList/DeviceSummary.png", width: 30%),
  caption: [DeviceSummary],
) <fig-device-summary>
*Descrizione*

_DeviceSummary_ è il Data Transfer Object che veicola la rappresentazione sintetica di un Dispositivo verso il livello di presentazione. Espone esclusivamente le informazioni necessarie alla visualizzazione in lista, evitando di esporre l'intera entità di dominio.

*Attributi*

- `+ device_id: String` — identificativo univoco del dispositivo
- `+ name: String` — nome del dispositivo
- `+ os: String` — sistema operativo del dispositivo
- `+ description: String` — descrizione del dispositivo
- `+ compliance_standard_id: String` — identificativo univoco dello Standard

*Metodi e funzioni*

_DeviceSummary_ non definisce metodi.



==== FindAllDevicesPort
#figure(
  image("../uml/png/GetDeviceList/FindAllDevicesPort.png", width: 45%),
  caption: [FindAllDevicesPort],
) <fig-find-all-devices-port>
*Descrizione*

_FindAllDevicesPort_ è l'interfaccia (Outbound Port) che definisce il contratto per il recupero della lista sintetica di tutti i Dispositivi dal sistema di persistenza. Viene implementata da _MongoDeviceAdapter_ e utilizzata da _GetDeviceListService_.

*Attributi*

_FindAllDevicesPort_ non definisce attributi.

*Metodi e funzioni*

- `+ find_all(): List<DeviceSummary>` — firma del metodo che recupera la lista sintetica di tutti i Dispositivi presenti nel sistema di persistenza.



=== GetDeviceEvaluationDetail
#figure(
  image("../uml/png/GetDeviceEvaluationDetail/GetDeviceEvaluationDetail.png", width: 100%),
  caption: [GetDeviceEvaluationDetail],
) <fig-get-device-evaluation-detail>

Il diagramma illustra l'architettura del modulo dedicato al recupero della dashboard di un Dispositivo, che aggrega le informazioni della sessione di valutazione attiva in una vista sintetica.
- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la sezione @InMemoryEvaluationSessionCache.
- Per la definizione di _GetEvaluationSessionPort_, vedere la sezione @GetEvaluationSessionPort. \

==== FlaskQueryDashboardController

#figure(
  image("../uml/png/GetDeviceEvaluationDetail/FlaskQueryDashboardController.png", width: 40%),
  caption: [FlaskQueryDashboardController],
) <fig-flask-query-dashboard-controller>

*Descrizione*

_FlaskQueryDeviceController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP di lettura di un device per la dashboard.

*Attributi*

- `- get_device_evaluation_detail_use_case: GetDeviceEvaluationDetailUseCase` — inbound port usata per prelevare un _DeviceEvaluationDetail_.

*Metodi e funzioni*

- `+ get_device_dashboard(req: Request): Response` — riceve la richiesta HTTP di recupero di un _DeviceEvaluationDetail_ per la dashboard.

==== GetDeviceEvaluationDetailCommand

#figure(
  image("../uml/png/GetDeviceEvaluationDetail/GetDeviceEvaluationDetailCommand.png", width: 40%),
  caption: [GetDeviceEvaluationDetailCommand],
) <fig-get-device-evaluation-detail-command>

*Descrizione*

_GetDeviceEvaluationDetailCommand_ è il Command Object utilizzato per trasportare i dati necessari al recupero della dashboard di un Dispositivo. Incapsula i parametri di input del metodo esposto da _GetDeviceEvaluationDetailUseCase_.

*Attributi*

- `+ session_id: String` — identificativo univoco della sessione
- `+ device_id: String` — identificativo univoco del Dispositivo di cui recuperare le informazioni.

*Metodi e funzioni*

_GetDeviceEvaluationDetailCommand_ non definisce metodi propri.

==== GetDeviceEvaluationDetailUseCase

#figure(
  image("../uml/png/GetDeviceEvaluationDetail/GetDeviceEvaluationDetailUseCase.png", width: 40%),
  caption: [GetDeviceEvaluationDetailUseCase],
) <fig-get-device-evaluation-detail-use-case>

*Descrizione*

_GetDeviceEvaluationDetailUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per il recupero della dashboard di un Dispositivo. Viene implementata da _GetDeviceEvaluationDetailService_ e utilizzata da _FlaskQueryDashboardController_.

*Attributi*

_GetDeviceEvaluationDetailUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ get_device_evaluation_detail(command: GetDeviceEvaluationDetailCommand): DeviceEvaluationDetail` — firma del metodo delegato al recupero e all'aggregazione delle informazioni della sessione di valutazione.

==== GetDeviceEvaluationDetailService

#figure(
  image("../uml/png/GetDeviceEvaluationDetail/GetDeviceEvaluationDetailService.png", width: 50%),
  caption: [GetDeviceEvaluationDetailService],
) <fig-get-device-evaluation-detail-service>

*Descrizione*

_GetDeviceEvaluationDetailService_ è il service applicativo appartenente all'Application Core responsabile del recupero della dashboard di un Dispositivo. Implementa l'interfaccia _GetDeviceEvaluationDetailUseCase_, recupera la sessione attiva tramite _GetEvaluationSessionPort_ e costruisce il _EvaluationDetailCommand_ con le informazioni aggregate.

*Attributi*

- `- get_evaluation_session_port: GetEvaluationSessionPort` — outbound port per prelevare la sessione di valutaione.

*Metodi e funzioni*

- `+ get_device_evaluation_detail(command: GetDeviceEvaluationDetailCommand): DeviceEvaluationDetail` —
concretizza il contratto definito da _GetDeviceEvaluationDetailUseCase_. Recupera la sessione attiva, aggrega le informazioni del Dispositivo e dei suoi Asset e restituisce la rappresentazione _DeviceEvaluationDetail_.

==== DeviceEvaluationDetail
#figure(
  image("../uml/png/GetDeviceEvaluationDetail/DeviceEvaluationDetail.png", width: 45%),
  caption: [DeviceEvaluationDetail],
)

*Descrizione*

_DeviceEvaluationDetail_ è l'oggetto di dominio che contiene le informazioni anagrafiche, gli asset e il suo stato di valutazione attuale.

*Attributi*

- `+ device_id: String` — identificativo univoco del Dispositivo.
- `+ name: String` — nome del Dispositivo.
- `+ operating_system: String` — sistema operativo del Dispositivo.
- `+ description: String` — descrizione testuale del Dispositivo.
- `+ standard_id: String` — identificativo univoco dello Standard associato.
- `+ asset_details: List<AssetEvaluationDetail>` — lista degli asset con valutazione calcolata.
- `+ verdict: EvaluationState` — stato di valutazione aggregato del Dispositivo.


*Metodi e funzioni*

_EvaluationDetailCommand_ non definisce metodi.

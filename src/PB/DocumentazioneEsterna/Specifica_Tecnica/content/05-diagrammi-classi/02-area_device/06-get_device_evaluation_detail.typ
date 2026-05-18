=== GetDeviceEvaluationDetail
#figure(
  image("../uml/png/GetDeviceEvaluationDetail/GetDeviceEvaluationDetail1.png", width: 100%),
  caption: [GetDeviceEvaluationDetail],
) <fig-get-device-evaluation-detail>

Il diagramma illustra l'architettura del modulo dedicato al recupero della dashboard di un Dispositivo, che aggrega le informazioni della sessione di valutazione attiva in una vista sintetica.
- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la sezione @InMemoryEvaluationSessionCache.
- Per la definizione di _GetEvaluationSessionPort_, vedere la sezione @GetEvaluationSessionPort.
- Per la definizione di _EvaluationEngine_, vedere la sezione @EvaluationEngine
- per la definizione di _DeviceEvaluationDetail_, vedere la sezione di @DeviceEvaluationDetail

// ==== FlaskQueryDashboardController

// #figure(
//   image("../uml/png/GetDeviceEvaluationDetail/FlaskQueryDashboardController.png", width: 40%),
//   caption: [FlaskQueryDashboardController],
// ) <fig-flask-query-dashboard-controller>

// *Descrizione*

// _FlaskQueryDeviceController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP di lettura di un device per la dashboard.

// *Attributi*

// - `- get_device_evaluation_detail_use_case: GetDeviceEvaluationDetailUseCase` — inbound port usata per prelevare un _DeviceEvaluationDetail_.

// *Metodi*

// - `+ get_device_dashboard(req: Request): Response` — riceve la richiesta HTTP di recupero di un _DeviceEvaluationDetail_ per la dashboard.

==== FlaskDeviceEvaluationDetailController

#figure(
  image("../uml/png/GetDeviceEvaluationDetail/FlaskDeviceEvaluationDetailController.png", width: 40%),
  caption: [FlaskQueryDashboardController],
) <fig-flask-query-dashboard-controller>

*Descrizione*

_FlaskDeviceEvaluationDetailController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP di lettura di un device per la dashboard.

*Attributi*

- `- get_device_evaluation_detail_use_case: GetDeviceEvaluationDetailUseCase` — inbound port usata per prelevare un _DeviceEvaluationDetail_.

*Metodi*

- `+ get_device_evaluation_detail(req: Request): Response` — riceve la richiesta HTTP di recupero di un _DeviceEvaluationDetail_ per la dashboard.


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

*Metodi*

_GetDeviceEvaluationDetailCommand_ non definisce metodi propri.

==== GetDeviceEvaluationDetailUseCase

#figure(
  image("../uml/png/GetDeviceEvaluationDetail/GetDeviceEvaluationDetailUseCase.png", width: 60%),
  caption: [GetDeviceEvaluationDetailUseCase],
) <fig-get-device-evaluation-detail-use-case>

*Descrizione*

_GetDeviceEvaluationDetailUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per il recupero della dashboard di un Dispositivo. Viene implementata da _GetDeviceEvaluationDetailService_ e utilizzata da _FlaskQueryDashboardController_.

*Attributi*

_GetDeviceEvaluationDetailUseCase_ non definisce attributi.

*Metodi*
#set par(justify: false)
- `+ get_device_evaluation_detail(command: GetDeviceEvaluationDetailCommand): DeviceEvaluationDetail` — firma del metodo delegato al recupero e all'aggregazione delle informazioni della sessione di valutazione.

==== GetDeviceEvaluationDetailService

#figure(
  image("../uml/png/GetDeviceEvaluationDetail/GetDeviceEvaluationDetailService.png", width: 70%),
  caption: [GetDeviceEvaluationDetailService],
) <fig-get-device-evaluation-detail-service>

*Descrizione*

_GetDeviceEvaluationDetailService_ è il service applicativo appartenente all'Application Core responsabile del recupero della dashboard di un Dispositivo. Implementa l'interfaccia _GetDeviceEvaluationDetailUseCase_, recupera la sessione attiva tramite _GetEvaluationSessionPort_ e costruisce il _EvaluationDetailCommand_ con le informazioni aggregate.

*Attributi*

- `- get_evaluation_session_port: GetEvaluationSessionPort` — outbound port per prelevare la sessione di valutaione.

*Metodi*
#set par(justify: false)

- `+ get_device_evaluation_detail(command: GetDeviceEvaluationDetailCommand): DeviceEvaluationDetail` —
concretizza il contratto definito da _GetDeviceEvaluationDetailUseCase_. Recupera la sessione attiva, aggrega le informazioni del Dispositivo e dei suoi Asset e restituisce la rappresentazione _DeviceEvaluationDetail_.

==== DTO
Qui vengono elencati i dto usati dal controller per gestire ed esporre i dettagli della valutazione di un dispositivo.

#figure(
  image("../uml/png/GetDeviceEvaluationDetail/DeviceEvaluationDTO.png", width: 50%),
  caption: [DeviceEvaluationDTO]
) <fig-device-evaluation-dto>


===== DeviceEvaluationDTO <DeviceEvaluationDTO>

*Descrizione*

_DeviceEvaluationDTO_ è il Data Transfer Object principale utilizzato per consolidare e trasportare le informazioni anagrafiche e l'esito complessivo della valutazione di un intero dispositivo. Funge da aggregatore principale per la vista dashboard, includendo al suo interno una lista sintetica dello stato di tutti gli asset ad esso associati.

*Attributi*

- `+ device_name: String` — nome assegnato al dispositivo.
- `+ device_os: String` — sistema operativo in uso sul dispositivo.
- `+ device_description: String` — breve descrizione testuale del dispositivo.
- `+ device_evaluation_result: EvaluationState` — stato globale e finale della valutazione di conformità per l'intero dispositivo.
- `+ asset_list: Tuple<AssetEvaluationSummaryDTO>` — tupla contenente i DTO di riepilogo per ciascun asset analizzato all'interno del dispositivo.

*Metodi*

_DeviceEvaluationDTO_ non definisce metodi.


===== AssetEvaluationSummaryDTO <AssetEvaluationSummaryDTO>

*Descrizione*

_AssetEvaluationSummaryDTO_ è un Data Transfer Object leggero e di supporto, istanziato esclusivamente per popolare la lista degli asset all'interno di un _DeviceEvaluationDTO_. Fornisce una vista sintetica contenente le informazioni essenziali e il verdetto di un singolo asset, risultando ottimale per le visualizzazioni a elenco o per le tabelle riassuntive nella dashboard.

*Attributi*

- `+ asset_id: String` — identificativo univoco dell'asset valutato.
- `+ asset_name: String` — nome dell'asset.
- `+ asset_type: AssetType` — categoria o tipologia a cui appartiene l'asset.
- `+ asset_evaluation: EvaluationState` — stato corrente e finale della valutazione specifica per questo asset.

*Metodi*

_AssetEvaluationSummaryDTO_ non definisce metodi.
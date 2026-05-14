=== GetDeviceEvaluationDetail
#figure(
  image("../uml/png/GetDeviceEvaluationDetail/GetDeviceEvaluationDetail1.png", width: 100%),
  caption: [GetDeviceEvaluationDetail],
) <fig-get-device-evaluation-detail>

Il diagramma illustra l'architettura del modulo dedicato al recupero della dashboard di un Dispositivo, che aggrega le informazioni della sessione di valutazione attiva in una vista sintetica.
- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la sezione @InMemoryEvaluationSessionCache.
- Per la definizione di _GetEvaluationSessionPort_, vedere la sezione @GetEvaluationSessionPort. \

// ==== FlaskQueryDashboardController

// #figure(
//   image("../uml/png/GetDeviceEvaluationDetail/FlaskQueryDashboardController.png", width: 40%),
//   caption: [FlaskQueryDashboardController],
// ) <fig-flask-query-dashboard-controller>

// *Descrizione*

// _FlaskQueryDeviceController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP di lettura di un device per la dashboard.

// *Attributi*

// - `- get_device_evaluation_detail_use_case: GetDeviceEvaluationDetailUseCase` — inbound port usata per prelevare un _DeviceEvaluationDetail_.

// *Metodi e funzioni*

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

*Metodi e funzioni*

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
#set par(justify: false)

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


==== EvaluationEngine
#figure(
  image("../uml/png/GetDeviceEvaluationDetail/EvaluationEngine.png", width: 100%),
  caption: [DeviceEvaluationDetail],
)

*Descrizione*

_EvaluationEngine_ è il componente core del dominio che incapsula la logica di valutazione. Ha la responsabilità di valutare la conformità di un _Device_ rispetto a un _ComplianceStandard_, calcolando iterativamente i verdetti per i suoi asset e risolvendo ricorsivamente i requisiti tramite memoizzazione.

*Attributi*

_EvaluationEngine_ non definisce attributi.

*Metodi e funzioni*

- `+ evaluate(device: Device, standard: ComplianceStandard): DeviceEvaluationResult` — metodo pubblico principale che orchestra la valutazione del dispositivo calcolando e aggregando i risultati dei suoi singoli asset.

- `- evaluate_asset(asset: Asset, standard: ComplianceStandard): AssetEvaluationResult` — valuta un singolo asset verificando tutti i requisiti dello standard. Inizializza e gestisce la `cache` per l'elaborazione dei requisiti.

- `- resolve(requirement_id: String, standard: ComplianceStandard, asset: Asset, cache: Map<String, RequirementEvaluationResult>): RequirementEvaluationResult` — risolve e valuta un singolo requisito e le sue dipendenze in modo ricorsivo. Sfrutta la `cache` passata per riferimento per applicare il pattern della memoizzazione ed evitare ricalcoli.

- `- aggregate_evaluation_states(states: List<EvaluationState>): EvaluationState` — funzione di utilità che aggrega una lista di stati in un unico verdetto finale. La priorità del fallimento decreta `FAIL` se presente, seguito da `PENDING` in assenza di evidenze, e infine `PASS`.

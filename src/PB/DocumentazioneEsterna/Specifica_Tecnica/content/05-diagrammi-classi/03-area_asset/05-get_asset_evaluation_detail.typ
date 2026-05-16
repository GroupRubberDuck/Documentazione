=== GetAssetEvaluationDetail
#figure(
  image("../uml/png/GetAssetEvaluationDetail/GetAssetEvaluationDetail.png", width: 100%),
  caption: [GetAssetEvaluationDetail],
) <fig-get-device-evaluation-detail>

Il diagramma illustra l'architettura del modulo dedicato al recupero di un _AssetEvaluationDetail_ contenente informazioni anagrafiche e stato di valutazione del dispositivo.
- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la sezione @InMemoryEvaluationSessionCache.
- Per la definizione di _GetEvaluationSessionPort_, vedere la sezione @GetEvaluationSessionPort. \
- Per la definizione di _AssetEvaluationDetail_, vedere la sezione @AssetEvaluationDetail

==== FlaskAssetEvaluationDetailController
#figure(
  image("../uml/png/GetAssetEvaluationDetail/FlaskAssetEvaluationDetailController.png", width: 45%),
  caption: [GetAssetEvaluationDetail],
) <fig-get-device-evaluation-detail>

*Descrizione*

_FlaskAssetEvaluationDetailController_ è un adapter di input (controller) che ha la responsabilità di intercettare le richieste per la visualizzazione del dettaglio di valutazione di un asset, interrogare il core applicativo (attraverso le porte di inbound) e presentare i risultati o gli eventuali errori di dominio alla vista.

*Attributi*

- `- _get_asset_ev_detail_use_case: GetAssetDetailUseCase` — istanza del caso d'uso necessaria per recuperare i dettagli della valutazione dell'asset richiesto.

*Metodi e funzioni*

- `+ get_asset_evaluation_detail(session_id: String, device_id: String, asset_id: String): Response` — preleva tramite la porta di inbound l'oggetto di dominio _AssetEvaluationDetail_.

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
  image("../uml/png/GetAssetEvaluationDetail/GetAssetEvaluationDetailUseCase.png", width: 70%),
  caption: [GetAssetEvaluationDetailUseCase],
) <fig-get-device-evaluation-detail-use-case>

*Descrizione*

_GetAssetEvaluationDetailUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per il recupero di un _AssetEvaluationDetail_. Viene implementata da _GetAssetEvaluationDetailService_ e utilizzata da _FlaskAssetEvaluationDetailController_.

*Attributi*

_GetAssetEvaluationDetailUseCase_ non definisce attributi.

*Metodi e funzioni*

#set par(justify: false)
- `+ get_asset(command: GetAssetEvaluationDetailCommand): AssetEvaluationDetail` — firma del metodo delegato al recupero e all'aggregazione delle informazioni della sessione di valutazione.

==== GetAssetEvaluationDetailService

#figure(
  image("../uml/png/GetAssetEvaluationDetail/GetAssetEvaluationDetailService.png", width: 70%),
  caption: [GetAssetEvaluationDetailService],
) <fig-get-device-evaluation-detail-service>

*Descrizione*

Concretizza il contratto definito da _GetAssetEvaluationDetailUseCase_. Recupera la sessione di valutazione specificata, esegue la valutazione del dispositivo tramite l'engine e isola i risultati dell'Asset richiesto. Infine, aggrega i dati anagrafici di tale Asset con i risultati della valutazione dei suoi requisiti, restituendo la rappresentazione _AssetEvaluationDetail_

*Attributi*

- `- get_evaluation_session_port: GetEvaluationSessionPort` — outbound port usata per recuperare la sessione.

*Metodi e funzioni*

- `+ get_asset(command: GetAssetEvaluationDetailCommand): AssetEvaluationDetail` —
concretizza il contratto definito da _GetAssetEvaluationDetailUseCase_. Recupera la sessione attiva, aggrega le informazioni del Dispositivo e dei suoi Asset e restituisce la rappresentazione _AssetEvaluationDetail_.




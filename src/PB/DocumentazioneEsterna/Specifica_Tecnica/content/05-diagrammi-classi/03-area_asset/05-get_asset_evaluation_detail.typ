=== GetAssetEvaluationDetail
#figure(
  image("../uml/png/GetAssetEvaluationDetail/GetAssetEvaluationDetail.png", width: 100%),
  caption: [GetAssetEvaluationDetail],
) <fig-get-device-evaluation-detail>

Il diagramma illustra l'architettura del modulo dedicato al recupero di un _AssetEvaluationDetail_ contenente informazioni anagrafiche e stato di valutazione del dispositivo.
- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la @InMemoryEvaluationSessionCache.
- Per la definizione di _GetEvaluationSessionPort_, vedere la @GetEvaluationSessionPort. \
- Per la definizione di _AssetEvaluationDetail_, vedere la @AssetEvaluationDetail.

==== FlaskAssetEvaluationDetailController
#figure(
  image("../uml/png/GetAssetEvaluationDetail/FlaskAssetEvaluationDetailController.png", width: 45%),
  caption: [GetAssetEvaluationDetail],
) <fig-get-device-evaluation-detail>

*Descrizione*

_FlaskAssetEvaluationDetailController_ è un adapter di input (controller) che ha la responsabilità di intercettare le richieste per la visualizzazione del dettaglio di valutazione di un asset, interrogare il core applicativo (attraverso le porte di inbound) e presentare i risultati o gli eventuali errori di dominio alla vista.

*Attributi*

- `- _get_asset_ev_detail_use_case: GetAssetEvaluationDetailUseCase` — istanza del caso d'uso necessaria per recuperare i dettagli della valutazione dell'asset richiesto.

*Metodi*

- `+ get_asset_evaluation_detail(session_id: String, device_id: String, asset_id: String): Response` — preleva tramite la porta di inbound l'oggetto di dominio _AssetEvaluationDetail_.

==== GetAssetEvaluationDetailCommand

#figure(
  image("../uml/png/GetAssetEvaluationDetail/GetAssetEvaluationDetailCommand.png", width: 40%),
  caption: [GetAssetEvaluationDetailCommand],
) <fig-get-device-evaluation-detail-command>

*Descrizione*

_GetAssetEvaluationDetailCommand_ è il Command Object utilizzato per trasportare i dati necessari al recupero di un _AssetEvaluationDetail_. Incapsula i parametri di input del metodo esposto da _GetAssetEvaluationDetailUseCase_.

*Attributi*

- `+ device_id: String` — identificativo univoco del Dispositivo di cui recuperare le informazioni.
- `+ asset_id: String` — identificativo univoco dell'Asset.
- `+ session_id: String` — identificativo univoco della sessione.

*Metodi*

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

*Metodi*

#set par(justify: false)
- `+ get_asset(command: GetAssetEvaluationDetailCommand): AssetEvaluationDetail` — firma del metodo delegato al recupero e all'aggregazione delle informazioni della sessione di valutazione.

==== GetAssetEvaluationDetailService

#figure(
  image("../uml/png/GetAssetEvaluationDetail/GetAssetEvaluationDetailService.png", width: 70%),
  caption: [GetAssetEvaluationDetailService],
) <fig-get-device-evaluation-detail-service>

*Descrizione*

Concretizza il contratto definito da _GetAssetEvaluationDetailUseCase_. Recupera la sessione di valutazione specificata, esegue la valutazione del dispositivo tramite l'engine e isola i risultati dell'Asset richiesto. Infine, aggrega i dati anagrafici di tale Asset con i risultati della valutazione dei suoi requisiti, restituendo la rappresentazione _AssetEvaluationDetail_.

*Attributi*

- `- get_evaluation_session_port: GetEvaluationSessionPort` — outbound port usata per recuperare la sessione.

*Metodi*

- `+ get_asset(command: GetAssetEvaluationDetailCommand): AssetEvaluationDetail` —
concretizza il contratto definito da _GetAssetEvaluationDetailUseCase_. Recupera la sessione attiva, aggrega le informazioni del Dispositivo e dei suoi Asset e restituisce la rappresentazione _AssetEvaluationDetail_.

==== DTO
Qui vengono elencati i DTO usati dal controller per gestire ed esporre i dettagli della valutazione di un asset verso l'interfaccia frontend o le API.

#figure(
  image("../uml/png/GetAssetEvaluationDetail/AssetEvaluationDTO.png", width: 70%),
  caption: [AssetEvaluationDTO]
) <fig-asset-evaluation-DTO>

===== AssetEvaluationDTO <AssetEvaluationDTO>

*Descrizione*

_AssetEvaluationDTO_ è il Data Transfer Object principale utilizzato per esporre all'interfaccia utente i dettagli anagrafici e l'esito complessivo della valutazione di uno specifico asset. Agisce come aggregatore, includendo al suo interno una lista sintetica dello stato di tutti i requisiti ad esso associati.

*Attributi*

- `+ name: String` — nome dell'asset valutato.
- `+ type: AssetType` — categoria o tipologia a cui appartiene l'asset.
- `+ evaluation: EvaluationState` — stato globale e finale della valutazione di conformità per l'intero asset.
- `+ description: String` — descrizione testuale aggiuntiva dell'asset.
- `+ requirements: List<RequirementEvaluationSummaryDTO>` — tupla contenente i DTO di riepilogo per ciascun requisito associato all'asset.

*Metodi*

_AssetEvaluationDTO_ non definisce metodi.


===== RequirementEvaluationSummaryDTO <RequirementEvaluationSummaryDTO>

*Descrizione*

_RequirementEvaluationSummaryDTO_ è un Data Transfer Object estremamente leggero e di supporto, istanziato esclusivamente per popolare la lista dei requisiti all'interno di un _AssetEvaluationDTO_. Fornisce una vista sintetica limitata all'identificativo e al verdetto, ideale per le visualizzazioni a elenco o in forma di tabella.

*Attributi*

- `+ id: String` — identificativo univoco del requisito valutato.
- `+ evaluation: EvaluationState` — stato corrente della valutazione specifica per questo requisito.

*Metodi*

_RequirementEvaluationSummaryDTO_ non definisce metodi.

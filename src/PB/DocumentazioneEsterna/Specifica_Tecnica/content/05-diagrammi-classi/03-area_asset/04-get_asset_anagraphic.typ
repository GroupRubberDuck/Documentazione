=== GetAssetAnagraphic <GetAssetAnagraphic>

#figure(
  image("../uml/png/GetAssetAnagraphic/GetAssetAnagraphic.png", width: 90%),
  caption: [Caso d'uso GetAssetAnagraphic]
) <fig-get-asset-detail>

Il diagramma illustra l'architettura del modulo dedicato al recupero del dettaglio di un Asset all'interno di una sessione di valutazione attiva. 

- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la sezione @InMemoryEvaluationSessionCache.
- Per la definizione di _GetEvaluationSessionPort_, vedere la sezione @GetEvaluationSessionPort
- Per la definizione di _AssetAnagraphic_, vedere la sezione @AssetAnagraphic

Di seguito vengono documentati esclusivamente i componenti introdotti specificamente per questo caso d'uso.


==== FlaskQueryAssetController
#figure(
  image("../uml/png/GetAssetAnagraphic/FlaskQueryAssetController.png", width: 45%),
  caption: [FlaskQueryAssetController],
)

*Descrizione*

_FlaskQueryAssetController_ è un adapter di input (controller) basato su Flask. Ha la responsabilità di intercettare le richieste web in lettura relative agli Asset, interagire con i casi d'uso applicativi e restituire le viste HTML (template) popolate con i dati di dominio mappati tramite Data Transfer Object (DTO).

*Attributi*

- `- _get_asset_anagraphic_use_case: GetAssetAnagraphicUseCase` — istanza del caso d'uso iniettata a runtime, necessaria per recuperare le informazioni anagrafiche di un asset specifico.

*Metodi e funzioni*

- `+ edit_asset_page(session_id: String, device_id: String, asset_id: String): Response` — delega al caso d'uso il recupero dell'anagrafica dell'asset, mappa le informazioni di dominio in un `AssetAnagraphicDTO` e restituisce il template HTML precompilato per la visualizzazione/modifica.


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
#set par(justify: false)
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


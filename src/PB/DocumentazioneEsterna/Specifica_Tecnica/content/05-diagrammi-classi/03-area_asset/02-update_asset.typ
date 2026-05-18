=== UpdateAsset

#block(breakable: false)[
#figure(
  image("../uml/png/UpdateAsset/UpdateAsset.png", width: 100%),
  caption: [Caso d'uso UpdateAsset]
) <fig-save-asset>

Il diagramma illustra l'architettura del modulo di modifica di un Asset esistente all'interno di una sessione di valutazione attiva.

- Per la definizione di _FlaskWriteAssetController_, vedere la sezione @FlaskWriteAssetController. \
- Per la definizione di _Asset_, vedere la sezione @Asset.
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

*Metodi*

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

*Metodi*

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

*Metodi*

- `+ udpate_asset(asset: UpdateAssetCommand): void` — concretizza il contratto definito da _UpdateAssetUseCase_. Recupera la sessione attiva, individua l'Asset da aggiornare tramite `asset_id` e ne persiste lo stato modificato.
]


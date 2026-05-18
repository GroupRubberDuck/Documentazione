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

*Metodi*

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

*Metodi*

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

*Metodi*

- `+ delete_asset(command: DeleteAssetCommand): void` — concretizza il contratto definito da _DeleteAssetUseCase_. Recupera la sessione attiva, individua e rimuove l'Asset corrispondente e ne persiste lo stato aggiornato.


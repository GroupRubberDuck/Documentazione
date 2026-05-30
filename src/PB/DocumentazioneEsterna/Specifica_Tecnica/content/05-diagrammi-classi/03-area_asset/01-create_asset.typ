=== CreateAsset

#figure(
  image("../uml/png/CreateAsset/CreateAsset.png", width: 100%),
  caption: [Caso d'uso CreateAsset]
) <fig-create-asset>

Il diagramma illustra l'architettura del modulo di creazione di un Asset all'interno di una sessione di valutazione attiva. 
- per la definizione di _Asset_, vedere la di @Asset


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

*Metodi*

- `+ create_asset(req: Request): Response` — riceve la richiesta HTTP di creazione di un nuovo Asset, estrae i dati dal corpo della richiesta e li inoltra al livello applicativo; restituisce una risposta HTTP con l'esito dell'operazione.
- `+ update_asset(req: Request): Response` — riceve la richiesta HTTP di aggiornamento di un Asset esistente, estrae i dati modificati e li inoltra al livello applicativo; restituisce una risposta HTTP con l'esito dell'operazione.
- `+ delete_asset(req: Request): Response` — riceve la richiesta HTTP di eliminazione di un Asset, estrae l'identificativo dalla richiesta e lo inoltra al livello applicativo; restituisce una risposta HTTP con l'esito dell'operazione.
]


==== CreateAssetUseCase
#figure(
  image("../uml/png/CreateAsset/CreateAssetUseCase.png", width: 55%),
  caption: [CreateAssetUseCase]
) <fig-create-asset-use-case>
*Descrizione*

_CreateAssetUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per la creazione di un nuovo Asset all'interno della sessione di valutazione. Viene implementata da _CreateAssetService_ e utilizzata da _FlaskWriteAssetController_.

*Attributi*

_CreateAssetUseCase_ non definisce attributi.

*Metodi*

- `+ create_asset(asset: CreateAssetCommand): String` — firma del metodo delegato all'esecuzione della logica di creazione a partire dai dati contenuti nel comando.



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


*Metodi*

_CreateAssetCommand_ non definisce metodi.


==== CreateAssetService


#figure(
  image("../uml/png/CreateAsset/CreateAssetService.png", width: 60%),
  caption: [CreateAssetService]
) <fig-create-asset-service>

*Descrizione*

_CreateAssetService_ è il service applicativo appartenente all'Application Core responsabile della logica di creazione di un Asset. Implementa l'interfaccia _CreateAssetUseCase_, recupera la sessione attiva tramite _GetEvaluationSession_, aggiunge il nuovo _Asset_ e persiste la sessione aggiornata tramite _SaveEvaluationSession_.

*Attributi*

- `- save_evaluation_session_port: SaveEvaluationSessionPort` — outbound port usata per il salvataggio delle modifiche nella sessione
- `- get_evaluation_session_port: GetEvaluationSessionPort` — outbound port usata per prelevare la sessione di valutazione

*Metodi*

- `+ create_asset(asset: CreateAssetCommand): string` — concretizza il contratto definito da _CreateAssetUseCase_. Recupera la sessione attiva, vi aggiunge il nuovo Asset e ne persiste lo stato aggiornato. Ritorna l'id dell'asset creato.


==== InMemoryEvaluationSessionCache <InMemoryEvaluationSessionCache>

#figure(
  image("../uml/png/CreateAsset/InMemoryEvaluationSessionCache.png", width: 70%),
  caption: [InMemoryEvaluationSessionCache]
) <fig-in-memory-evaluation-session-cache>

*Descrizione*

_InMemoryEvaluationSessionCache_ è l'Outbound Adapter che funge da Session Cache. Poiché il sistema prevede un utilizzo mono-utente, la classe gestisce in memoria una singola sessione di valutazione attiva per volta.

*Attributi*

- `- session: EvaluationSession` — contiene l'oggetto EvaluationSession

*Metodi*

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

*Metodi*

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

*Metodi*

- `+ get_evaluation_session(session_id: String): EvaluationSession` — firma del metodo che recupera la sessione di valutazione attiva corrispondente all'identificativo fornito.



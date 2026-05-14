=== CreateAsset

#figure(
  image("../uml/png/CreateAsset/CreateAsset.png", width: 100%),
  caption: [Caso d'uso CreateAsset]
) <fig-create-asset>

Il diagramma illustra l'architettura del modulo di creazione di un Asset all'interno di una sessione di valutazione attiva. 

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

*Metodi e funzioni*

- `+ create_asset(req: Request): Response` — riceve la richiesta HTTP di creazione di un nuovo Asset, estrae i dati dal corpo della richiesta e li inoltra al livello applicativo; restituisce una risposta HTTP con l'esito dell'operazione.
- `+ update_asset(req: Request): Response` — riceve la richiesta HTTP di aggiornamento di un Asset esistente, estrae i dati modificati e li inoltra al livello applicativo; restituisce una risposta HTTP con l'esito dell'operazione.
- `+ delete_asset(req: Request): Response` — riceve la richiesta HTTP di eliminazione di un Asset, estrae l'identificativo dalla richiesta e lo inoltra al livello applicativo; restituisce una risposta HTTP con l'esito dell'operazione.
]


==== CreateAssetUseCase
#figure(
  image("../uml/png/CreateAsset/CreateAssetUseCase.png", width: 45%),
  caption: [CreateAssetUseCase]
) <fig-create-asset-use-case>
*Descrizione*

_CreateAssetUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per la creazione di un nuovo Asset all'interno della sessione di valutazione. Viene implementata da _CreateAssetService_ e utilizzata da _FlaskWriteAssetController_.

*Attributi*

_CreateAssetUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ create_asset(asset: CreateAssetCommand): bool` — firma del metodo delegato all'esecuzione della logica di creazione a partire dai dati contenuti nel comando.



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


*Metodi e funzioni*

_CreateAssetCommand_ non definisce metodi.


==== CreateAssetService


#figure(
  image("../uml/png/CreateAsset/CreateAssetService.png", width: 40%),
  caption: [CreateAssetService]
) <fig-create-asset-service>

*Descrizione*

_CreateAssetService_ è il service applicativo appartenente all'Application Core responsabile della logica di creazione di un Asset. Implementa l'interfaccia _CreateAssetUseCase_, recupera la sessione attiva tramite _GetEvaluationSession_, aggiunge il nuovo _Asset_ e persiste la sessione aggiornata tramite _SaveEvaluationSession_.

*Attributi*

- `- save_evaluation_session_port: SaveSessionPort` — outbound port usata per il salvataggio delle modifiche nella sessione
- `- get_evaluation_session_port: GetEvaluationSessionPort` — outbound port usata per prelevare la sessione di valutazione

*Metodi e funzioni*

- `+ create_asset(asset: CreateAssetCommand): string` — concretizza il contratto definito da _CreateAssetUseCase_. Recupera la sessione attiva, vi aggiunge il nuovo Asset e ne persiste lo stato aggiornato. Ritorna l'id dell'asset creato.



==== Asset <Asset>

#figure(
  image("../uml/png/CreateAsset/Asset.png", width: 45%),
  caption: [Asset]
) <fig-asset-domain>

*Descrizione*

_Asset_ è l'entità di dominio che rappresenta un asset oggetto di valutazione di conformità all'interno di una sessione.

*Attributi*

- `- asset_id: String` — identificativo univoco dell'Asset.
- `- asset_anagraphic: AssetAnagraphic` — oggetto che incapsula i dati anagrafici dell'asset.
- `- asset_proprieties: AssetProprieties` — oggetto che incapsula le proprietà e lo stato valutativo dell'asset.

*Metodi e funzioni*

- `+ set_node_choice(requirement_id: String, node_id: String, value: Bool): void` — imposta o aggiorna la scelta (risposta) effettuata per un determinato nodo decisionale relativo a un requisito.
- `+ set_justification(requirement_id: String, node_id: String, value: Bool): void` — imposta la giustificazione per un determinato nodo di un requisito. 
- `+ update_anagraphic(name: String, type: AssetType, description: String): void` — aggiorna le informazioni anagrafiche dell'asset (nome, tipologia e descrizione), delegando l'aggiornamento all'istanza interna di _AssetAnagraphic_.

==== AssetAnagraphic <AssetAnagraphic>
#figure(
  image("../uml/png/CreateAsset/AssetAnagraphic.png", width: 20%),
  caption: [AssetAnagraphic]
) <fig-asset-domain>
*Descrizione*

_AssetAnagraphic_ è l'entità delegata alla gestione e all'incapsulamento delle informazioni anagrafiche e dei metadati di base di un generico asset. 

*Attributi*

- `- name: String` --- stringa di testo che rappresenta il nome identificativo dell'asset.
- `- type: AssetType` --- attributo che definisce la tipologia o la categoria di appartenenza dell'asset.
- `- description: String` --- stringa di testo destinata a contenere una descrizione estesa, note o dettagli aggiuntivi riguardanti le caratteristiche fisiche o logiche dell'asset.

*Metodi e funzioni*

_AssetAnagraphic_ non definisce metodi.


==== AssetProprieties <AssetProprieties>

#figure(
  image("../uml/png/CreateAsset/AssetProprieties.png", width: 45%),
  caption: [AssetProprieties]
) <fig-asset-proprieties-domain>

*Descrizione*

_AssetProprieties_ è l'entità delegata alla gestione dello stato valutativo e delle proprietà specifiche di un asset. Presenta una relazione di composizione con la classe _AssetEvidence_ con cardinalità `1..*`, gestendone il ciclo di vita all'interno di una lista.

*Attributi*

- `+ asset_evidence_list: List<AssetEvidence>` — struttura dati che incapsula e gestisce l'elenco delle evidenze (scelte e giustificazioni) associate all'asset.

*Metodi e funzioni*

- `+ set_node_choice(requirement_id: String, node_id: String, value: Bool): void` — imposta o aggiorna la scelta (risposta) effettuata per un determinato nodo decisionale relativo a un requisito.
- `+ set_justification(requirement_id: String, node_id: String, value: Bool): void` — imposta o aggiorna la giustificazione testuale per un determinato nodo di un requisito.
- `+ get_evidence(requirement_id: String): AssetEvidence | void` — recupera l'oggetto _AssetEvidence_ associato a un determinato identificativo di requisito. Restituisce l'evidenza se presente, altrimenti `void` (nessun valore/null).


==== InMemoryEvaluationSessionCache <InMemoryEvaluationSessionCache>

#figure(
  image("../uml/png/CreateAsset/InMemoryEvaluationSessionCache.png", width: 45%),
  caption: [InMemoryEvaluationSessionCache]
) <fig-in-memory-evaluation-session-cache>

*Descrizione*

_InMemoryEvaluationSessionCache_ è la classe dell'Outbound Adapter annotata come _Session Cache_ che implementa entrambe le porte outbound _SaveEvaluationSession_ e _GetEvaluationSession_. Gestisce la persistenza in memoria delle sessioni di valutazione tramite un dizionario indicizzato per `session_id`.

*Attributi*

- `- session: EvaluationSession` — contiene l'oggetto EvaluationSession

*Metodi e funzioni*

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

*Metodi e funzioni*

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

*Metodi e funzioni*

- `+ get_evaluation_session(session_id: String): EvaluationSession` — firma del metodo che recupera la sessione di valutazione attiva corrispondente all'identificativo fornito.



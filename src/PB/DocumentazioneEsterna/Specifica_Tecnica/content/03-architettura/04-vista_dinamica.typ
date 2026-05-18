== Diagrammi di sequenza<vista_din>
La seguente sezione illustra il comportamento dinamico del sistema tramite diagrammi di sequenza, focalizzandosi sui casi d'uso di maggiore interesse. Questi modelli descrivono l'ordine cronologico dei messaggi scambiati tra gli attori esterni, i componenti infrastrutturali e il nucleo applicativo.

=== UC05 - Importazione dispositivo
#image("Diagrammi_sequenza/Importazione_dispositivo_uc05_06.png")

Il caso d'uso consente all'utente di caricare un file (CSV, JSON o XML) contenente i dati di un dispositivo e di registrarlo nel sistema. Il flusso coinvolge tre componenti principali: il controller HTTP, il servizio applicativo e il repository.

Flusso Principale
+ *Ricezione della richiesta HTTP*:\
  il FlaskImportDeviceController riceve una richiesta POST /devices/import. Prima di delegare al servizio, verifica la presenza del file nella richiesta e l'estensione dello stesso. Se il file è assente o l'estensione non è supportata, restituisce immediatamente HTTP 400 senza propagare la richiesta al layer applicativo.
+ *Costruzione del Command*:\
  Se la validazione HTTP supera il controllo, il controller costruisce un ImportDeviceCommand contenente il percorso del file e il formato dichiarato, e lo passa all'ImportDeviceService.
+ *Parsing del file*:\
  il servizio delega il parsing al FileDeviceImporterPort tramite il metodo parse_device_file. Il port è implementato dall'adapter corretto in base al formato del file (CSV, JSON, XML). Il parser legge il file e, se il formato è valido e i dati sono semanticamente corretti, restituisce direttamente un oggetto Device del dominio.
+ *Registrazione del dispositivo*:\
  il Device restituito dal parser viene passato al DeviceRepositoryPort tramite il metodo register. Il repository persiste il dispositivo nel database.
+ *Risposta di successo*:\
  Al termine del flusso, il controller restituisce HTTP 201 Created.

Flussi alternativi
- *[File non valido o formato non supportato]*
Se il file è assente nella richiesta o l'estensione non rientra tra quelle accettate (csv, json, xml), il FlaskImportDeviceController restituisce HTTP 400 Bad Request. Il servizio non viene mai invocato.

- *[Errore di parsing o dati non validi]*
Se il file non è leggibile, ha una struttura malformata, o contiene dati semanticamente non validi (es. campo obbligatorio mancante, tipo non riconosciuto), il FileDeviceImporterPort solleva una DeviceImportError. Il servizio cattura l'eccezione e la traduce in un ImportDeviceFailure, che il controller mappa in HTTP 422 Unprocessable Entity.

- *[Dispositivo già registrato]*
Se un dispositivo con lo stesso identificatore è già presente nel repository, register() solleva una DuplicateDeviceError. Il servizio la traduce in un DeviceRegistrationFailure, che il controller mappa in HTTP 409 Conflict.

=== UC26, UC27 - Valutazione di un nodo e transizione di stato
#image("Diagrammi_sequenza/Valutazione.png")

Il caso d'uso consente all'utente di registrare la risposta a un nodo decisionale nell'albero di valutazione di un requisito. Il flusso coinvolge il controller HTTP, il servizio applicativo, due port distinte per la sessione e gli oggetti di dominio EvaluationSession e Asset.

Flusso principale:
+ *Ricezione della richiesta HTTP*:\
  Il FlaskEvaluateDecisionNodeController riceve una richiesta PUT sull'endpoint /api/sessions/{session_id}/devices/{device_id}/assets/{asset_id}/requirements/{req_id}. Prima di procedere, verifica la presenza del body JSON. Se assente, restituisce immediatamente HTTP 400 senza invocare il service.
+ *Costruzione del Command*:\
  Il controller istanzia un EvaluateDecisionNodeCommand (modello Pydantic) con i parametri di path e i campi node_id e answer estratti dal body. Se la validazione Pydantic fallisce per campi mancanti o tipo non valido, restituisce HTTP 400 senza propagare la richiesta al layer applicativo.
+ *Recupero della sessione*:\
  Il EvaluateDecisionNodeService riceve il command e delega il recupero della sessione alla GetEvaluationSessionPort tramite get_evaluation_session(session_id). La port restituisce l'EvaluationSession completa, incluso il device e i suoi asset.
+ *Navigazione al dominio*:\
  Il service naviga l'aggregato di dominio per recuperare l'asset su cui operare tramite session.device.get_asset(asset_id), ottenendo l'oggetto Asset corrispondente.
+ *Registrazione della scelta*:\
  Il service invoca asset.set_node_choice(requirement_id, node_id, answer) sull'oggetto Asset. Questa chiamata registra in memoria la risposta dell'utente per il nodo specificato all'interno del requisito.
+ *Persistenza della sessione*:\
  Il service passa la EvaluationSession aggiornata alla SaveEvaluationSessionPort tramite save_evaluation_session(session). La responsabilità di persistere l'intera sessione è delegata alla port: il service non conosce il meccanismo di storage.
+ *Risposta di successo*:\
  Il service restituisce None. Il controller risponde con HTTP 200 OK e il messaggio {"message": "valutazione registrata con successo."}.

Flussi alternativi:
- *[Body JSON mancante o non valido]*
Se il body della richiesta è assente o node_id/answer non rispettano i tipi attesi da _EvaluateDecisionNodeCommand_, il controller restituisce HTTP 400 Bad Request. Il service non viene mai invocato.

- *[Sessione non trovata]*
Se la _GetEvaluationSessionPort_ non trova una sessione con l'identificatore fornito, solleva _EvaluationSessionNotFoundError_. Il service cattura l'eccezione e la traduce in _EvaluateNodeFailure_. Il controller restituisce HTTP 400 Bad Request.

- *[Asset non trovato]*
Se il device nella sessione non contiene un asset con l'identificatore fornito, il dominio solleva _AssetNotFoundError_. Il service la traduce in _EvaluateNodeFailure_. Il controller restituisce HTTP 400 Bad Request.

- *[Risposta non valida per il nodo]*
Se _set_node_choice_ riceve un valore non ammesso per il nodo specificato, il dominio solleva _ValueError_. Il service la traduce in _EvaluateNodeFailure_. Il controller restituisce HTTP 400 Bad Request.

- *[Errore di salvataggio]*
Se la _SaveEvaluationSessionPort_ non riesce a persistere la sessione, solleva _EvaluationSessionSaveError_. Il service la traduce in _EvaluateNodeFailure_. Il controller restituisce HTTP 400 Bad Request.
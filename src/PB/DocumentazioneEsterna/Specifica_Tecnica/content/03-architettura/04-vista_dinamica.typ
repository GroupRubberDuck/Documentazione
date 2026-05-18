== Diagrammi di sequenza<vista_din>
La seguente sezione illustra il comportamento dinamico del sistema tramite diagrammi di sequenza, focalizzandosi sui casi d'uso di maggiore interesse. Questi modelli descrivono l'ordine cronologico dei messaggi scambiati tra gli attori esterni, i componenti infrastrutturali e il nucleo applicativo.

=== UC05 - Importazione dispositivo
#image("Diagrammi_sequenza/Importazione_dispositivo_uc05_06.png");

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
#image("Diagrammi_sequenza/Valutazione_e_transizione_stato_uc26_27.png")

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
- [Body JSON mancante o non valido]
Se il body della richiesta è assente o node_id/answer non rispettano i tipi attesi da EvaluateDecisionNodeCommand, il controller restituisce HTTP 400 Bad Request. Il service non viene mai invocato.

- [Sessione non trovata]
Se la GetEvaluationSessionPort non trova una sessione con l'identificatore fornito, solleva EvaluationSessionNotFoundError. Il service cattura l'eccezione e la traduce in EvaluateNodeFailure. Il controller restituisce HTTP 400 Bad Request.

- [Asset non trovato]
Se il device nella sessione non contiene un asset con l'identificatore fornito, il dominio solleva AssetNotFoundError. Il service la traduce in EvaluateNodeFailure. Il controller restituisce HTTP 400 Bad Request.

- [Risposta non valida per il nodo]
Se set_node_choice riceve un valore non ammesso per il nodo specificato, il dominio solleva ValueError. Il service la traduce in EvaluateNodeFailure. Il controller restituisce HTTP 400 Bad Request.

- [Errore di salvataggio]
Se la SaveEvaluationSessionPort non riesce a persistere la sessione, solleva EvaluationSessionSaveError. Il service la traduce in EvaluateNodeFailure. Il controller restituisce HTTP 400 Bad Request.

=== UC30 - Esportazione report di conformità
#image("Diagrammi_sequenza/Esportazione_report_uc30.png")

Il diagramma di sequenza illustra il processo di generazione ed esportazione del resoconto finale di conformità per un dispositivo valutato.

Il flusso è innescato da una chiamata HTTP gestita dall'Adattatore Inbound. Il Servizio applicativo avvia il recupero del documento che viene effettuato grazie all'outbound adapter (PyMongo) che estrae i dati dal database.

Una volta recuperato il dispositivo, il Servizio invoca l'aggregazione dei verdetti sul Dominio, il quale restituisce una struttura dati esclusivamente logica (Pass/Fail/NA) senza possedere alcuna conoscenza del rendering finale. Per la creazione del file fisico il Servizio usa la porta di generazione del pdf che traduce i dati puri in un layout grafico, restituendo il file che arriverà all'utente.


== Diagrammi di attività

=== Navigazione degli alberi

#image("Diagrammi_attività/Attività_navigazione.drawio.png", width: 80%)

Il diagramma di attività illustra l'algoritmo di navigazione dell'albero normativo.

Il flusso si basa su un ciclo continuo il cui innesco principale è la risposta dell'utente a uno specifico nodo (Sì/No). Dopo l'inserimento dell'input, il sistema calcola il nodo successivo e ne verifica la natura tramite un blocco decisionale ("è foglia?"):

Se il nodo non è una foglia (nodo intermedio), il flusso torna indietro per sottoporre all'utente la nuova domanda appena calcolata.

Se il nodo è una foglia (ramo di valutazione concluso), il sistema innesca la logica di avanzamento gerarchico.

La fase di avanzamento procede per livelli. Dapprima, il sistema calcola e verifica se vi sono ulteriori requisiti da valutare per l'asset corrente ("trovo requisiti?"). In caso positivo, il nuovo requisito viene caricato e il ciclo di domande riparte dall'inizio. In caso negativo, il sistema sale di livello verificando l'esistenza di ulteriori asset non ancora esaminati nel dispositivo ("trovo asset?"). Se viene individuato un nuovo asset, ne vengono calcolati i relativi requisiti, che vengono caricati per riavviare la compilazione.

L'algoritmo fuoriesce da questo ciclo annidato solo ed esclusivamente quando sia i requisiti sia gli asset del dispositivo sono stati completamente esauriti. In questo scenario conclusivo, il sistema torna alla pagina di dashboard.
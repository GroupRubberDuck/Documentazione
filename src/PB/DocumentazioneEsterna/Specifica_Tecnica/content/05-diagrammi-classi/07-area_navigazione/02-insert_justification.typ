=== InsertJustification

#figure(
  image("../uml/png/InsertJustification/InsertJustification.png", width: 120%),
  caption: [Caso d'uso InsertJustification]
) <fig-insert-justification>

Il diagramma illustra l'architettura del modulo dedicato all'inserimento di una giustificazione testuale per un requisito di conformità durante la sessione di valutazione. 
- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la @InMemoryEvaluationSessionCache.
- Per la definizione di _GetEvaluationSessionPort_, vedere la @GetEvaluationSessionPort. \
- Per la definizione di  _SaveEvaluationSessionPort_, vedere la @SaveEvaluationSessionPort. 

Di seguito vengono documentati i componenti introdotti specificamente per questo caso d'uso.


==== FlaskInsertJustificationController
#figure(
  image("../uml/png/InsertJustification/FlaskInsertJustificationController.png", width: 40%),
  caption: [FlaskInsertJustificationController]
)
*Descrizione*

_FlaskInsertJustificationController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP di inserimento di una giustificazione per un requisito e le inoltra al livello applicativo.

*Attributi*

- `- insert_justification_use_case: InsertJustificationUseCase` — inbound port usata per inserire la giustificazione.

*Metodi*

- `+ insert_justification(req: Request): Response` — riceve la richiesta HTTP di inserimento della giustificazione, estrae i dati dal corpo della richiesta e li inoltra al livello applicativo; restituisce una risposta HTTP con l'esito dell'operazione.



==== InsertJustificationUseCase
#figure(
  image("../uml/png/InsertJustification/InsertJustificationUseCase.png", width: 40%),
  caption: [InsertJustificationUseCase]
)
*Descrizione*

_InsertJustificationUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per l'inserimento di una giustificazione testuale associata a un requisito di conformità. Viene implementata da _InsertJustificationService_ e utilizzata da _FlaskInsertJustificationController_.

*Attributi*

_InsertJustificationUseCase_ non definisce attributi.

*Metodi*

- `+ insert_justification(command: InsertJustificationCommand): void` — firma del metodo delegato all'esecuzione della logica di inserimento della giustificazione a partire dai dati contenuti nel comando.



==== InsertJustificationCommand
#figure(
  image("../uml/png/InsertJustification/InsertJustificationCommand.png", width: 30%),
  caption: [InsertJustificationCommand]
)
*Descrizione*

_InsertJustificationCommand_ è l'oggetto che veicola i dati necessari all'inserimento di una giustificazione dal controller al service.

*Attributi*

- `+ session_id: String` — identificativo della sessione di valutazione attiva.
- `+ asset_id: String` — identificativo dell'Asset oggetto di valutazione.
- `+ requirement_id: String` — identificativo del requisito a cui si associa la giustificazione.
- `+ justification: String` — testo della giustificazione da inserire.

*Metodi*

_InsertJustificationCommand_ non definisce metodi.


==== InsertJustificationService
#figure(
  image("../uml/png/InsertJustification/InsertJustificationService.png", width: 50%),
  caption: [InsertJustificationService]
)
*Descrizione*

_InsertJustificationService_ è il service applicativo appartenente all'Application Core responsabile della logica di inserimento di una giustificazione per un requisito di conformità. Implementa l'interfaccia _InsertJustificationUseCase_, recupera la sessione attiva tramite _GetEvaluationSessionPort_, associa la giustificazione al requisito specificato e persiste la sessione aggiornata tramite _SaveEvaluationSessionPort_.

*Attributi*

- `get_evaluation_session_port: GetEvaluationSessionPort` — outbound port usata per recuperare la sessione di valutazione.
- `save_evaluation_session_port: SaveEvaluationSessionPort` — outbound port usata per salvare le modifiche applicate alla sessione.

*Metodi*

- `+ insert_justification(command: InsertJustificationCommand): void` — concretizza il contratto definito da _InsertJustificationUseCase_. Recupera la sessione attiva, individua il requisito corrispondente ai parametri incapsulati nel comando, registra la giustificazione fornita e persiste la sessione aggiornata.



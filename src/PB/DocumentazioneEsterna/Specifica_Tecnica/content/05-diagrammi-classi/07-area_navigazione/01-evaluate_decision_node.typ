=== EvaluateDecisionNode <Valutazione>

#figure(
  image("../uml/png/EvaluateDecisionNode/EvaluateDecisionNode.png", width: 70%),
  caption: [Caso d'uso EvaluateDecisionNode]
) <fig-evaluate-decision-node>

Il diagramma illustra l'architettura del modulo dedicato alla valutazione di un nodo decisionale durante la verifica di conformità.

- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la sezione @InMemoryEvaluationSessionCache. \
- Per la definizione di _GetEvaluationSessionPort_, vedere la sezione @GetEvaluationSessionPort. \
- Per la definizione di _SaveEvaluationSessionPort_, vedere la sezione @SaveEvaluationSessionPort.

Di seguito vengono documentati esclusivamente i componenti introdotti specificamente per questo caso d'uso.

==== EvaluateDecisionNodeController
#figure(
  image("../uml/png/EvaluateDecisionNode/FlaskEvaluateDecisionNodeController.png", width: 60%),
  caption: [EvaluateDecisionNodeController]
)

*Descrizione*

_EvaluateDecisionNodeController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP per la valutazione di un nodo decisionale e le inoltra al livello applicativo.

*Attributi*

- `- evaluate_decision_node_use_case: EvaluateDecisionNodeUseCase` — outbound port usata per valutare un nodo

*Metodi e funzioni*

- `+ insert_decision_node_evaluation(req: Request): Response` — riceve la richiesta HTTP, estrae i dati dal corpo della richiesta e li inoltra al livello applicativo; restituisce una risposta HTTP con l'esito dell'operazione.

==== EvaluateDecisionNodeUseCase
#figure(
  image("../uml/png/EvaluateDecisionNode/EvaluateDecisionNodeUseCase.png", width: 60%),
  caption: [EvaluateDecisionNodeUseCase]
)

*Descrizione*

_EvaluateDecisionNodeUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per la valutazione di un nodo decisionale. Viene implementata da _EvaluateDecisionNodeService_ e utilizzata da _FlaskEvaluateDecisionNodeController_.

*Attributi*

_EvaluateDecisionNodeUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ evaluate_node(command: EvaluateDecisionNodeCommand): void` — firma del metodo delegato all'esecuzione della logica di valutazione a partire dai dati contenuti nel comando.

==== EvaluateDecisionNodeCommand
#figure(
  image("../uml/png/EvaluateDecisionNode/EvaluateDecisionNodeCommand.png", width: 40%),
  caption: [EvaluateDecisionNodeCommand]
)

*Descrizione*

_EvaluateDecisionNodeCommand_ è il Command Object che veicola i dati necessari alla valutazione di un nodo decisionale dal controller al service. 

*Attributi*

- `+ session_id: String` — identificativo della sessione di valutazione attiva.
- `+ device_id: String` — identificativo del dispositivo oggetto di valutazione.
- `+ asset_id: String` — identificativo dell'Asset oggetto di valutazione.
- `+ requirement_id: String` — identificativo del requisito in fase di valutazione.
- `+ node_id: String` — identificativo del nodo decisionale.
- `+ answer: Boolean` — valore della risposta fornita per il nodo decisionale.

*Metodi e funzioni*

_EvaluateDecisionNodeCommand_ non definisce metodi propri.

==== EvaluateDecisionNodeService
#figure(
  image("../uml/png/EvaluateDecisionNode/EvaluateDecisionNodeService.png", width: 60%),
  caption: [EvaluateDecisionNodeService]
)

*Descrizione*

_EvaluateDecisionNodeService_ è il service applicativo appartenente all'Application Core responsabile della logica di valutazione di un nodo decisionale. Implementa l'interfaccia _EvaluateDecisionNodeUseCase_. Recupera la sessione attiva tramite _GetEvaluationSessionPort_, individua l'Asset corrispondente all'interno del dispositivo, registra la risposta sul nodo decisionale e persiste la sessione aggiornata tramite _SaveEvaluationSessionPort_. In caso di sessione non trovata, asset non trovato o errore di salvataggio, propaga un'eccezione di tipo `EvaluateNodeFailure`.

*Attributi*

- `get_evaluation_session_port: GetEvaluationSessionPort` — outbound port usata per recuperare la sessione di valutazione.
- `save_evaluation_session_port: SaveEvaluationSessionPort` — outbound port usata per salvare le modifiche applicate alla sessione.

*Metodi e funzioni*

- `+ evaluate_node(command: EvaluateDecisionNodeCommand): void` — concretizza il contratto definito da _EvaluateDecisionNodeUseCase_. Recupera la sessione attiva, individua l'Asset nel dispositivo, registra la risposta al nodo decisionale e persiste la sessione aggiornata.
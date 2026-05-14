=== EvaluateDecisionNode <Valutazione>

#figure(
  image("../uml/png/Valutazione/EvaluateDecisionNode.png", width: 70%),
  caption: [Caso d'uso EvaluateDecisionNode]
) <fig-evaluate-decision-node>

Il diagramma illustra l'architettura del modulo dedicato alla valutazione di un nodo decisionale durante la verifica di conformità.

- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la sezione @InMemoryEvaluationSessionCache. \
- Per la definizione di _GetEvaluationSessionPort_, vedere la sezione @GetEvaluationSessionPort. \
- Per la definizione di _SaveEvaluationSessionPort_, vedere la sezione @SaveEvaluationSessionPort.

Di seguito vengono documentati esclusivamente i componenti introdotti specificamente per questo caso d'uso.

==== EvaluationDecisionNodeController
#figure(
  image("../uml/png/Valutazione/EvaluationDecisionNodeController.png", width: 40%),
  caption: [EvaluationDecisionNodeController]
)

*Descrizione*

_EvaluationDecisionNodeController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP per la valutazione di un nodo decisionale e le inoltra al livello applicativo.

*Attributi*

_EvaluationDecisionNodeController_ non definisce attributi propri.

*Metodi e funzioni*

- `+ insert_answer(req: Request): Response` — riceve la richiesta HTTP, estrae i dati dal corpo della richiesta e li inoltra al livello applicativo; restituisce una risposta HTTP con l'esito dell'operazione.

==== EvaluateDecisionNodeUseCase
#figure(
  image("../uml/png/Valutazione/EvaluateDecisionNodeUseCase.png", width: 40%),
  caption: [EvaluateDecisionNodeUseCase]
)

*Descrizione*

_EvaluateDecisionNodeUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per la valutazione di un nodo decisionale. Viene implementata da _EvaluateDecisionNodeService_ e utilizzata da _EvaluationDecisionNodeController_.

*Attributi*

_EvaluateDecisionNodeUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ evaluate_node(command: EvaluateDecisionNodeCommand): void` — firma del metodo delegato all'esecuzione della logica di valutazione a partire dai dati contenuti nel comando.

==== EvaluateDecisionNodeCommand
#figure(
  image("../uml/png/Valutazione/EvaluateDecisionNodeCommand.png", width: 30%),
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
  image("../uml/png/Valutazione/EvaluateDecisionNodeService.png", width: 50%),
  caption: [EvaluateDecisionNodeService]
)

*Descrizione*

_EvaluateDecisionNodeService_ è il service applicativo appartenente all'Application Core responsabile della logica di valutazione di un nodo decisionale. Implementa l'interfaccia _EvaluateDecisionNodeUseCase_. Recupera la sessione attiva tramite _GetEvaluationSessionPort_, individua l'Asset corrispondente all'interno del dispositivo, registra la risposta sul nodo decisionale e persiste la sessione aggiornata tramite _SaveEvaluationSessionPort_. In caso di sessione non trovata, asset non trovato o errore di salvataggio, propaga un'eccezione di tipo `EvaluateNodeFailure`.

*Attributi*

_EvaluateDecisionNodeService_ non definisce attributi propri.

*Metodi e funzioni*

- `+ evaluate_node(command: EvaluateDecisionNodeCommand): void` — concretizza il contratto definito da _EvaluateDecisionNodeUseCase_. Recupera la sessione attiva, individua l'Asset nel dispositivo, registra la risposta al nodo decisionale e persiste la sessione aggiornata.

=== GetRequirement

#figure(
  image("../uml/png/Valutazione/GetRequirement.png", width: 100%),
  caption: [Caso d'uso GetRequirement]
) <fig-get-requirement>

Il diagramma illustra l'architettura del modulo dedicato al recupero di un requisito di conformità con il relativo albero decisionale e le dipendenze associate.
- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la sezione @InMemoryEvaluationSessionCache.
- Per la definizione di _GetEvaluationSessionPort_, vedere la sezione @GetEvaluationSessionPort. \

 

 


==== QueryEvaluationRequirementsController
#figure(
  image("../uml/png/Valutazione/QueryEvaluationRequirementsController.png", width: 35%),
  caption: [QueryEvaluationRequirementsController]
)
*Descrizione*

_QueryEvaluationRequirementsController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP di recupero di un requisito di conformità e le inoltra al livello applicativo.

*Attributi*

_QueryEvaluationRequirementsController_ non definisce attributi propri.

*Metodi e funzioni*

- `+ get_requirement(req: Request): Response` — riceve la richiesta HTTP di recupero di un requisito, estrae i parametri dalla richiesta e li inoltra al livello applicativo; restituisce una risposta HTTP con i dati del requisito.



==== GetRequirementUseCase
#figure(
  image("../uml/png/Valutazione/GetRequirementUseCase.png", width: 50%),
  caption: [GetRequirementUseCase]
)
*Descrizione*

_GetRequirementUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per il recupero di un requisito di conformità. Viene implementata da _GetRequirementService_ e utilizzata da _QueryEvaluationRequirementsController_.

*Attributi*

_GetRequirementUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ get_requirement(command: GetRequirementCommand): RequirementResponse` — firma del metodo delegato al recupero del requisito corrispondente ai parametri incapsulati nel comando fornito in input.


==== GetRequirementCommand
#figure(
  image("../uml/png/Valutazione/GetRequirementCommand.png", width: 30%),
  caption: [GetRequirementCommand]
)
*Descrizione*

_GetRequirementCommand_ è l'oggetto  che veicola i parametri necessari al recupero di un requisito dal controller al service.

*Attributi*

- `+ session_id: String` — identificativo della sessione di valutazione attiva.
- `+ asset_id: String` — identificativo dell'Asset oggetto di valutazione.
- `+ requirement_id: String` — identificativo del requisito da recuperare.

*Metodi e funzioni*

_GetRequirementCommand_ non definisce metodi.



==== GetRequirementService
#figure(
  image("../uml/png/Valutazione/GetRequirementService.png", width: 70%),
  caption: [GetRequirementService]
)
*Descrizione*

_GetRequirementService_ è il service applicativo appartenente all'Application Core responsabile del recupero di un requisito di conformità. Implementa l'interfaccia _GetRequirementUseCase_, legge i parametri dal _GetRequirementCommand_, recupera la sessione attiva tramite _GetEvaluationSessionPort_ e si occupa di costruire il _RequirementResponse_ contenente i dati richiesti.

*Attributi*

_GetRequirementService_ non definisce attributi propri.

*Metodi e funzioni*

- `+ get_requirement(command: GetRequirementCommand): RequirementResponse` — concretizza il contratto definito da _GetRequirementUseCase_. Recupera la sessione attiva, individua il requisito richiesto utilizzando i parametri incapsulati nel comando e ne costruisce la relativa rappresentazione sotto forma di _RequirementResponse_.

==== RequirementResponse
#figure(
  image("../uml/png/Valutazione/RequirementResponse.png", width: 40%),
  caption: [RequirementResponse]
)
*Descrizione*

_RequirementResponse_ è il Data Transfer Object che veicola la rappresentazione completa di un requisito di conformità verso il livello di presentazione, includendo il suo stato di valutazione, l'albero decisionale associato e le dipendenze con altri requisiti.

*Attributi*

- `+ requirement_code: String` — codice identificativo del requisito.
- `+ requirement_name: String` — nome del requisito.
- `+ justification: String` — giustificazione associata al requisito.
- `+ evaluation_state: EvaluationState` — stato di valutazione del requisito.
- `+ dependency_list: List<DependencyResponse>` — lista delle dipendenze con altri requisiti.
- `+ decision_tree: DecisionTreeResponse` — albero decisionale associato al requisito.

*Metodi e funzioni*

_RequirementResponse_ non definisce metodi.



==== DecisionTreeResponse
#figure(
  image("../uml/png/Valutazione/DecisionTreeResponse.png", width: 30%),
  caption: [DecisionTreeResponse]
)
*Descrizione*

_DecisionTreeResponse_ è il Data Transfer Object che rappresenta l'albero decisionale associato a un requisito, strutturato a partire dal nodo radice.

*Attributi*

- `+ root_node: NodeResponse` — nodo radice dell'albero decisionale.

*Metodi e funzioni*

_DecisionTreeResponse_ non definisce metodi.



==== NodeResponse
#figure(
  image("../uml/png/Valutazione/NodeResponse.png", width: 30%),
  caption: [NodeResponse]
)
*Descrizione*

_NodeResponse_ è il Data Transfer Object che rappresenta un singolo nodo dell'albero decisionale, con il testo della domanda, la risposta fornita dall'utente e lo stato di valutazione associato.

*Attributi*

- `+ node_id: String` — identificativo univoco del nodo.
- `+ type: NodeType` — tipo del nodo nell'albero decisionale.
- `+ question_text: String` — testo della domanda associata al nodo.
- `+ user_answer: Boolean` — risposta fornita dall'utente per questo nodo.
- `+ evaluation_state: EvaluationState` — stato di valutazione del nodo.

*Metodi e funzioni*

_NodeResponse_ non definisce metodi.


==== DependencyResponse
#figure(
  image("../uml/png/Valutazione/DependencyResponse.png", width: 35%),
  caption: [DependencyResponse]
)
*Descrizione*

_DependencyResponse_ è il Data Transfer Object che rappresenta la dipendenza di un requisito da un altro, includendo il codice del requisito dipendente e il suo stato di valutazione.

*Attributi*

- `+ requirement_code: String` — codice del requisito da cui dipende il requisito corrente.
- `+ stato_valutazione: EvaluationState` — stato di valutazione del requisito dipendente.

*Metodi e funzioni*

_DependencyResponse_ non definisce metodi.


=== InsertJustification

#figure(
  image("../uml/png/Valutazione/InsertJustification.png", width: 100%),
  caption: [Caso d'uso InsertJustification]
) <fig-insert-justification>

Il diagramma illustra l'architettura del modulo dedicato all'inserimento di una giustificazione testuale per un requisito di conformità durante la sessione di valutazione. 
- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la sezione @InMemoryEvaluationSessionCache.
- Per la definizione di _GetEvaluationSessionPort_, vedere la sezione @GetEvaluationSessionPort. \
- Per la definizione di  _SaveEvaluationSessionPort_, vedere la sezione @SaveEvaluationSessionPort. 

Di seguito vengono documentati i componenti introdotti specificamente per questo caso d'uso.


==== EvaluationJustificationController
#figure(
  image("../uml/png/Valutazione/EvaluationJustificationController.png", width: 40%),
  caption: [EvaluationJustificationController]
)
*Descrizione*

_EvaluationJustificationController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP di inserimento di una giustificazione per un requisito e le inoltra al livello applicativo.

*Attributi*

_EvaluationJustificationController_ non definisce attributi propri.

*Metodi e funzioni*

- `+ insert_justification(req: Request): Response` — riceve la richiesta HTTP di inserimento della giustificazione, estrae i dati dal corpo della richiesta e li inoltra al livello applicativo; restituisce una risposta HTTP con l'esito dell'operazione.



==== InsertJustificationUseCase
#figure(
  image("../uml/png/Valutazione/InsertJustificationUseCase.png", width: 40%),
  caption: [InsertJustificationUseCase]
)
*Descrizione*

_InsertJustificationUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per l'inserimento di una giustificazione testuale associata a un requisito di conformità. Viene implementata da _EvaluationJustificationService_ e utilizzata da _EvaluationJustificationController_.

*Attributi*

_InsertJustificationUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ insert_justification(command: InsertJustificationCommand): void` — firma del metodo delegato all'esecuzione della logica di inserimento della giustificazione a partire dai dati contenuti nel comando.



==== InsertJustificationCommand
#figure(
  image("../uml/png/Valutazione/InsertJustificationCommand.png", width: 30%),
  caption: [InsertJustificationCommand]
)
*Descrizione*

_InsertJustificationCommand_ è il Command Object che veicola i dati necessari all'inserimento di una giustificazione dal controller al service.

*Attributi*

- `+ session_id: String` — identificativo della sessione di valutazione attiva.
- `+ asset_id: String` — identificativo dell'Asset oggetto di valutazione.
- `+ requirement_id: String` — identificativo del requisito a cui si associa la giustificazione.
- `+ node_id: String` — identificativo del nodo decisionale correlato.
- `+ justification: String` — testo della giustificazione da inserire.

*Metodi e funzioni*

_InsertJustificationCommand_ non definisce metodi.



==== EvaluationJustificationService
#figure(
  image("../uml/png/Valutazione/EvaluationJustificationService.png", width: 30%),
  caption: [EvaluationJustificationService]
)
*Descrizione*

_EvaluationJustificationService_ è il service applicativo appartenente all'Application Core responsabile della logica di inserimento di una giustificazione per un requisito di conformità. Implementa l'interfaccia _InsertJustificationUseCase_, recupera la sessione attiva tramite _GetEvaluationSessionPort_, associa la giustificazione al requisito specificato e persiste la sessione aggiornata tramite _SaveEvaluationSessionPort_.

*Attributi*

_EvaluationJustificationService_ non definisce attributi propri.

*Metodi e funzioni*

- `+ insert_justification(command: InsertJustificationCommand): void` — concretizza il contratto definito da _InsertJustificationUseCase_. Recupera la sessione attiva, individua il requisito corrispondente ai parametri incapsulati nel comando, registra la giustificazione fornita e persiste la sessione aggiornata.
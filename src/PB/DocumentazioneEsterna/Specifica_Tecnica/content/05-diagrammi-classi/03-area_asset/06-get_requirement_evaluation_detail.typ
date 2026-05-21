=== GetRequirement

#figure(
  image("../uml/png/GetRequirementEvaluationDetail/GetRequirementEvaluationDetail.png", width: 120%),
  caption: [Caso d'uso GetRequirement]
) <fig-get-requirement>

Il diagramma illustra l'architettura del modulo dedicato al recupero di un requisito di conformità con il relativo albero decisionale e le dipendenze associate.
- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la @InMemoryEvaluationSessionCache.
- Per la definizione di _GetEvaluationSessionPort_, vedere la @GetEvaluationSessionPort. \
- Per la definizione di _EvaluationEngine_, vedere la @EvaluationEngine
- Per la definizione di _RequirementEvaluationDetail_, vedere la @RequirementEvaluationDetail

 
==== FlaskRequirementEvaluationDetailController
#figure(
  image("../uml/png/GetRequirementEvaluationDetail/FlaskRequirementEvaluationDetailController.png", width: 35%),
  caption: [FlaskRequirementEvaluationDetailController]
)
*Descrizione*

_FlaskRequirementEvaluationDetailController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP di recupero di un requisito di conformità e le inoltra al livello applicativo.

*Attributi*

- `- get_requirement_ev_detail_use_case: GetRequirementEvaluationDetailUseCase` — inbound port usata per recuperare l'oggetto _RequirementEvaluationDetail_

*Metodi*

- `+ get_requirement_evaluation_detail(req: Request): Response` — endpoint GET che restituisce l'intera pagina HTML con il dettaglio completo del requisito valutato.

- `+ get_requirement_evaluation_json(req: Request): Response` — endpoint GET che restituisce il dettaglio completo della valutazione del requisito in formato JSON.

- `+ get_requirement_evaluation_state(req: Request): Response` — endpoint GET leggero che restituisce esclusivamente lo stato attuale di valutazione in formato JSON.


==== GetRequirementEvaluationDetailUseCase
#figure(
  image("../uml/png/GetRequirementEvaluationDetail/GetRequirementEvaluationDetailUseCase.png", width: 60%),
  caption: [GetRequirementEvaluationDetailUseCase]
)
*Descrizione*

_GetRequirementEvaluationDetailUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per il recupero di un requisito di conformità. Viene implementata da _GetRequirementEvaluationService_ e utilizzata da _FlaskRequirementEvaluationDetailController_.

*Attributi*

_GetRequirementEvaluationDetailUseCase_ non definisce attributi.

*Metodi*
#set par(justify: false)
- `+ get_evaluation_detail(command: GetRequirementEvaluationDetailCommand): RequirementEvaluationDetail` — firma del metodo delegato al recupero del requisito corrispondente ai parametri incapsulati nel comando fornito in input.


==== GetRequirementEvaluationDetailCommand
#figure(
  image("../uml/png/GetRequirementEvaluationDetail/GetRequirementEvaluationDetailCommand.png", width: 60%),
  caption: [GetRequirementEvaluationDetailCommand]
)
*Descrizione*

_GetRequirementEvaluationDetailCommand_ è l'oggetto  che veicola i parametri necessari al recupero di un requisito dal controller al service.

*Attributi*

- `+ requirement_id: String` — identificativo del requisito da recuperare.
- `+ asset_id: String` — identificativo dell'asset oggetto di valutazione.
- `+ device_id: String` — identificativo del dispositivo contenente l'asset.
- `+ session_id: String` — identificativo della sessione di valutazione attiva.

*Metodi*

_GetRequirementEvaluationDetailCommand_ non definisce metodi.


==== GetRequirementEvaluationDetailService
#figure(
  image("../uml/png/GetRequirementEvaluationDetail/GetRequirementEvaluationDetailService.png", width: 70%),
  caption: [GetRequirementEvaluationDetailService]
)
*Descrizione*

_GetRequirementEvaluationDetailService_ è il service applicativo appartenente all'Application Core responsabile del recupero del dettaglio di valutazione di un singolo requisito. Implementa l'interfaccia _GetRequirementEvaluationDetailUseCase_, legge i parametri dal _GetRequirementEvaluationDetailCommand_, recupera la sessione attiva tramite _GetEvaluationSessionPort_, esegue la valutazione tramite l'_EvaluationEngine_ e costruisce un _RequirementEvaluationDetail_.

*Attributi*

- `get_evaluation_session_port: GetEvaluationSessionPort`
- `evaluation_engine: EvaluationEngine`

*Metodi*
#set par(justify: false)
- `+ get_evaluation_detail(command: GetRequirementEvaluationDetailCommand): RequirementEvaluationDetail` — concretizza il contratto definito da _GetRequirementEvaluationDetailUseCase_. Recupera la sessione attiva, individua il requisito richiesto utilizzando i parametri incapsulati nel comando e ne costruisce la relativa rappresentazione sotto forma di _RequirementEvaluationDetail_.

==== DTO
Qui vengono elencati i DTO usati dal controller per gestire ed esporre i dettagli della valutazione di un requisito.
#figure(
  image("../uml/png/GetRequirementEvaluationDetail/RequirementEvaluationDTO.png", width: 70%),
  caption: [RequirementEvaluationDTO]
)

===== RequirementEvaluationDTO <RequirementEvaluationDTO>

*Descrizione*

_RequirementEvaluationDTO_ è il Data Transfer Object principale che consolida tutte le informazioni necessarie per la visualizzazione del dettaglio di un singolo requisito valutato. Raccoglie i dati anagrafici, l'esito della valutazione, lo stato delle dipendenze, la struttura dell'albero decisionale e le risposte fornite dall'utente.

*Attributi*

- `+ name: String` — nome del requisito.
- `+ norm_description: String` — descrizione normativa estesa del requisito.
- `+ target_description: String` — descrizione dell'obiettivo del requisito.
- `+ evaluation: EvaluationState` — stato corrente e complessivo della valutazione.
- `+ dependencies: List<DependencySummaryDTO>` — collezione di DTO che riepilogano lo stato dei requisiti da cui questo dipende.
- `+ decision_tree: DecisionTreeDTO` — DTO che mappa la struttura dell'albero decisionale associato al requisito.
- `+ answer: Map<String, Bool>` — mappa che associa gli ID dei nodi decisionali alle risposte fornite.
- `+ justification: String | None` — eventuale giustificazione testuale fornita durante la valutazione.

*Metodi*

_RequirementEvaluationDTO_ non definisce metodi.


===== DependencySummaryDTO <DependencySummaryDTO>

*Descrizione*

_DependencySummaryDTO_ è un Data Transfer Object leggero utilizzato per esporre esclusivamente l'identificativo e lo stato di valutazione di un requisito che funge da dipendenza.

*Attributi*

- `+ id: String` — identificativo del requisito dipendente.
- `+ evaluation: EvaluationState` — stato attuale della valutazione della dipendenza.

*Metodi*

_DependencySummaryDTO_ non definisce metodi.


===== DecisionTreeDTO <DecisionTreeDTO>

*Descrizione*

_DecisionTreeDTO_ è il DTO responsabile di incapsulare l'intera struttura dell'albero decisionale. Espone il riferimento al nodo di partenza e l'insieme di tutti i nodi che compongono l'albero, utilizzando il polimorfismo per rappresentare sia i nodi decisionali che quelli terminali.

*Attributi*

- `+ root_node_id: String` — identificativo del nodo radice da cui inizia la navigazione dell'albero.
- `+ nodes: Map<String, AnyNodeDTO>` — dizionario che associa gli identificativi univoci dei nodi ai rispettivi oggetti DTO (che possono essere istanze di _DecisionNodeDTO_ o _LeafNodeDTO_).

*Metodi*

_DecisionTreeDTO_ non definisce metodi.


===== LeafNodeDTO <LeafNodeDTO>

*Descrizione*

_LeafNodeDTO_ estende _NodeBaseDTO_ e rappresenta un nodo terminale (foglia) dell'albero decisionale. Definisce l'esito finale della valutazione per quel particolare percorso.

*Attributi*

- `+ parent_id: String | None` — identificativo del nodo genitore (ereditato).
- `+ node_type: String` — costante valorizzata a "leaf", utilizzata come discriminatore dal frontend e dai validatori per distinguere il tipo di nodo.
- `+ verdict: StandardVerdict` — verdetto di conformità finale associato alla foglia.

*Metodi*

_LeafNodeDTO_ non definisce metodi.


===== DecisionNodeDTO <DecisionNodeDTO>

*Descrizione*

_DecisionNodeDTO_ estende _NodeBaseDTO_ e rappresenta uno snodo intermedio dell'albero decisionale. Contiene la domanda da porre all'utente e i riferimenti per la navigazione in base alla risposta data.

*Attributi*

- `+ parent_id: String | None` — identificativo del nodo genitore (ereditato).
- `+ node_type: String` — costante valorizzata a "decision", utilizzata come discriminatore strutturale.
- `+ question: String` — testo della domanda posta dal nodo decisionale.
- `+ yes_child_id: String | None` — identificativo del nodo figlio da visitare nel caso la risposta sia affermativa.
- `+ no_child_id: String | None` — identificativo del nodo figlio da visitare nel caso la risposta sia negativa.

*Metodi*

_DecisionNodeDTO_ non definisce metodi.


===== NodeBaseDTO <NodeBaseDTO>

*Descrizione*

_NodeBaseDTO_ è la classe base per i DTO che rappresentano i nodi dell'albero decisionale. Fattorizza le proprietà condivise in modo trasparente da tutti i nodi (sia foglie che decisionali).

*Attributi*

- `+ parent_id: String | None` — identificativo del nodo genitore, necessario per permettere la navigazione a ritroso dell'albero da parte dell'interfaccia utente.

*Metodi*

_NodeBaseDTO_ non definisce metodi.




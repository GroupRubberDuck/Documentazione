=== ComplianceStandard <ComplianceStandard>

#figure(
  image("../uml/png/Dominio/ComplianceStandard.png", width: 70%),
  caption: [ComplianceStandard]
) <fig-compliance-standard-domain>

*Descrizione*

_ComplianceStandard_ è l'entità radice che rappresenta una norma o standard di conformità. È composta da una collezione di requisiti validati univocamente. Pur non utilizzando il costrutto `frozen=True`, la classe è progettata per essere immutabile garantendo l'integrità dei dati tramite incapsulamento.

*Attributi*

- `- id: String` — identificativo univoco dello standard.
- `- name: String` — nome descrittivo dello standard.
- `- version_number: String` — versione specifica dello standard.
- `- requirements: Tuple<Requirement>` — tupla immutabile contenente tutti i requisiti associati allo standard.

*Metodi e funzioni*

- `+ get_requirement(requirement_id: String): Requirement` — recupera uno specifico requisito tramite il suo identificativo, sollevando un'eccezione se non presente.
- `+ evaluate_requirement(requirement_id: String, answers: AssetEvidence): EvaluationState` — delega al requisito specificato la valutazione del suo stato basandosi sulle evidenze fornite.


=== Requirement <Requirement>

#figure(
  image("../uml/png/Dominio/Requirement.png", width: 70%),
  caption: [Requirement]
) <fig-requirement-domain>

*Descrizione*

_Requirement_ è un'entità immutabile che definisce un singolo requisito di conformità, includendo le sue dipendenze e l'albero decisionale per valutarlo. Applica regole di business stringenti, come il fallimento automatico se il verdetto è "Non Applicabile" (NA) ma manca la giustificazione testuale.

*Attributi*

- `- requirement_id: String` — identificativo univoco del requisito.
- `- name: String` — nome del requisito.
- `- description: String` — descrizione completa del requisito.
- `- target_description: String` — descrizione dell'obiettivo del requisito.
- `- decision_tree: DecisionTree` — albero decisionale contenente la logica per la valutazione.
- `- dependency_ids: Tuple<String>` — tupla contenente gli ID di altri requisiti da cui questo dipende.

*Metodi e funzioni*

- `+ evaluate(answer: AssetEvidence, dependency_states: Tuple): EvaluationState` — calcola lo stato di valutazione controllando prima lo stato delle dipendenze e poi interrogando l'albero decisionale.
- `- _check_dependencies(dependencies: Tuple): EvaluationState | None` — metodo privato che verifica le dipendenze: se una fallisce, blocca la valutazione in `FAIL` o `PENDING`.


=== DecisionTree <DecisionTree>

#figure(
  image("../uml/png/Dominio/DecisionTree.png", width: 60%),
  caption: [DecisionTree]
) <fig-decision-tree-domain>

*Descrizione*

_DecisionTree_ è il componente che incapsula la logica strutturata di valutazione navigando un grafo di nodi. In fase di inizializzazione convalida l'assenza di nodi duplicati e l'esistenza della radice. Durante la valutazione, traccia i nodi visitati per prevenire cicli infiniti.

*Attributi*

- `- root_id: String` — identificativo del nodo iniziale (radice) da cui parte la valutazione.
- `- nodes: Map<String, Node>` — mappa immutabile che associa gli ID dei nodi alle rispettive istanze.

*Metodi e funzioni*

- `+ evaluate(answers: Map<String, Bool>): EvaluationState` — naviga l'albero partendo dalla radice e utilizzando le risposte fornite, restituendo lo stato finale della valutazione.


=== Node <Node>

#figure(
  image("../uml/png/Dominio/Node.png", width: 30%),
  caption: [Node]
) <fig-node-domain>

*Descrizione*

_Node_ è un'interfaccia astratta (Abstract Base Class) che definisce il contratto base per tutti gli elementi che compongono un albero decisionale.

*Attributi*

- `- id: String` — proprietà astratta che restituisce l'identificativo del nodo.
- `- verdict: StandardVerdict | None` — proprietà astratta che restituisce il verdetto del nodo, se applicabile.

*Metodi e funzioni*

- `+ next(condition: Bool | None): String | None` — metodo astratto che determina l'ID del nodo successivo basandosi sulla condizione fornita.


=== DecisionNode <DecisionNode>

#figure(
  image("../uml/png/Dominio/DecisionNode.png", width: 40%),
  caption: [DecisionNode]
) <fig-decision-node-domain>

*Descrizione*

_DecisionNode_ è un Value Object immutabile che implementa _Node_. Rappresenta uno snodo dell'albero che pone una domanda e biforca il percorso di valutazione.

*Attributi*

- `- node_id: String` — identificativo del nodo.
- `- question: String` — testo della domanda posta all'utente.
- `- child_on_true_id: String` — ID del nodo successivo se la risposta è affermativa.
- `- child_on_false_id: String` — ID del nodo successivo se la risposta è negativa.

*Metodi e funzioni*

- `+ next(condition: Bool | None): String | None` — restituisce l'ID del nodo figlio appropriato a seconda del valore booleano della risposta.
- `+ verdict(): None` — restituisce costantemente `None` poiché uno snodo non produce un verdetto finale.


=== LeafNode <LeafNode>

#figure(
  image("../uml/png/Dominio/LeafNode.png", width: 50%),
  caption: [LeafNode]
) <fig-leaf-node-domain>

*Descrizione*

_LeafNode_ è un Value Object immutabile che implementa _Node_ e rappresenta la terminazione di un percorso decisionale (foglia), contenendo il risultato finale della valutazione.

*Attributi*

- `- node_id: String` — identificativo del nodo foglia.
- `- verdict_value: StandardVerdict` — il verdetto definitivo di conformità associato alla foglia.

*Metodi e funzioni*

- `+ next(condition: Bool | None): None` — restituisce costantemente `None` poiché una foglia non possiede nodi successivi.
- `+ verdict(): StandardVerdict` — restituisce il valore del verdetto di conformità.


=== StandardVerdict <StandardVerdict>

#figure(
  image("../uml/png/Dominio/StandardVerdict.png", width: 30%),
  caption: [StandardVerdict]
) <fig-standard-verdict-domain>

*Descrizione*

_StandardVerdict_ è un'enumerazione di stringhe che definisce formalmente i possibili verdetti terminali generati da un albero decisionale.

*Attributi*

- `- PASS: String` — indica che il requisito è soddisfatto ("pass").
- `- FAIL: String` — indica che il requisito non è soddisfatto ("fail").
- `- NA: String` — indica che il requisito non è applicabile al contesto ("not_applicable").

*Metodi e funzioni*

_StandardVerdict_ non definisce metodi.
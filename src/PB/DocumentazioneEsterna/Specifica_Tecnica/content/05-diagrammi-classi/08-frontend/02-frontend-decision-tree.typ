\
== Architettura Frontend: Modulo Decision Tree

Il frontend per la valutazione dei requisiti è progettato per essere reattivo e disaccoppiato. Per evitare di sovraccaricare il server a ogni interazione, una porzione della logica di dominio viene eseguita direttamente lato client, orchestrata da uno State Management centralizzato.

L'architettura si articola su quattro pilastri:

1. *Core di Valutazione (`EvaluationEngine`)*: Il client non si limita a mostrare dati passivi, ma ricalcola istantaneamente il percorso attivo dell'albero in base alle risposte dell'utente, offrendo un feedback visivo immediato tramite una struttura a oggetti polimorfica.
2. *Gestione dello Stato (`DecisionTreeStore`)*: Basato su Pinia, funge da "Single Source of Truth". Mantiene in memoria le risposte, lo stato dell'interfaccia, il nodo selezionato e delega i calcoli complessi all'`EvaluationEngine`.
3. *Interfaccia Utente (UI)*: Suddivisa in due macro-aree cooperanti. Il *Tree Canvas* disegna la topologia dell'albero delegando i calcoli geometrici al `D3LayoutEngine`, mentre la *Tree Sidebar* funge da pannello interattivo per leggere le domande e inserire le risposte, comunicando esclusivamente con lo Store.
4. *Integrazione Backend (`EvaluationApiClient`)*: Astrattizza la comunicazione HTTP con il server, assicurando che lo stato locale dell'applicazione sia costantemente sincronizzato con il database remoto in modo asincrono.

Nei paragrafi successivi verranno analizzati nel dettaglio i diagrammi delle classi dei singoli sottosistemi.

=== Architettura Interattiva della Sidebar
#figure(
  image("../uml/png/frontend/decision-node-sidebar.png", width: 80%),
  caption: [Architettura del componente TreeSidebar e del suo Store]
) <fig-frontend-sidebar-arch>
*Descrizione*

Il diagramma illustra la relazione e la separazione delle responsabilità tra l'interfaccia utente laterale (_TreeSidebar_), il gestore dello stato globale (_DecisionTreeStore_) e l'oggetto di trasferimento dati (_NodeDTO_). Il componente visivo si interfaccia esclusivamente con lo Store per leggere lo stato reattivo e invocare le azioni di aggiornamento, utilizzando il DTO in modo puramente passivo per estrarre le informazioni testuali e topologiche necessarie al rendering a schermo.

Di seguito il dettaglio dei singoli componenti coinvolti nel flusso.


==== DecisionTreeStore
#figure(
  image("../uml/png/frontend/DecisionTreeStore.png", width: 45%),
  caption: [DecisionTreeStore]
)
*Descrizione*

_DecisionTreeStore_ è il modulo basato su Pinia che funge da "Single Source of Truth" (singola fonte di verità) per il frontend. Mantiene in memoria in modo reattivo le risposte dell'utente, gestisce la visibilità della UI e accentra il punto di accesso per tutte le modifiche di stato.

*Stato Reattivo (State)*

- `+ isSideBarOpen: Boolean` — flag che determina se il pannello laterale è attualmente aperto o nascosto.
- `+ selectedNodeId: String` — l'identificativo del nodo correntemente selezionato o cliccato dall'utente.
- `+ answers: Map<String, Boolean>` — dizionario che associa l'ID di ogni nodo decisionale alla rispettiva risposta (Yes/No) fornita dall'utente.
- `+ layoutResult: LayoutResult` — struttura dati che incapsula i risultati del calcolo geometrico (nodi e archi) necessari a renderizzare l'albero.

*Metodi (Actions)*

- `+ closeSideBar()` — azione per chiudere il pannello laterale.
- `+ setAnswer(nodeId: String, answer: Boolean)` — registra o aggiorna la risposta dell'utente per un dato nodo decisionale.
- `+ selectNode(nodeId: String)` — azione per impostare un nodo come "selezionato", scatenando gli aggiornamenti reattivi sulla UI.


==== TreeSidebar
#figure(
  image("../uml/png/frontend/TreeSidebar.png", width: 40%),
  caption: [TreeSidebar]
)
*Descrizione*

_TreeSidebar_ è il componente Vue.js che implementa il pannello laterale interattivo. Il suo compito è intercettare l'input dell'utente e presentare le informazioni del nodo selezionato calcolando dinamicamente la navigazione basandosi sullo Store centrale.

*Proprietà Computate (Computed)*

- `+ currentNode: NodeDTO | null` — recupera dinamicamente le informazioni del nodo selezionato in quel momento.
- `+ currentAnswer: Boolean | undefined` — estrae dallo Store la risposta precedentemente data (se presente) per il nodo corrente.
- `+ hasNextNode: Boolean` — calcola dinamicamente se esiste un nodo successivo navigabile partendo dalla situazione corrente.

*Metodi*

- `+ submit(answer: Boolean)` — gestisce l'invio della risposta per la domanda a schermo, delegandone il salvataggio all'azione dello Store.
- `+ goPrevious()` — innesca la navigazione per tornare al nodo precedente lungo il percorso di valutazione.
- `+ goNext()` — innesca la navigazione per avanzare al nodo logico successivo all'interno del flusso.


==== NodeDTO
#figure(
  image("../uml/png/frontend/NodeDTO.png", width: 25%),
  caption: [NodeDTO]
)
*Descrizione*

_NodeDTO_ (Data Transfer Object) è una struttura dati passiva utilizzata esclusivamente per il trasferimento e la formattazione dei dati. Incapsula le informazioni "grezze" del nodo in modo che il componente visivo possa stamparle a schermo senza dover accedere alla complessa logica di dominio.

*Attributi*

- `+ id: String` — identificativo univoco del nodo.
- `+ text: String` — il contenuto testuale della domanda o dell'esito.
- `+ parentId: String | null` — riferimento all'ID del nodo padre, necessario per calcolare la navigazione a ritroso.
- `+ yesChildId: String | null` — riferimento all'ID del nodo figlio in caso di risposta affermativa.
- `+ noChildId: String | null` — riferimento all'ID del nodo figlio in caso di risposta negativa.

*Metodi*

_NodeDTO_ non espone metodi, trattandosi di un oggetto dedicato al solo trasporto dati.

=== Architettura Visiva del Canvas (Tree Canvas)
#figure(
  image("../uml/png/frontend/decision-tree-canvas.png", width: 100%),
  caption: [Architettura del componente TreeCanvas e del Layout Engine]
) <fig-frontend-canvas-arch>
*Descrizione*

Il diagramma illustra l'architettura dedicata alla renderizzazione topologica dell'albero decisionale. Per garantire prestazioni ottimali e codice pulito, il sistema separa nettamente il calcolo matematico delle coordinate visive (delegato a _D3LayoutEngine_) dal rendering effettivo a schermo (gestito dal componente _TreeCanvas_ e dai suoi sotto-componenti _UiDecisionNode_ e _UiLeafNode_).

Di seguito vengono analizzati nel dettaglio i componenti e le strutture dati che partecipano a questo flusso.


==== LayoutResult e i DTO Geometrici
#figure(
  image("../uml/png/frontend/LayoutResult.png", width: 30%),
  caption: [LayoutResult, NodeDTO ed EdgeDTO]
)
*Descrizione*

Questi Data Transfer Object (DTO) rappresentano le strutture dati arricchite con le informazioni spaziali. A differenza del NodeDTO usato dalla Sidebar, qui i nodi includono coordinate assolute per il posizionamento sulla mappa.

*Attributi*

- *NodeDTO*:
  - `+ id: String` — identificativo del nodo.
  - `+ type: NodeType` — enumerativo che distingue tra nodo decisionale (`decision`) e nodo finale (`leaf`).
  - `+ text: String` — testo da mostrare.
  - `+ resultState: String | null` — eventuale esito finale (se di tipo leaf).
  - `+ x: Float`, `+ y: Float` — coordinate cartesiane calcolate per il centro del nodo.
- *EdgeDTO*:
  - `+ id: String` — identificativo dell'arco.
  - `+ sourceId: String`, `+ targetId: String` — ID dei nodi collegati.
  - `+ startX, startY, endX, endY: Float` — coordinate esatte dei punti di inizio e fine della linea di collegamento.
- *LayoutResult*:
  - `+ nodes: List<NodeDTO>` — lista di tutti i nodi posizionati.
  - `+ edges: List<EdgeDTO>` — lista di tutti gli archi posizionati.


==== LayoutEngine e D3LayoutEngine
#figure(
  image("../uml/png/frontend/D3LayoutEngine.png", width: 50%),
  caption: [D3LayoutEngine]
)
*Descrizione*

_LayoutEngine_ è l'interfaccia che definisce il contratto per il calcolo spaziale. _D3LayoutEngine_ ne è l'implementazione concreta, che sfrutta la libreria matematica D3.js per trasformare la struttura logica e gerarchica dell'albero in coordinate cartesiane bidimensionali, evitando sovrapposizioni tra i nodi.

*Metodi*

- `+ calculateLayout(treeMap: Map<String, Node>, rootId: String): LayoutResult` — riceve la mappa logica dei nodi e restituisce il `LayoutResult` contenente nodi e archi con le coordinate X e Y calcolate.
- `- extractNodesArray(treeMap: Map): List<Node>` — metodo di utilità interno per la conversione della mappa in array.


==== TreeCanvas
#figure(
  image("../uml/png/frontend/TreeCanvas.png", width: 55%),
  caption: [TreeCanvas]
)
*Descrizione*

_TreeCanvas_ è il componente Vue.js principale per la visualizzazione dell'albero. Interroga lo Store, passa i dati al Layout Engine per il calcolo geometrico e si occupa di orchestrare il rendering dinamico di linee e nodi a schermo.

*Proprietà Computate e Stato*

- `- store: DecisionTreeStore` — riferimento allo stato globale.
- `- layoutEngine: LayoutEngine` — riferimento al motore matematico.
- `+ layoutResult: LayoutResult` — (computed) si aggiorna automaticamente se l'albero cambia, innescando un nuovo ricalcolo geometrico.
- `+ activePath: List<String>` — (computed) recupera l'elenco degli ID dei nodi correntemente attivi in base alle risposte dell'utente.

*Metodi*

- `+ resolveComponent(type: NodeDTO): Component` — determina dinamicamente quale sotto-componente Vue renderizzare (_UiDecisionNode_ o _UiLeafNode_) in base al tipo del nodo.
- `+ selectNode(nodeId: String)` — gestisce il click su un nodo della mappa, notificando lo Store.
- `+ isEdgeActive(edge: EdgeDTO): Boolean` — verifica se la linea di collegamento appartiene al percorso attivo per applicare stili di evidenziazione.
- `+ generateBezierPath(edge: EdgeDTO): String` — calcola la stringa del tracciato SVG per disegnare una curva morbida tra due nodi.


==== UiDecisionNode e UiLeafNode
#figure(
  image("../uml/png/frontend/UiDecisionNode.png", width: 25%),
  caption: [UiDecisionNode e UiLeafNode]
)
*Descrizione*

_UiDecisionNode_ e _UiLeafNode_ sono i micro-componenti visivi montati dinamicamente dal _TreeCanvas_. Si occupano unicamente di stampare a schermo l'interfaccia di un singolo nodo, applicando stili CSS differenti a seconda che il nodo sia attivo o meno, e intercettando le interazioni dell'utente.

*Proprietà (Props passate dal padre)*

- `+ id: String` — identificativo del nodo.
- `+ text: String` — testo da mostrare (domanda o esito).
- `+ isActive: Boolean` — flag iniettato dal _TreeCanvas_ per indicare se il nodo è parte del percorso selezionato.
- `+ resultState: String` — (Solo in _UiLeafNode_) indica l'esito finale della valutazione per colorare opportunamente il nodo (es. verde/rosso).

*Eventi (Signals)*

- `+ onClick()` — (Solo in _UiDecisionNode_) emesso quando l'utente fa click sulla forma geometrica del nodo, catturato dal _TreeCanvas_.

=== Core di Valutazione (Domain Logic Client-side)
#figure(
  image("../uml/png/frontend/EvaluationEngineDomain.png", width: 100%),
  caption: [Diagramma delle classi del Motore di Valutazione]
) <fig-frontend-domain-logic>
*Descrizione*

Il "Cervello" del modulo frontend risiede in una gerarchia di classi che implementano la logica di navigazione dell'albero decisionale direttamente nel browser. Questo approccio permette di ricalcolare il percorso di valutazione istantaneamente a ogni clic dell'utente, senza richiedere l'intervento del server. Il sistema utilizza il polimorfismo per distinguere il comportamento tra nodi di domanda e nodi di esito.




==== Interfaccia Node
#figure(
  image("../uml/png/frontend/NodeInterface.png", width: 30%),
  caption: [Interfaccia Node]
)
*Descrizione*

_Node_ è l'interfaccia (o contratto) base che definisce il comportamento comune a tutti i tipi di nodi presenti nell'albero. Garantisce che ogni nodo, indipendentemente dalla sua natura, possa fornire i propri dati di rendering e gestire la navigazione.

*Metodi*

- `+ getRenderData(): NodeDTO` — restituisce i dati necessari al componente visivo per mostrare il nodo.
- `+ getNext(answer: Boolean): String | null` — calcola l'ID del nodo successivo in base alla risposta ricevuta.
- `+ getPrevious(): String | null` — restituisce l'ID del nodo genitore per permettere la navigazione a ritroso.


==== DecisionNode
#figure(
  image("../uml/png/frontend/DecisionNode.png", width: 35%),
  caption: [DecisionNode]
)
*Descrizione*

_DecisionNode_ è la classe che implementa un nodo intermedio (domanda). Contiene la logica decisionale binaria (Sì/No) per determinare quale ramo dell'albero debba essere percorso.

*Attributi*

- `- id, - question: String` — identificativo e testo della domanda.
- `- parentId: String | null` — riferimento al nodo precedente.
- `- yesChildId, - noChildId: String` — riferimenti ai due possibili nodi successivi.

*Metodi*

- `+ getNext(answer: Boolean)` — implementazione concreta che restituisce `yesChildId` se la risposta è `true`, altrimenti `noChildId`.


==== LeafNode
#figure(
  image("../uml/png/frontend/LeafNode.png", width: 30%),
  caption: [LeafNode]
)
*Descrizione*

_LeafNode_ rappresenta il punto terminale di un ramo dell'albero (foglia). Non permette ulteriori avanzamenti e contiene lo stato finale della valutazione per quel determinato percorso.

*Attributi*

- `- result: evaluationStateType` — definisce l'esito finale (es. "Conforme", "Non Conforme").

*Metodi*

- `+ getNext(answer: Boolean)` — restituisce sempre `null`, segnando la fine del percorso.


==== TreeStructure
#figure(
  image("../uml/png/frontend/TreeStructure.png", width: 30%),
  caption: [TreeStructure]
)
*Descrizione*

_TreeStructure_ funge da contenitore organizzato per l'intero albero decisionale. Al fine di massimizzare le prestazioni di ricerca lato client, utilizza una rappresentazione "piatta" basata su una mappa anziché una struttura nidificata.

*Attributi*

- `- nodes: Map<String, Node>` — mappa che indicizza tutti i nodi tramite il loro ID univoco per un accesso immediato ($O(1)$).

*Metodi*

- `+ getNode(id: String): Node | null` — recupera l'oggetto nodo corrispondente all'ID fornito.
- `+ getRootId(): String` — restituisce l'ID del punto di partenza della valutazione.


==== EvaluationEngine
#figure(
  image("../uml/png/frontend/EvaluationEngine.png", width: 50%),
  caption: [EvaluationEngine]
)
*Descrizione*

_EvaluationEngine_ è il motore logico principale che orchestra la valutazione. È il componente che traduce la massa di risposte dell'utente in un percorso visivo coerente e navigabile.

*Attributi*

- `- tree: TreeStructure` — la struttura dell'albero su cui operare.

*Metodi*

- `+ getEvaluationPath(answers: Map<String, Boolean>): List<String>` — incrocia la mappa delle risposte fornite dall'utente con la struttura dell'albero per generare la lista ordinata di ID che compongono l'attuale "Percorso Attivo" (Active Path).
- `+ getNodeRenderData(nodeId: String): NodeDTO` — metodo di utilità per ottenere i dati grafici di un nodo specifico tramite il motore.

=== DecisionTreeStore <decision-tree-store>
#figure(
  image("../uml/png/frontend/store.png", width: 35%),
  caption: [Dettaglio del DecisionTreeStore (Pinia)]
)
*Descrizione*

_DecisionTreeStore_ rappresenta il cuore reattivo dell'applicazione. È lo Store globale che permette la comunicazione disaccoppiata tra i vari componenti Vue (Canvas e Sidebar). Invece di passare dati tramite "props" e "events" complessi, i componenti leggono e scrivono direttamente in questo store, che si occupa di mantenere la coerenza dei dati.

*Attributi (State)*

- `- evaluationEngine: EvaluationEngine` — istanza del motore logico utilizzata per i calcoli di navigazione.
- `- answers: ref<Map<String, Boolean>>` — stato reattivo delle risposte fornite dall'utente durante la sessione corrente.
- `- selectedNodeId: String` — identifica il nodo su cui l'utente sta interagendo o che ha cliccato nel Canvas.
- `- activePath: ref<List<String>>` — lista reattiva degli ID dei nodi che compongono il percorso corrente, aggiornata automaticamente al variare delle risposte.
- `- apiClient: ApiClient` — riferimento al client per le chiamate verso le API del backend.

*Metodi (Actions)*

- `+ init(data, savedAnswers)` — inizializza lo store caricando la struttura dell'albero e le eventuali risposte già salvate nel database.
- `+ setAnswer(nodeId, answer)` — aggiorna una risposta nello stato locale, invoca il ricalcolo del percorso e avvia la persistenza asincrona tramite l'API.
- `+ selectNode(nodeId)` — aggiorna il nodo selezionato, permettendo alla Sidebar di mostrare le informazioni contestuali corrette.
- `- refreshPath()` — metodo privato invocato internamente per aggiornare l'attributo `activePath` interpellando l'_EvaluationEngine_.

=== EvaluationApiClient <evaluation-api-client>
#figure(
  image("../uml/png/frontend/api-client.png", width: 80%),
  caption: [Dettaglio dell'EvaluationApiClient]
)
*Descrizione*

_EvaluationApiClient_ è l'Outbound Adapter del frontend. Questa classe incapsula tutta la logica di comunicazione HTTP, isolando il resto dell'applicazione (Store e Componenti) dai dettagli implementativi delle chiamate API. Utilizza il pattern delle _Promise_ per gestire l'asincronia tipica delle richieste di rete.

*Attributi*

- `- baseUrl: String` — l'indirizzo radice del server API.

*Metodi*

- `+ saveAnswer(answer, device_id, asset_id, requirement_id, node_id): Promise<JSON>` — invia una richiesta asincrona al server per salvare la risposta fornita a un determinato nodo dell'albero. Riceve tutti i parametri di contesto necessari (dispositivo, asset e requisito) per garantire la corretta associazione dei dati nel database.
- `+ fetchRequirementEvaluationState(device_id, asset_id, requirement_id): Promise<JSON>` — recupera dal backend lo stato attuale della valutazione per un determinato requisito. Questo metodo è fondamentale durante la fase di inizializzazione per ripristinare il "Percorso Attivo" basandosi sui dati salvati in precedenza.
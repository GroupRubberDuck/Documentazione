\
== Architettura Frontend: Modulo Decision Tree

Per via della differenza di complessità tra i widget semplici e l'albero di decisione interattivo, abbiamo ritenuto opportuno dedicare a quest'ultimo una sezione apposita.

Il frontend per la valutazione dei requisiti è progettato per essere reattivo e disaccoppiato. 
Per evitare di sovraccaricare il server a ogni interazione e permettere un'esperienza più fluida, una porzione della logica di dominio viene eseguita direttamente lato client,  tale logica si limita unicamente alla navigazione e alla presentazione grafica dell'albero  di decisione. Lo riteniamo accettabile perché il sistema backend fornisce dati  grezzi e il sistema frontend li organizza in un'interfaccia comprensibile all'utente.

L'architettura si articola su quattro pilastri:

+ *Core di Valutazione (`EvaluationEngine`)*: Il widget del sistema frontend calcola il percorso attivo dell'albero in base alle risposte dell'utente, offrendo un feedback visivo.
+ *Gestione dello Stato (`DecisionTreeStore`)*: Basato su Pinia, funge da "Single Source of Truth" o Model del MVVM. \ Contiene le logiche di business, salva i dati ed effettua le chiamate API, tramite l'API client.
+ *Interfaccia Utente*: Suddivisa in due macro-aree cooperanti. Il *Tree Canvas* disegna la topologia dell'albero delegando i calcoli geometrici al `D3LayoutEngine`, mentre la *Tree Sidebar* funge da pannello interattivo per leggere le domande e inserire le risposte, realizza la parte di View del MVVM.
+ *Integrazione Backend (`EvaluationApiClient`)*: Incapsula la comunicazione con il server.

Nei paragrafi successivi verranno analizzati nel dettaglio i diagrammi delle classi dei singoli sottosistemi.
=== Logica di valutazione

#figure(caption:"Logica di valutazione")[
#image("/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/LogicaDiValutazione.png",)
]

Non esegue logica di business di competenza del backend, effettua i calcoli necessari a mostrare l'albero e il percorso attivo da mostrare.

==== TreeStructure
#figure(
  image("../uml/png/frontend/TreeStructure.png",),
  caption: [TreeStructure]
)
*Descrizione*

_TreeStructure_ funge da contenitore organizzato per l'intero albero decisionale. Al fine di massimizzare le prestazioni di ricerca lato client, utilizza una rappresentazione "piatta" basata su una mappa anziché una struttura nidificata.

*Attributi*

- `- nodes: Map<String, Node>` — Mappa che indicizza tutti i nodi tramite il loro ID univoco per un accesso immediato ($O(1)$).
- `- rootId:String` — Id del nodo root.

*Metodi*

- `+ getNode(NodeId: String): Node` — Recupera l'oggetto nodo corrispondente all'ID fornito.
- `+ getRootId(): String` — Restituisce l'ID del punto di partenza della valutazione.
- `+ getAllNodes(): Map<String, Node>` — Restituisce tutti i nodi del decision tree.
- `+ TreeStructure(rootId:String,nodes:Map<String, Node>)` — Costruttore

==== Node
#figure(caption:"Node")[
  #image("/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/Node.drawio.png")
]

*Descrizione*:

Rappresenta il contratto che deve implementare un nodo dell'albero di decisione.


*Attributi*:

#upper("è") un'interfaccia, non ha attributi.

*Metodi*:

- `+ getRenderData():NodeDTO` — Recupera i dati del nodo per poterli mostrare a schermo.
- `+ getNext(answer:Boolean):String` — Recupera l'id del nodo successore.
- `+ getPrevious():String` — Recupera l'id del nodo padre.



==== DecisionNode
#figure(
  image("../uml/png/frontend/DecisionNode.png"),
  caption: [DecisionNode]
)
*Descrizione*

_DecisionNode_ è la classe che implementa un nodo intermedio (domanda). Contiene la logica decisionale binaria (Sì/No) per determinare quale ramo dell'albero debba essere percorso.

*Attributi*

- `- id, - question: String` — Identificativo e testo della domanda.
- `- text: String` — Testo della domanda associata al nodo.
- `- parentId: String | null` — Riferimento al nodo precedente.
- `- yesChildId: String|null` — Riferimento al nodo figlio associato alla risposta "Sì"
- `- noChildId: String|null` — Riferimento al nodo figlio associato alla risposta "No"

*Metodi*

- `+ DecisionNode( id:String, text:String ,parentId:String|null,yesChild:String,noChild:String)` — Costruttore.
- `+ getRenderData():NodeDTO` — Recupera i dati del nodo per poterli mostrare a schermo.
- `+ getNext(answer:Boolean):String` — Recupera l'id del nodo successore.
- `+ getPrevious():String` — Recupera l'id del nodo padre.



==== LeafNode
#figure(
  image("../uml/png/frontend/LeafNode.png"),
  caption: [LeafNode]
)
*Descrizione*

_LeafNode_ rappresenta il punto terminale di un ramo dell'albero (foglia). Non permette ulteriori avanzamenti e contiene lo stato finale della valutazione per quel determinato percorso.

*Attributi*

- `- parentId` — Id del nodo padre. 
- `- result: evaluationStateType` — definisce l'esito finale (es. "Conforme", "Non Conforme").

*Metodi*

- `+LeafNode(id:String, result:LeafNodeValue, parentId:String)` — Costruttore.
- `+ getRenderData():NodeDTO` — Recupera i dati del nodo per poterli mostrare a schermo.
- `+ getNext(answer:Boolean):String` — Recupera l'id del nodo successore.
- `+ getPrevious():String` — Recupera l'id del nodo padre.

==== NodeDTO
#figure(
  image("../uml/png/frontend/NodeDTO.png", width: 25%),
  caption: [NodeDTO]
)
*Descrizione*

_NodeDTO_  è una struttura dati passiva utilizzata esclusivamente per il trasferimento e la formattazione dei dati. Incapsula le informazioni "grezze" del nodo in modo che il componente visivo possa stamparle a schermo senza dover accedere alla complessa logica di dominio.

*Attributi*

- `+ id: String` — Identificativo univoco del nodo.
- `+ type: NodeType` — Tipo del nodo (Decisione o Foglia). 
- `+ text: String` — il contenuto testuale della domanda o dell'esito da mostrare.
- `+ parentId: String | null` — riferimento all'ID del nodo padre, necessario per calcolare la navigazione a ritroso.
- `+ yesChildId: String | null` — riferimento all'ID del nodo figlio in caso di risposta affermativa.
- `+ noChildId: String | null` — riferimento all'ID del nodo figlio in caso di risposta negativa.

*Metodi*

_NodeDTO_ non espone metodi, trattandosi di un oggetto dedicato al solo trasporto dati.
==== NodeType
#figure(
  image("/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/NodeType.png", width: 25%),
  caption: [NodeType]
)
*Descrizione*

_NodeType_ è un enum che serve a distinguere i nodi di decisione e i nodi foglia quando questi vengono trasformati in strutture dati pure. 

*Attributi*

- `DecisionNode` — Elemento dell'enum che identifica un nodo di decisione. 
- `LeafNode` — Elemento dell'enum che identifica un nodo foglia.  

*Metodi*

Questo enum non espone metodi

==== LeafNodeValue
#figure(
caption: "Leaf Node Value")[
#image("/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/LeafNodeValue.png")
] 
*Descrizione*

LeafNodeValue è un enum che raccoglie i possibili valori di un nodo foglia. 

*Attributi*

- `Pass` — Elemento dell'enum che identifica un nodo foglia pass. 
- `Fail` — Elemento dell'enum che identifica un nodo foglia fail. 
- `NotApplicable` — Elemento dell'enum che identifica un nodo foglia not applicable. 
  

*Metodi*

Questo enum non espone metodi


==== EvaluationEngine
#figure(
  image("../uml/png/frontend/EvaluationEngine.png", width: 50%),
  caption: [EvaluationEngine]
)
*Descrizione*

_EvaluationEngine_ è il motore logico principale che calcola il percorso attivo.
Traduce le risposte dell'utente in un percorso visivo coerente e navigabile.

*Attributi*

- `- tree: TreeStructure` — la struttura dell'albero su cui operare.

*Metodi*

- `+ EvaluationEngine(tree: TreeStructure)` — Costruttore.
- `+ getEvaluationPath(answers: Map<String, Boolean>): List<String>` — incrocia la mappa delle risposte fornite dall'utente con la struttura dell'albero per generare la lista ordinata di ID che compongono l'attuale "Percorso Attivo" (Active Path).
- `+ getNodeRenderData(nodeId: String): NodeDTO` — metodo di utilità per ottenere i dati grafici di un nodo specifico tramite il motore.
- `+ getTree()` — metodo di utilità per recuperare la struttura del decision tree.





=== APIClient


=== EvaluationApiClient <evaluation-api-client>
#figure(
  image("/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/EvaluationAPIClient.png", width: 80%),
  caption: [Dettaglio dell'EvaluationApiClient]
)
*Descrizione*

_EvaluationApiClient_ è l'Outbound Adapter del frontend. Questa classe incapsula tutta la logica di comunicazione HTTP, isolando il resto dell'applicazione (Store e Componenti) dai dettagli implementativi delle chiamate API. Utilizza il pattern delle _Promise_ per gestire l'asincronia tipica delle richieste di rete.

*Attributi*

- `- answerUrl: String` — Url presso cui effettuare la chiamata API per salvare una risposta.
- `- stateUrl: String` — Url presso cui effettuare la chiamata API per recuperare solo lo stato di valutazione del requisito.
- `- justificationUrl: String` — Url presso cui effettuare la chiamata API per inserire una giustificazione da associare al requisito.
- `- detailUrl: String` — Url presso cui effettuare la chiamata API per recuperare tutti i dati relativi alla valutazione del requisito.
 

*Metodi*
- `+EvaluationAPIClient(answerUrl: String,stateUrl: String,justificationUrl: String,detailUrl: String)` — Costruttore che riceve dall'esterno gli url a cui effettuare le chiamate API, gli url contengono anche il contesto della valutazione (dispositivo,asset,requisito). 
- `+ saveAnswer( node_id:String, answer:Boolean): Promise<JSON>` — invia una richiesta asincrona al server per salvare la risposta fornita a un determinato nodo dell'albero. Riceve tutti i parametri di contesto necessari (dispositivo, asset e requisito) per garantire la corretta associazione dei dati nel database.
- `+ saveJustification(justification:String)` — invia una richiesta asincrona al server per salvare la giustificazione fornita al requisito.
- `+ fetchRequirementEvaluationState(): Promise<JSON>` — recupera dal backend lo stato attuale della valutazione per un determinato requisito. Recupera solo lo stato della valutazione.
- `+ fetchRequirementEvaluationDetail(): Promise<JSON>` — recupera dal backend lo stato attuale della valutazione per un determinato requisito, utile in caso serva effettuare un reset.

=== Layout

#figure(caption:"LayoutEngineComplessivo")[
  #image("/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/LayoutEngineComplessivo.png")
]

Incapsula i calcoli necessari a mostrare correttamente a schermo il decision tree. 

==== LayoutNodeDTO
#figure(caption:"LayoutNodeDTO")[
  #image("/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/LayotNodeDTO.png")
]
*Descrizione*:
Incapsula tutti i dati necessari al rendering grafico.

*Attributi*:
- `+ id:String` — Id del nodo.
- `+ type:NodeType` — Tipo di nodo.
- `+ text:String` — Testo descrittivo del nodo .
- `+ resultState:LeafNodeValue|null` — Se è un nodo foglia, è il valore di quel nodo.
- `+ x:Number` — Coordinata x del nodo.
- `+ y:Number` — Coordinata y del nodo.


*Metodi*:

Non espone metodi




==== EdgeDTO
#figure(caption:"EdgeDTO")[
  #image("/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/EdgeDTO.png")
]
*Descrizione*:

Incapsula i dati necessari al rendering degli archi che connettono i nodi


*Attributi*:
- `+id:String` — Id dell'arco .
- `+sourceId:String` — Id del nodo da cui origina l'arco.
- `+targetId:String` — Id del nodo in cui termina l'arco.
- `+startX:Number` — Coordinata X da cui far partire gli arco.
- `+startY:Number` — Coordinata Y da cui far partire gli arco.
- `+endX:Number` — Coordinata X in cui far terminare l'arco.
- `+endY:Number` — Coordinata Y in cui far terminare l'arco.
- `+label:String` — Testo da mostrare sull'arco .


*Metodi*:

Non espone metodi.  

==== HierarchyNode

#figure(caption:"HierarchyNode")[
  #image("/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/HierarchyNode.png")
]
*Descrizione*:

Struttura dati ricorsiva utilizzata internamente dal D3LayoutEngine come formato intermedio per alimentare d3.hierarchy(). Estende i dati del NodeDTO con i campi children (riferimenti ricorsivi ai nodi figli) e edgeLabel (etichetta dell'arco, "Yes" o "No"). Questa struttura non esce dal layout engine — viene costruita da  e consumata da d3 per calcolare le posizioni, dopodiché viene scartata.

*Attributi*:
- `+ id : String` — identificativo univoco del nodo, corrisponde all'id del nodo di dominio.
- `+ type : NodeType` — tipo del nodo.
- `+ text : String` — testo da visualizzare, la domanda per i nodi decisione o il verdetto per i nodi foglia.
- `+ resultState : String` — stato di valutazione per i nodi foglia (pass, fail, not_applicable), null per i nodi decisione.
- `+ parentId : String` — identificativo del nodo genitore, null per la radice.
- `+ yesChildId : String` — identificativo del figlio raggiunto con risposta affermativa, null per i nodi foglia.
- `+ noChildId : String` — identificativo del figlio raggiunto con risposta negativa, null per i nodi foglia.
- `+ _edgeLabel : String` — etichetta dell'arco che collega questo nodo al suo genitore ("Yes" o "No"). Il prefisso underscore indica una proprietà ausiliaria aggiunta durante la costruzione della gerarchia, non presente nei dati di dominio originali.
- `+ children : HierarchyNode[]` — array ricorsivo dei nodi figli nel formato atteso da d3.hierarchy(). Null o assente per i nodi foglia.

*Metodi*:

Non espone metodi
==== LayoutConfig

#figure(caption:"LayoutConfig")[
#image("/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/LayoutConfig.png")
]
*Descrizione*:

Incapsula le configurazioni base per il layout

*Attributi*:
- `+width:Number` — larghezza complessiva a cui il layout si deve adattare.
- `+height:Number` — Altezza complessiva a cui il layout si deve adattare. 
- `+nodeWidth:Number` — Larghezza dei nodi.
- `+nodeHeight:Number` — Altezza massima dei nodi.


*Metodi*:

Non espone metodi
==== LayoutResult

#figure(caption:"LayoutResult")[
  #image("/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/LayoutResult.png")
]
*Descrizione*:

Racchiude tutte le informazioni necessarie a mostrare i nodi.

*Attributi*:
- `+ nodes:LayoutNodeDTO[]` — Elenco dei nodi da mostrare a schermo.  
- `+ edges:EdgeDTO[]` — Elenco degli archi da mostrare a schermo.  


*Metodi*:

Non espone metodi.
==== D3LayoutEngine

#figure(caption:"D3LayoutEngine")[
  #image("/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/D3LayoutEngine.png")
]
*Descrizione*:

Incapsula i calcoli e le altre operazioni relative alla costruzione del layout.

*Attributi*:

    - `- config: LayoutConfig` — Impostazioni base per personalizzare il layout.

*Metodi*:
    - `+ D3LayoutEngine(config: LayoutConfig)` — Costruttore
    - `+ calculateLayout(treeMap: Map, rootId: string): LayoutResult` — Calcola il layout partendo dalla struttura del decision tree.
    - `- buildHierarchy(treeMap: Map, nodeId: string): HierarchyNode | null` — Funzione interna per il calcolo del hierarchy.
    - `- extractNodes(root: HierarchyNode): LayoutNodeDTO[]` — Funzione di utilità che trasforma il formato di D3 in un formato di dominio.
    - `- extractEdges(root: HierarchyNode): EdgeDTO[]` — Funzione di utilità che trasforma il formato di D3 in un formato di dominio.


=== Store

#figure(
  caption: [DecisionTreeComplessivo]
)[
  #image("/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/DecisionTreeComplessivo.png")
]


==== DecisionTreeStore <decision-tree-store>
#figure(
  caption: [DecisionTreeStore]
)[
  #image("/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/05-diagrammi-classi/uml/png/frontend/DecisionTreeStore.png")
]
*Descrizione*

_DecisionTreeStore_ rappresenta il cuore reattivo dell'applicazione. È lo Store che permette la comunicazione disaccoppiata tra i vari componenti Vue (Canvas e Sidebar). Invece di passare dati tramite "props" e "events" complessi, i componenti leggono e scrivono direttamente in questo store, che si occupa di mantenere la coerenza dei dati.

Diversi requisiti non condividono lo stesso store.

Funge da model del MVVM.

*Attributi (State)*

- `- evaluationEngine: EvaluationEngine` — Istanza del motore logico utilizzata per i calcoli di navigazione.
- `- apiClient:EvaluationAPIClient ` — Istanza dell'API client per effettuare le chiamate col backend.
- `+ answers: Map<String, Boolean>` — Stato reattivo delle risposte fornite dall'utente durante la sessione corrente.
- `+ selectedNodeId:String|null`— Id del nodo selezionato al momento.
- `+ activePath: String[]` — Lista reattiva degli ID dei nodi che compongono il percorso corrente, aggiornata automaticamente al variare delle risposte.
- `+ evaluationState:LeafNodeValue` — oggetto reattivo che rappresenta lo stato della valutazione.
- `+ justification:String` — Giustificazione per il requisito sottoposto a valutazione.
- `+ justificationStatus:String` — Stato del salvataggio della giustificazione da mostrare all'utente
- `+ requirementsUrl:String` — Url della lista requisiti. 
- `+ selectedNodeData:NodeDTO` — Oggetto reattivo che tiene traccia dei dati del nodo selezionato.
- `+ treeMap:Map<String,Node>` — Mantiene l'elenco dei nodi in memoria e facilmente accessibile.
- `+ rootId` — Root dell'albero decisionale.


*Metodi (Actions)*

- `- refreshPath()` — metodo privato invocato internamente per aggiornare l'attributo `activePath` interpellando l'_EvaluationEngine_.
- `+ init(treeData:TreeStructure, savedAnswers:Map<String,Boolean>,justification:String,apiClient:EvaluationAPIClient,requirementsUrl:String)
` — inizializza lo store caricando la struttura dell'albero e le eventuali risposte già salvate, la giustificazione, lo stato della valutazione, l'api client e l'url della lista dei requisiti per il inserirlo in un link.
- `+ setAnswer(nodeId, answer)` — aggiorna una risposta nello stato locale, invoca il ricalcolo del percorso e avvia la persistenza asincrona tramite l'API.
- `+ selectNode(nodeId)` — aggiorna il nodo selezionato, permettendo alla Sidebar di mostrare le informazioni contestuali corrette.
- `+ clearSelection() ` — aggiorna lo stato interno per togliere il focus dal nodo corrente.
- `+ saveJustification(text:String) ` — Salva la giustificazione inserita tramite il backend. 



=== Componenti
#figure(
  image("../uml/png/frontend/RequirementEvaluationWidgetAltoLivello.png", ),
  caption: [RequirementEvaluationWidget]
)

Questo widget realizza il MVVM, lo store rappresenta il model, il RequirementEvaluationWidget mantiene un riferimento allo store.

Come convenzione di Vue il componente è diviso in 2 parti script(ViewModel) e template (View). La reattività è realizzata usando le funzionalità di vue.

==== RequirementEvaluationWidget
#figure(
  image("../uml/png/frontend/RequirementEvaluationWidget.png", ),
  caption: [RequirementEvaluationWidget Dettaglio]
)

*Descrizione*

Rappresenta il widget per la valutazione el requisito, funge da ViewModel e monta la View realizza il binding tra il model e i componenti visivi(view).
Le responsabilità all'interno del componente sono separate come da convenzione di Vue (tag \<script> per la parte di ViewModel e tag \<template> per la parte di view).

*Attributi*:
  - `- store : DecisionTreeStore` — Riferimento allo store Pinia, unico punto di accesso allo stato.
  - `- layoutEngine: D3LayoutEngine` — Layout engine usato per calcolare la disposizione di archi e nodi sullo schermo.
  - `- decisionTreeWidget : DecisionTreeWidget` —  Componente che contiene il canvas dell'albero.
  - `- treeSidebar : TreeSidebar`   —  Pannello laterale per l'interazione con i nodi.
  - `- evaluationBadge : EvaluationBadge`   — Badge che mostra lo stato corrente della valutazione.
  - `- justificationForm : JustificationForm`   —  Form per l'inserimento della giustificazione.
  - `- isSidebarOpen:Boolean`   —  Flag che mantiene lo stato della iu e visualizzazione della sidebar per la visualizzazione del nodo.
  - `- layoutResult:LayoutResult`   —  Mantiene il layout che il decision tree deve rispettare.
  - `- currentAnswer:Boolean|null`  —  Mantiene la risposta associata al nodo corrente, elabora i dati del modello e li espone in un formato facilmente leggibile dalla View.
  - `- hasNextNode:Boolean` — Indica se un nodo ha un successore nel path attivo, espone questa informazione in un formato facilmente leggibile dalla View.  
  - `- hasPrevious:Boolean`   —  Indica se un nodo ha un predecessore, espone questa informazione in un formato facilmente leggibile dalla View.

*Metodi*
  - `+ RequirementEvaluationWidget(treeData:TreeStructure, savedAnswers:Map<String,Boolean>,evaluationState:EvaluationResult,justification:String,answerUrl:String,stateUrl:String,justificationUrl:String,detailUrl:String,requirementsUrl:String)`—   costruttore. Riceve i dati dal livello di integrazione, crea l'API client e inizializza lo store.
  - `- handleNodeSelect(nodeId : String)` — Handler che riceve l'emit dal canvas e chiama store.
  - `- handleSidebarClose()` — Handler che riceve l'emit dalla sidebar e chiama store.
  - `- handleSidebarSubmit(answer : Boolean)` — Handler che riceve l'emit dalla sidebar e chiama store.
  - `- handleSidebarPrevious() ` —  Handler che recupera il nodo precedente nel path attivo chiamando lo store.
  - `- handleSidebarNext() ` —  Handler che recupera il nodo successivo nel path attivo chiamando lo store.
  - `- handleJustificationSave(text : String)` — Handler che chiama lo store per salvare la nuova giustificazione.




==== TreeSidebar
#figure(
  image("../uml/png/frontend/TreeSideBar.png", ),
  caption: [TreeSidebar]
)
*Descrizione*

_TreeSidebar_ è il componente Vue che implementa il pannello laterale interattivo. Il suo compito è intercettare l'input dell'utente e presentare le informazioni del nodo selezionato.
Comunica con l'esterno tramite gli emit.

*Attributi*:

- `- isOpen:Boolean` — Flag che gestisce la visualizzazione della sidebar, il riferimento viene passato alla costruzione.
- `- currentNode: NodeDTO | null` — Oggetto reattivo che racchiude le informazioni da mostrare, viene aggiornato al cambiamento del nodo selezionato, la side bar rileva questo cambiamento e si aggiorna di conseguenza.
- `- currentAnswer: Boolean` — La risposta per il nodo corrente, se presente.
- `- hasPrevious:Boolean` — Indica se il nodo corrente ha un predecessore.
- `- hasNext:Boolean` — Indica se il nodo corrente ha un successore.
- `- requirementsUrl` — Url della lista requisiti.

*Metodi*
- `+ TreeSidebar(currentNode : NodeDTO, currentAnswer : Boolean, hasPrevious : Boolean, hasNext : Boolean, requirementsUrl : String)` — Costruttore che riceve gli oggetti reattivi per costruire il widget.
 
- `+ submit(answer: Boolean)<<emit>>` — gestisce l'invio della risposta.
- `+ goPrevious()<<emit>>` — innesca la navigazione per tornare al nodo precedente lungo il percorso di valutazione.
- `+ goNext()<<emit>>` — innesca la navigazione per avanzare al nodo logico successivo all'interno del flusso.
- `+ close()<<emit>>` — Chiude la sidebar.
- `- formatResult(state:String)` — Incapsula la conversione del risultato della valutazione in testo ed eventuali label comprensibili all'utente.

==== DecisionTreeWidget

#figure(caption:"DecisionTreeWidget")[
  #image("../uml/png/frontend/DecisionTreeWidget.png", )
]
*Descrizione*:

Wrapper del decision tree canvas.



*Attributi*:

- `- treeCanvas:TreeCanvas` — Canvas su cui disegnare il decision tree.



*Metodi*:
- `+ DecisionTreeWidget(nodes : LayoutNodeDTO[], edges : EdgeDTO[], activePath : String[])` — Costruttore che riceve i dati reattivi  da osservare dall'esterno e li passa alla canvas.
- `+ selectNode(nodeId:String)<<emit>>` —   Ritrasmette l'evento emesso dalla canvas.





==== TreeCanvas
#figure(
  image("../uml/png/frontend/TreeCanvasComplessivo.png", ),
  caption: [TreeCanvas]
)



*Descrizione*:

Rappresenta la canvas su cui viene disegnato l'albero di decisione.
Riceve gli oggetti reattivi da osservare alla costruzione, comunica con l'esterno tramite emit.


*Attributi*:
- `- viewBox:ViewBox` —  ViewBox in cui disegnare l'albero.
- `- isPanning:Boolean` — Flag che aiuta a distinguere un click su un nodo da un click sullo sfondo.
- `- panStart:Point` —  Punto di origine per disegnare il decision tree 
- `- PADDING:Number` — Costante che incapsula il padding dell'svg, semplifica le configurazioni. 
- `- NODE_HALF_WIDTH:Number` — Costante che incapsula la larghezza dei nodi, semplifica le configurazioni.  
- `- NODE_MAX_HALF_HEIGHT:Number` —  Costante che incapsula l'altezza massima di un nodo del decision tree.
- `- decisionNodes:UiDecisionNode[]` — Lista dei dati relativi ai componenti che rappresentano i nodi di decisione.  
- `- leafNodes:UiDecisionNode[]` — Lista dei dati relativi ai componenti che rappresentano i nodi foglia.
- `- activePath:String[]` — Lista dei nodi attivi. 
- `- viewBox:String` — Stringa da passare con attributo del tag html.



*Metodi*:
- `+ TreeCanvas(nodes:LayoutNodeDTO[],edges:EdgeDTO[],activePath:String[])` —  Costruttore che riceve i dati reattivi dall'esterno.
- `- onPointerDown(event:PointerEvent)` —   Callback da eseguire in caso di evento pointerDown.
- `- onPointerMove(event:PointerEvent)` —   Callback da eseguire in caso di evento pointerMove.
- `- onPointerUp(event:PointerEvent)` —   Callback da eseguire in caso di evento pointerUp.
- `- isEdgeActive(EdgeDTO):Boolean` —   Incapsula il controllo dello stato di attività di un nodo.
- `- generateBezierPath(edge:EdgeDTO):String` —   Genera la stringa per renderizzare l'arco nell'svg.
- `- resolveComponent(type:String):Component` —   Mappa il NodeType del LayoutNodeDTO al component corretto, è il modo inteso per realizzare il polimorfismo in Vue. 
- `+ selectNode(nodeId:String)<<emit>>` —   Evento emesso verso l'esterno per notificare la selezione di un nodo.



==== EvaluationBadge
#figure(
  image("../uml/png/frontend/EvaluationBadgeComplessivo.png", ),
  caption: [EvaluationBadge]
)



*Descrizione*:
Rappresenta il badge che notifica lo stato della valutazione.


*Attributi*:
- `- stateConfig:map<String,StateConfig>` —  Mappa il valore del risultato della valutazione alle informazioni relative alla presentazione.
- `- state:EvaluationState` —  Oggetto reattivo che mappa il valore dello stato di valutazione.


*Metodi*:
- `+ EvaluationBadge(state:EvaluationResult)` —  Costruttore che riceve l'oggetto reattivo da osservare. 


==== JustificationForm

#figure(
  image("../uml/png/frontend/JustificationForm.png", ),
  caption: [JustificationForm]
)

*Descrizione*:
Componente che mostra a schermo un form per modificare la descrizione.



*Attributi*:
- `- justificationInitialValue:String` —  Testo della giustificazione salvato.
- `- justificationField:FieldDefinition` —  Oggetto che gestisce il singolo campo del form,con le relative regole di validazione.
- `- status:String` —  Stato della modifica della giustificazione.
- `- localText:String` —  Testo attualmente inserito dall'utente.
- `- isDirty:Boolean` —  Flag che traccia lo stato di aggiornamento della giustificazione.


*Metodi*:
- `+ JustificationForm(justificationInitialValue:String,status:String)` —  Costruttore che riceve dall'esterno il valore della giustificazione salvato sullo store.
- `- handleSubmit()` —  Gestisce il salvataggio della nuova giustificazione.
- `- handleReset()` —  Ripristina il testo al valore dell'initial value.
- `+ save(justification:String) <<emit>>` —  Evento emesso quando l'utente cerca di salvare una giustificazione.





==== Point
#figure(
  image("../uml/png/frontend/Point.png", ),
  caption: [Point]
)



*Descrizione*:
Incapsula le coordinate di un singolo punto.


*Attributi*:
- `+ x:Number` — Coordinata x.
- `+ y:Number` — Coordinata y.


*Metodi*:

Non espone metodi.

==== StateConfig
#figure(
  image("../uml/png/frontend/StateConfig.png", ),
  caption: [StateConfig]
)



*Descrizione*:

Incapsula delle informazioni per la presentazione.


*Attributi*:

- `+ label:String` — Etichetta da far visualizzare all'utente.
- `+ icon:String` — Icona da mostrare.
- `+ cssClass:String` — Classe o classi css da applicare.



*Metodi*:

Non espone metodi.



==== UiDecisionNode
#figure(
  image("../uml/png/frontend/UiDecisionNode.png", ),
  caption: [UiDecisionNode]
)


*Descrizione*:

Componente che mostra graficamente il nodo di decisione.


*Attributi*:
- `-NODE_WIDTH:Number ` — Valore statico che semplifica la configurazione della larghezza dei nodi.
- `- TEXT_PADDING` — Valore statico che semplifica del padding.
- `- LINE_HEIGHT` — Valore statico che semplifica la configurazione della distanza tra le linee.
- `-id:String ` — Id del nodo di decisione.
- `- text:String` — Testo da mostrare a schermo.
- `- isActive:Boolean` — Flag usata per mostrare lo stato di attività del nodo.
- `- fontSize:Number` — Dimensione del testo.


*Metodi*:
- `+ UiDecisionNode(id:String,text:String,isActive:Boolean,fontSize:Number) ` —  
- `- estimatedLines():Number` — Funzione di utilità per calcolare il numero di linee stimate del nodo. 
- `- nodeHeight:Number`  — Altezza del nodo.
- `- onClick()`  — Callback eseguito al click di un nodo.
- `- select(nodeId:String)`  — Evento emesso alla selezione di un nodo.




==== UiLeafNode
#figure(
  image("../uml/png/frontend/UiLeafNode.png", ),
  caption: [UiLeafNode]
)


*Descrizione*:

Componente che disegna il singolo nodo foglia.

*Attributi*:
- `- id:String ` — Id del nodo foglia.
- `- text:String` — Testo da mostrare.
- `- resultState:String` — Valore del nodo foglia.
- `- isActive:Boolean` — Flag utilizzato per mostrare lo stato di attività del nodo.
 


*Metodi*:
- `+ UiLeafNode(id:String,text:String, resultState:String,isActive:Boolean)` — Costruttore che riceve i dati reattivi.

==== ViewBox
#figure(
  image("../uml/png/frontend/ViewBox.png", ),
  caption: [ViewBox]
)


*Descrizione*:

Oggetto che incapsula i dati relative alla view box della canvas.


*Attributi*:

- `- x:Number ` — Coordinata x da cui far partire la ViewBox.
- `- y:Number` — Coordinata y da cui far partire la ViewBox.
- `- w:Number` — Larghezza della ViewBox.
- `- h:Number` — Altezza della ViewBox.

*Metodi*:

Non espone metodi.

// === Architettura Visiva del Canvas (Tree Canvas)
// #figure(
//   image("../uml/png/frontend/decision-tree-canvas.png", width: 100%),
//   caption: [Architettura del componente TreeCanvas e del Layout Engine]
// ) <fig-frontend-canvas-arch>
// *Descrizione*

// Il diagramma illustra l'architettura dedicata alla renderizzazione topologica dell'albero decisionale. Per garantire prestazioni ottimali e codice pulito, il sistema separa nettamente il calcolo matematico delle coordinate visive (delegato a _D3LayoutEngine_) dal rendering effettivo a schermo (gestito dal componente _TreeCanvas_ e dai suoi sotto-componenti _UiDecisionNode_ e _UiLeafNode_).

// Di seguito vengono analizzati nel dettaglio i componenti e le strutture dati che partecipano a questo flusso.


// ==== LayoutResult e i DTO Geometrici
// #figure(
//   image("../uml/png/frontend/LayoutResult.png", width: 30%),
//   caption: [LayoutResult, NodeDTO ed EdgeDTO]
// )
// *Descrizione*

// Questi Data Transfer Object (DTO) rappresentano le strutture dati arricchite con le informazioni spaziali. A differenza del NodeDTO usato dalla Sidebar, qui i nodi includono coordinate assolute per il posizionamento sulla mappa.

// *Attributi*

// - *NodeDTO*:
//   - `+ id: String` — identificativo del nodo.
//   - `+ type: NodeType` — enumerativo che distingue tra nodo decisionale (`decision`) e nodo finale (`leaf`).
//   - `+ text: String` — testo da mostrare.
//   - `+ resultState: String | null` — eventuale esito finale (se di tipo leaf).
//   - `+ x: Float`, `+ y: Float` — coordinate cartesiane calcolate per il centro del nodo.
// - *EdgeDTO*:
//   - `+ id: String` — identificativo dell'arco.
//   - `+ sourceId: String`, `+ targetId: String` — ID dei nodi collegati.
//   - `+ startX, startY, endX, endY: Float` — coordinate esatte dei punti di inizio e fine della linea di collegamento.
// - *LayoutResult*:
//   - `+ nodes: List<NodeDTO>` — lista di tutti i nodi posizionati.
//   - `+ edges: List<EdgeDTO>` — lista di tutti gli archi posizionati.


// ==== LayoutEngine e D3LayoutEngine
// #figure(
//   image("../uml/png/frontend/D3LayoutEngine.png", width: 50%),
//   caption: [D3LayoutEngine]
// )
// *Descrizione*

// _LayoutEngine_ è l'interfaccia che definisce il contratto per il calcolo spaziale. _D3LayoutEngine_ ne è l'implementazione concreta, che sfrutta la libreria matematica D3.js per trasformare la struttura logica e gerarchica dell'albero in coordinate cartesiane bidimensionali, evitando sovrapposizioni tra i nodi.

// *Metodi*

// - `+ calculateLayout(treeMap: Map<String, Node>, rootId: String): LayoutResult` — riceve la mappa logica dei nodi e restituisce il `LayoutResult` contenente nodi e archi con le coordinate X e Y calcolate.
// - `- extractNodesArray(treeMap: Map): List<Node>` — metodo di utilità interno per la conversione della mappa in array.


// ==== TreeCanvas
// #figure(
//   image("../uml/png/frontend/TreeCanvas.png", width: 55%),
//   caption: [TreeCanvas]
// )
// *Descrizione*

// _TreeCanvas_ è il componente Vue.js principale per la visualizzazione dell'albero. Interroga lo Store, passa i dati al Layout Engine per il calcolo geometrico e si occupa di orchestrare il rendering dinamico di linee e nodi a schermo.

// *Proprietà Computate e Stato*

// - `- store: DecisionTreeStore` — riferimento allo stato globale.
// - `- layoutEngine: LayoutEngine` — riferimento al motore matematico.
// - `+ layoutResult: LayoutResult` — (computed) si aggiorna automaticamente se l'albero cambia, innescando un nuovo ricalcolo geometrico.
// - `+ activePath: List<String>` — (computed) recupera l'elenco degli ID dei nodi correntemente attivi in base alle risposte dell'utente.

// *Metodi*

// - `+ resolveComponent(type: NodeDTO): Component` — determina dinamicamente quale sotto-componente Vue renderizzare (_UiDecisionNode_ o _UiLeafNode_) in base al tipo del nodo.
// - `+ selectNode(nodeId: String)` — gestisce il click su un nodo della mappa, notificando lo Store.
// - `+ isEdgeActive(edge: EdgeDTO): Boolean` — verifica se la linea di collegamento appartiene al percorso attivo per applicare stili di evidenziazione.
// - `+ generateBezierPath(edge: EdgeDTO): String` — calcola la stringa del tracciato SVG per disegnare una curva morbida tra due nodi.


// ==== UiDecisionNode e UiLeafNode
// #figure(
//   image("../uml/png/frontend/UiDecisionNode.png", width: 25%),
//   caption: [UiDecisionNode e UiLeafNode]
// )
// *Descrizione*

// _UiDecisionNode_ e _UiLeafNode_ sono i micro-componenti visivi montati dinamicamente dal _TreeCanvas_. Si occupano unicamente di stampare a schermo l'interfaccia di un singolo nodo, applicando stili CSS differenti a seconda che il nodo sia attivo o meno, e intercettando le interazioni dell'utente.

// *Proprietà (Props passate dal padre)*

// - `+ id: String` — identificativo del nodo.
// - `+ text: String` — testo da mostrare (domanda o esito).
// - `+ isActive: Boolean` — flag iniettato dal _TreeCanvas_ per indicare se il nodo è parte del percorso selezionato.
// - `+ resultState: String` — (Solo in _UiLeafNode_) indica l'esito finale della valutazione per colorare opportunamente il nodo (es. verde/rosso).

// *Eventi (Signals)*

// - `+ onClick()` — (Solo in _UiDecisionNode_) emesso quando l'utente fa click sulla forma geometrica del nodo, catturato dal _TreeCanvas_.

// === Core di Valutazione (Domain Logic Client-side)
// #figure(
//   image("../uml/png/frontend/EvaluationEngineDomain.png", width: 100%),
//   caption: [Diagramma delle classi del Motore di Valutazione]
// ) <fig-frontend-domain-logic>
// *Descrizione*

// Il "Cervello" del modulo frontend risiede in una gerarchia di classi che implementano la logica di navigazione dell'albero decisionale direttamente nel browser. Questo approccio permette di ricalcolare il percorso di valutazione istantaneamente a ogni clic dell'utente, senza richiedere l'intervento del server. Il sistema utilizza il polimorfismo per distinguere il comportamento tra nodi di domanda e nodi di esito.




// ==== Interfaccia Node
// #figure(
//   image("../uml/png/frontend/NodeInterface.png", width: 30%),
//   caption: [Interfaccia Node]
// )
// *Descrizione*

// _Node_ è l'interfaccia (o contratto) base che definisce il comportamento comune a tutti i tipi di nodi presenti nell'albero. Garantisce che ogni nodo, indipendentemente dalla sua natura, possa fornire i propri dati di rendering e gestire la navigazione.

// *Metodi*

// - `+ getRenderData(): NodeDTO` — restituisce i dati necessari al componente visivo per mostrare il nodo.
// - `+ getNext(answer: Boolean): String | null` — calcola l'ID del nodo successivo in base alla risposta ricevuta.
// - `+ getPrevious(): String | null` — restituisce l'ID del nodo genitore per permettere la navigazione a ritroso.






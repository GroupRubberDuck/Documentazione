=== RequirementEvaluationResult <RequirementEvaluationResult>

#figure(
  image("../uml/png/Dominio/RequirementEvaluationResult.png", width: 40%),
  caption: [RequirementEvaluationResult]
) <fig-requirement-evaluation-result-domain>

*Descrizione*

_RequirementEvaluationResult_ è un Value Object immutabile che incapsula l'esito finale della valutazione di un singolo requisito.

*Attributi*

- `+ requirement_id: String` — identificativo del requisito valutato.
- `+ justification: String` — giustificazione fornita per la valutazione.
- `+ node_choices: MappingProxyType<String, Bool>` — mappa immutabile delle risposte fornite ai nodi decisionali.
- `+ state: EvaluationState` — stato finale calcolato per il requisito.
- `+ dependencies: Tuple` — tupla contenente l'ID e lo stato delle dipendenze del requisito.

*Metodi*

- `+ was_blocked_by_dependencies(): Bool` — verifica se l'esito è stato bloccato a causa di una o più dipendenze che non hanno raggiunto lo stato di `PASS`.


=== AssetEvaluationResult <AssetEvaluationResult>

#figure(
  image("../uml/png/Dominio/AssetEvaluationResult.png", width: 60%),
  caption: [AssetEvaluationResult]
) <fig-asset-evaluation-result-domain>

*Descrizione*

_AssetEvaluationResult_ è un Value Object immutabile che raggruppa tutti i risultati dei requisiti calcolati per un singolo asset, determinandone il verdetto complessivo.

*Attributi*

- `+ asset_id: String` — identificativo dell'asset valutato.
- `+ requirement_results: Tuple<RequirementEvaluationResult>` — tupla contenente i risultati di tutti i requisiti valutati per questo asset.
- `+ verdict: EvaluationState` — stato di conformità globale dell'asset.

*Metodi*
#set par(justify: false)
- `+ get_requirement_result(requirement_id: String): RequirementEvaluationResult | None` — cerca e restituisce il risultato di uno specifico requisito, se presente.
- `+ failed(): Tuple<RequirementEvaluationResult>` — filtra e restituisce esclusivamente i requisiti che hanno prodotto uno stato di `FAIL`.
- `+ pending(): Tuple<RequirementEvaluationResult>` — filtra e restituisce esclusivamente i requisiti con valutazione ancora in corso o incompleta (`PENDING`).


=== DeviceEvaluationResult <DeviceEvaluationResult>

#figure(
  image("../uml/png/Dominio/DeviceEvaluationResult.png", width: 40%),
  caption: [DeviceEvaluationResult]
) <fig-device-evaluation-result-domain>

*Descrizione*

_DeviceEvaluationResult_ rappresenta l'esito globale e immutabile della valutazione di un intero dispositivo rispetto a uno standard. Raggruppa i risultati di tutti i suoi asset.

*Attributi*

- `+ device_id: String` — identificativo del dispositivo.
- `+ standard_id: String` — identificativo dello standard di riferimento.
- `+ asset_results: Tuple<AssetEvaluationResult>` — tupla con i risultati aggregati per ogni asset.
- `+ verdict: EvaluationState` — esito finale della valutazione complessiva del dispositivo.

*Metodi*

- `+ get_asset_result(asset_id: String): AssetEvaluationResult | None` — recupera il risultato di un asset specifico all'interno del dispositivo.
- `+ failed_assets(): Tuple<AssetEvaluationResult>` — restituisce gli asset che non hanno superato la valutazione.
- `+ pending_assets(): Tuple<AssetEvaluationResult>` — restituisce gli asset la cui valutazione è ancora in sospeso.
- `+ is_complete(): Bool` — restituisce `True` se l'intera valutazione del dispositivo è conclusa (non ci sono stati `PENDING`).


=== NodeDetail <NodeDetail>

#figure(
  image("../uml/png/Dominio/NodeDetail.png", width: 30%),
  caption: [NodeDetail]
) <fig-node-detail-domain>

*Descrizione*

_NodeDetail_ è un oggetto di dominio, immutabile, utilizzato per esporre i dettagli strutturali e il contenuto informativo di un nodo dell'albero decisionale.

*Attributi*

- `+ node_id: String` — identificativo del nodo.
- `+ node_type: String` — indica la natura del nodo ("decision" o "leaf").
- `+ question: String | None` — testo della domanda, presente solo nei nodi decisionali.
- `+ child_on_true_id: String | None` — riferimento al nodo figlio per risposta affermativa.
- `+ child_on_false_id: String | None` — riferimento al nodo figlio per risposta negativa.
- `+ verdict: StandardVerdict | None` — esito associato al nodo, valorizzato solo per i nodi foglia.
- `+ parent_id: String | None` — identificativo del nodo genitore, utile per navigare l'albero a ritroso.

*Metodi*

_NodeDetail_ non definisce metodi.


=== RequirementEvaluationDetail <RequirementEvaluationDetail>

#figure(
  image("../uml/png/Dominio/RequirementEvaluationDetail.png", width: 40%),
  caption: [RequirementEvaluationDetail]
) <fig-requirement-evaluation-detail-domain>

*Descrizione*

_RequirementEvaluationDetail_ è un oggetto immutabile che consolida tutte le informazioni di un requisito (anagrafica, albero, nodi) e il relativo stato di valutazione nel contesto di un asset. È concepita per arricchire il risultato grezzo con i testi completi.

*Attributi*

- `+ requirement_id: String` — identificativo univoco.
- `+ name: String` — nome del requisito.
- `+ description: String` — testo descrittivo del requisito.
- `+ target: String` — obiettivo prefissato.
- `+ justification: String` — motivazione associata alla risposta.
- `+ root_id: String` — identificativo del nodo radice dell'albero.
- `+ node_choices: MappingProxyType<String, Bool>` — mappa delle risposte effettuate.
- `+ nodes: Map<String, NodeDetail>` — dizionario di tutti i nodi appartenenti all'albero di questo requisito.
- `+ state: EvaluationState` — esito attuale.
- `+ dependencies: Tuple` — lista delle dipendenze correlate con il relativo stato.

*Metodi*

_RequirementEvaluationDetail_ non definisce metodi.


=== AssetEvaluationDetail <AssetEvaluationDetail>

#figure(
  image("../uml/png/Dominio/AssetEvaluationDetail.png", width: 40%),
  caption: [AssetEvaluationDetail]
) <fig-asset-evaluation-detail-domain>

*Descrizione*

_AssetEvaluationDetail_ è un oggetto immutabile che aggrega tutti i dettagli descrittivi e di valutazione dei requisiti di uno specifico asset.

*Attributi*

- `+ asset_id: String` — identificativo dell'asset.
- `+ name: String` — nome dell'asset.
- `+ asset_type: AssetType` — categoria di appartenenza.
- `+ description: String` — descrizione aggiuntiva.
- `+ requirement_details: Tuple<RequirementEvaluationDetail>` — insieme arricchito di dettagli per ogni requisito.
- `+ verdict: EvaluationState` — stato globale dell'asset.

*Metodi*

_AssetEvaluationDetail_ non definisce metodi.


=== DeviceEvaluationDetail <DeviceEvaluationDetail>

#figure(
  image("../uml/png/Dominio/DeviceEvaluationDetail.png", width: 40%),
  caption: [DeviceEvaluationDetail]
) <fig-device-evaluation-detail-domain>

*Descrizione*

_DeviceEvaluationDetail_ è il livello radice della struttura di dettaglio: consolida e struttura in modo gerarchico tutte le informazioni testuali e di valutazione per l'intero dispositivo.

*Attributi*

- `+ device_id: String` — identificativo del dispositivo.
- `+ name: String` — nome del dispositivo.
- `+ operating_system: String` — sistema operativo in uso.
- `+ description: String` — breve descrizione del dispositivo.
- `+ standard_id: String` — identificativo dello standard applicato.
- `+ asset_details: Tuple<AssetEvaluationDetail>` — dettaglio di ogni asset.
- `+ verdict: EvaluationState` — stato complessivo.

*Metodi*

_DeviceEvaluationDetail_ non definisce metodi.
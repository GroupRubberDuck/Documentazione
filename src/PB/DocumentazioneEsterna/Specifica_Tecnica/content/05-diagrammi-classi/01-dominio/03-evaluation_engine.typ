=== EvaluationEngine <EvaluationEngine>

#figure(
  image("../uml/png/Dominio/EvaluationEngine.png", width: 100%),
  caption: [EvaluationEngine]
) <fig-evaluation-engine-domain>

*Descrizione*

_EvaluationEngine_ è il componente del dominio responsabile di orchestrare il processo di valutazione di un intero `Device` rispetto a un `ComplianceStandard` fornito. Il motore elabora iterativamente gli asset, risolvendo in modo ricorsivo le dipendenze tra i requisiti e applicando tecniche di memoizzazione per ottimizzare le performance e prevenire valutazioni ridondanti.

*Attributi*

La classe non definisce attributi di stato interni, agendo come puro gestore della logica di business.

*Metodi*

- `+ evaluate(device: Device, standard: ComplianceStandard): DeviceEvaluationResult` — valuta il dispositivo calcolando e aggregando i risultati di tutti i suoi asset, restituendo infine l'esito globale.
- `- _evaluate_asset(asset: Asset, standard: ComplianceStandard): AssetEvaluationResult` — metodo privato che valuta un singolo asset contro tutti i requisiti dello standard, avvalendosi di una cache per mantenere i risultati e supportare la memoizzazione.
- `- _resolve(requirement_id: String, standard: ComplianceStandard, asset: Asset, cache: Map): RequirementEvaluationResult` — risolve la valutazione di uno specifico requisito verificando prima ricorsivamente le sue dipendenze. Se l'asset non presenta evidenze per il requisito, imposta forzatamente lo stato su `PENDING`. Successivamente, salva il risultato nella cache.
- `- _aggregate_evaluation_states(states: List<EvaluationState>): EvaluationState` — analizza una serie di stati e ne calcola il verdetto aggregato: restituisce `FAIL` se rileva almeno un fallimento, `PENDING` se vi sono valutazioni incomplete, altrimenti restituisce `PASS`.


=== EvaluationState <EvaluationState>

#figure(
  image("../uml/png/Dominio/EvaluationState.png", width: 25%),
  caption: [EvaluationState]
) <fig-evaluation-state-domain>

*Descrizione*

_EvaluationState_ è un'enumerazione di stringhe (`StrEnum`) che definisce formalmente i possibili stati di avanzamento o di conclusione di una valutazione.

*Attributi*

- `- PASS: String` — indica che la valutazione è stata superata con successo ("pass").
- `- FAIL: String` — indica che la valutazione ha dato esito negativo ("fail").
- `- NA: String` — indica che il requisito non è applicabile al contesto valutato ("not_applicable").
- `- PENDING: String` — indica che la valutazione è attualmente in sospeso per mancanza di evidenze o risposte complete ("pending").

*Metodi*

- `+ from_verdict(verdict: StandardVerdict): EvaluationState` — metodo di classe che converte un `StandardVerdict` nel corrispondente `EvaluationState`, sollevando un `ValueError` qualora non esista una mappatura definita.
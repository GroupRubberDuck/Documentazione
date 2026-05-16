=== EvaluationSession <EvaluationSession>

#figure(
  image("../uml/png/Dominio/EvaluationSession.png", width: 40%),
  caption: [EvaluationSession]
) <fig-evaluation-session-domain>

*Descrizione*

_EvaluationSession_ è la classe che modella il contesto centrale di un'operazione di valutazione. Raggruppa e associa un identificativo univoco di sessione a uno specifico dispositivo e allo standard di conformità di riferimento scelto per l'analisi.

*Attributi*

- `+ session_id: String` — identificativo univoco della sessione di valutazione.
- `+ standard: ComplianceStandard` — istanza dello standard di conformità applicato per la valutazione corrente.
- `+ device: Device` — istanza del dispositivo che viene sottoposto a valutazione.

*Metodi e funzioni*

_EvaluationSession_ non definisce metodi.


=== SessionHandler <SessionHandler>

#figure(
  image("../uml/png/Dominio/SessionHandler.png", width: 60%),
  caption: [SessionHandler]
) <fig-session-handler-domain>

*Descrizione*

_SessionHandler_ è il componente di dominio che incapsula le regole di business fondamentali relative all'apertura di una nuova sessione. Valuta la fattibilità dell'operazione controllando le precondizioni del sistema.

*Attributi*

La classe non definisce attributi di stato interni, agendo come puro gestore di logica.

*Metodi e funzioni*

- `+ can_open_session(active_session_exists: Bool): Bool` — verifica se è possibile avviare una nuova sessione, restituendo `False` nel caso in cui ne esista già una attiva (impedendo sovrapposizioni), altrimenti restituisce `True`.
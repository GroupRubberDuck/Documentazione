=== OpenEvaluationSession <OpenEvaluationSession>

#block(breakable: false)[
#figure(
  image("../uml/png/OpenSession/OpenEvaluationSession.png", width: 100%),
  caption: [Caso d'uso OpenEvaluationSession]
) <fig-open-evaluation-session>

Il diagramma illustra l'architettura del modulo dedicato all'apertura di una sessione di valutazione. 


- Per la definizione di _Device_, vedere la @Device. \
- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la @InMemoryEvaluationSessionCache. \
- Per la definizione di _MongoDeviceAdapter_, vedere la @MongoDeviceAdapter.
- Per la definizione di _FindDevicePort_, vedere la @FindDevicePort.
- Per la definizione di _MongoStandardAdapter_, vedere la @MongoStandardAdapter.
- Per la definizione di _FindStandardPort_, vedere la @FindStandardPort.
- Per la definizione di _SessionHandler_, vedere la @SessionHandler.

Di seguito vengono documentati esclusivamente i componenti introdotti specificamente per questo caso d'uso.
]
#block(breakable: false)[
==== EvaluationSessionController <EvaluationSessionController>
#figure(
  image("../uml/png/OpenSession/EvaluationSessionController.png", width: 45%),
  caption: [EvaluationSessionController]
) <fig-evaluation-session-controller>

*Descrizione*

_EvaluationSessionController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP relative alla gestione del ciclo di vita della sessione di valutazione e le inoltra al livello applicativo.

*Attributi*

- `- open_use_case: OpenEvaluationSessionUseCase` — inbound port usata per aprire la sessione.
- `- close_use_case: CloseEvaluationSessionUseCase` — inbound port usata per chiudere la sessione.
- `- commit_use_case: CommitEvaluationSessionUseCase` — inbound port usata per salvare la sessione in memoria.

*Metodi*

- `+ open_session(req: Request): Response` — riceve la richiesta HTTP di apertura di una nuova sessione di valutazione e restituisce una risposta HTTP con l'identificativo della sessione creata.
- `+ close_session(req: Request): Response` — riceve la richiesta HTTP di chiusura della sessione corrente e restituisce una risposta HTTP con l'esito dell'operazione.
- `+ commit_session(req: Request): Response` — riceve la richiesta HTTP di salvataggio definitivo della sessione e restituisce una risposta HTTP con l'esito dell'operazione.
- `+ commit_and_close(req: Request): Response` — riceve la richiesta HTTP di salvataggio definitivo e chiusura contestuale della sessione e restituisce una risposta HTTP con l'esito dell'operazione.
]


==== OpenEvaluationSessionCommand

#figure(
  image("../uml/png/OpenSession/OpenEvaluationSessionCommand.png", width: 40%),
  caption: [OpenEvaluationSessionCommand]
) <fig-open-evaluation-session-command>

*Descrizione*

_OpenEvaluationSessionCommand_ è il Command Object utilizzato per trasportare i dati necessari all'apertura di una nuova sessione di valutazione. Incapsula i parametri di input del metodo esposto da _OpenEvaluationSessionUseCase_.

*Attributi*

- `+ device_id: String` — identificativo univoco del Dispositivo per cui aprire la sessione.

*Metodi*

_OpenEvaluationSessionCommand_ non definisce metodi propri.

==== OpenEvaluationSessionUseCase

#figure(
  image("../uml/png/OpenSession/OpenEvaluationSessionUseCase.png", width: 45%),
  caption: [OpenEvaluationSessionUseCase]
) <fig-open-evaluation-session-use-case>

*Descrizione*

_OpenEvaluationSessionUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per l'apertura di una nuova sessione di valutazione. Viene implementata da _OpenEvaluationSessionService_ e utilizzata da _EvaluationSessionController_.

*Attributi*

_OpenEvaluationSessionUseCase_ non definisce attributi.

*Metodi*

#set par(justify: false)
- `+ open_evaluation_session(command: OpenEvaluationSessionCommand): String` — firma del metodo delegato all'esecuzione della logica di apertura della sessione a partire dai dati contenuti nel Command.

==== OpenEvaluationSessionService

#figure(
  image("../uml/png/OpenSession/OpenEvaluationSessionService.png", width: 60%),
  caption: [OpenEvaluationSessionService]
) <fig-open-evaluation-session-service>

*Descrizione*

_OpenEvaluationSessionService_ è il service applicativo appartenente all'Application Core responsabile della logica di apertura di una sessione di valutazione. Implementa l'interfaccia _OpenEvaluationSessionUseCase_ e coordina il recupero del Dispositivo tramite _FindDevicePort_, il recupero dello standard di conformità tramite _FindStandardPort_ e la creazione della sessione tramite _CreateEvaluationSessionPort_.

*Attributi*

- `- session_coordinator: SessionCoordinator` — classe allo stato applicativo che centralizza le regole di business per autorizzare l'apertura di una nuova sessione.

- `- create_session_port: CreateEvaluationSessionPort` — outbound port usata per creare una sessione.

- `- find_device_port: FindDevicePort` — outbound port usata per trovare il dispositivo.

- `- find_standard_port: FindStandardPort` — outbound port usata per trovare lo Standard.

*Metodi*

- `+ open_evaluation_session(command: OpenEvaluationSessionCommand): String` — concretizza il contratto definito da _OpenEvaluationSessionUseCase_. Recupera il Dispositivo e lo standard associato, inizializza una nuova _EvaluationSession_ e ne richiede la creazione tramite _CreateEvaluationSessionPort_; restituisce l'identificativo della sessione creata.

==== SessionCoordinator
#figure(
  image("../uml/png/OpenSession/SessionCoordinator.png", width: 30%),
  caption: [SessionCoordinator]
) <fig-session-coordinator>
*Descrizione*

_SessionCoordinator_ è il Service che coordina la logica di dominio relativa alla gestione della sessione di valutazione. Verifica le precondizioni necessarie all'apertura di una sessione, come l'assenza di sessioni attive per il Dispositivo.

*Attributi*

- `- exist_port: EvaluationSessionExistPort` — Outbound port per verificare l'esistenza di sessioni attive nel sistema.
- `- session_handler: SessionHandler` — Componente di dominio che incapsula le regole di business per l'apertura delle sessioni.

*Metodi*

- `+ can_open_session(): bool` — verifica se è possibile aprire una nuova sessione, restituendo `true` se le precondizioni sono soddisfatte.

==== EvaluationSessionExistPort
#figure(
  image("../uml/png/OpenSession/EvaluationSessionExistPort.png", width: 30%),
  caption: [EvaluationSessionExistPort]
) <fig-evaa>
*Descrizione*

_EvaluationSessionExistPort_ è l'interfaccia (Outbound Port) che definisce il contratto per verificare la presenza di eventuali sessioni di valutazione attualmente attive all'interno del sistema.

*Attributi*

La classe _EvaluationSessionExistPort_ non definisce attributi.

*Metodi*

- `+ has_active_session(): bool` — interroga il sistema per determinare se esiste già una sessione attiva, restituendo il risultato come valore booleano.

==== CreateEvaluationSessionPort
#figure(
  image("../uml/png/OpenSession/CreateEvaluationSessionPort.png", width: 80%),
  caption: [CreateEvaluationSessionPort]
) <fig-create-evaluation-session-port>

*Descrizione*

_CreateEvaluationSessionPort_ è l'interfaccia (Outbound Port) che definisce il contratto per la creazione di una nuova sessione di valutazione nel sistema di persistenza in memoria. Viene implementata da _InMemoryEvaluationSessionCache_ e utilizzata da _OpenEvaluationSessionService_.

*Attributi*

_CreateEvaluationSessionPort_ non definisce attributi.

*Metodi*

- `+ create_session(): EvaluationSession` — firma del metodo che inizializza e registra una nuova sessione di valutazione nel sistema in memoria.



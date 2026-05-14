== Session 
=== OpenEvaluationSession <OpenEvaluationSession>

#block(breakable: false)[
#figure(
  image("../uml/png/OpenSession/OpenEvaluationSession.png", width: 100%),
  caption: [Caso d'uso OpenEvaluationSession]
) <fig-open-evaluation-session>

Il diagramma illustra l'architettura del modulo dedicato all'apertura di una sessione di valutazione. 


- Per la definizione di _Device_, vedere la sezione @Device. \
- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la sezione @InMemoryEvaluationSessionCache. \
- Per la definizione di _MongoDeviceAdapter_, vedere la sezione @MongoDeviceAdapter.
- Per la definizione di _FindDevicePort_, vedere la sezione @FindDevicePort
- Per la definizione di _MongoStandardAdapter_, vedere la sezione @MongoStandardAdapter
- Per la definizione di _FindStandardPort_, vedere la sezione @FindStandardPort

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

_EvaluationSessionController_ non definisce attributi propri.

*Metodi e funzioni*

- `+ open_session(req: Request): Response` — riceve la richiesta HTTP di apertura di una nuova sessione di valutazione e restituisce una risposta HTTP con l'identificativo della sessione creata.
- `+ close_session(req: Request): Response` — riceve la richiesta HTTP di chiusura della sessione corrente e restituisce una risposta HTTP con l'esito dell'operazione.
- `+ save_session(req: Request): Response` — riceve la richiesta HTTP di salvataggio dello stato corrente della sessione e restituisce una risposta HTTP con l'esito dell'operazione.
- `+ commit_session(req: Request): Response` — riceve la richiesta HTTP di commit della sessione e restituisce una risposta HTTP con l'esito dell'operazione.
- `+ commit_and_close(req: Request): Response` — riceve la richiesta HTTP di commit e chiusura contestuale della sessione e restituisce una risposta HTTP con l'esito dell'operazione.
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

*Metodi e funzioni*

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

*Metodi e funzioni*

- `+ open_evaluation_session(command: OpenEvaluationSessionCommand): String` — firma del metodo delegato all'esecuzione della logica di apertura della sessione a partire dai dati contenuti nel Command.

==== OpenEvaluationSessionService

#figure(
  image("../uml/png/OpenSession/OpenEvaluationSessionService.png", width: 45%),
  caption: [OpenEvaluationSessionService]
) <fig-open-evaluation-session-service>

*Descrizione*

_OpenEvaluationSessionService_ è il service applicativo appartenente all'Application Core responsabile della logica di apertura di una sessione di valutazione. Implementa l'interfaccia _OpenEvaluationSessionUseCase_ e coordina il recupero del Dispositivo tramite _FindDevicePort_, il recupero dello standard di conformità tramite _FindStandardPort_, la verifica delle precondizioni tramite _SessionCoordinator_ e la creazione della sessione tramite _CreateEvaluationSessionPort_.

*Attributi*

_OpenEvaluationSessionService_ non definisce attributi propri.

*Metodi e funzioni*

- `+ open_evaluation_session(command: OpenEvaluationSessionCommand): String` —  concretizza il contratto definito da _OpenEvaluationSessionUseCase_. Verifica tramite _SessionCoordinator_ che non esistano sessioni attive, recupera il Dispositivo e lo standard associato, inizializza una nuova _EvaluationSession_ e ne richiede la creazione tramite _CreateEvaluationSessionPort_; restituisce l'identificativo della sessione creata.

==== SessionCoordinator
#figure(
  image("../uml/png/OpenSession/SessionCoordinator.png", width: 45%),
  caption: [SessionCoordinator]
) <fig-session-coordinator>
*Descrizione*

_SessionCoordinator_ è il Domain Service che coordina la logica di dominio relativa alla gestione della sessione di valutazione. Verifica le precondizioni necessarie all'apertura di una sessione delegando la logica di business a _SessionHandler_ e la verifica dell'esistenza di sessioni attive a _EvaluationSessionExistsPort_.

*Attributi*

_SessionCoordinator_ non definisce attributi propri.

*Metodi e funzioni*

- `+ can_open_session(): bool` — verifica se è possibile aprire una nuova sessione interrogando _EvaluationSessionExistsPort_ per conoscere lo stato attuale e delegando la decisione a _SessionHandler_; restituisce true se le precondizioni sono soddisfatte.

==== SessionHandler

#figure(
  image("../uml/png/OpenSession/SessionHandler.png", width: 45%),
  caption: [SessionHandler]
) <fig-session-handler>

*Descrizione*

_SessionHandler_ è il Domain Service che incapsula la logica di business relativa all'apertura di una sessione di valutazione. Riceve lo stato dell'esistenza di sessioni attive e determina se è possibile aprirne una nuova.

*Attributi*

_SessionHandler_ non definisce attributi propri.

*Metodi e funzioni*

- `+ can_open_session(active_session_exists: bool): bool` —  restituisce true se non esiste già una sessione attiva, false altrimenti.

==== EvaluationSessionExistsPort
#figure(
  image("../uml/png/OpenSession/EvaluationSessionExistPort.png", width: 45%),
  caption: [EvaluationSessionExistPort]
) <fig-evaluation-session-exist-port>

*Descrizione*

_EvaluationSessionExistPort_ è l'interfaccia (Outbound Port) che definisce il contratto per la verifica dell'esistenza di una sessione attiva. Viene implementata da _InMemoryEvaluationSessionCache_ e utilizzata da _SessionCoordinator_.

*Attributi*

_EvaluationSessionExistPort_ non definisce attributi propri.

*Metodi e funzioni*

- `+ has_active_session(): bool` —  restituisce true se esiste una sessione attiva in memoria, false altrimenti.


==== CreateEvaluationSessionPort
#figure(
  image("../uml/png/OpenSession/CreateEvaluationSessionPort.png", width: 45%),
  caption: [CreateEvaluationSessionPort]
) <fig-create-evaluation-session-port>

*Descrizione*

_CreateEvaluationSessionPort_ è l'interfaccia (Outbound Port) che definisce il contratto per la creazione di una nuova sessione di valutazione nel sistema di persistenza in memoria. Viene implementata da _InMemoryEvaluationSessionCache_ e utilizzata da _OpenEvaluationSessionService_.

*Attributi*

_CreateEvaluationSessionPort_ non definisce attributi.

*Metodi e funzioni*

- `+ create_evaluation_session(standard: ComplianceStandard, device: Device): EvaluationSession` — inizializza e registra una nuova sessione di valutazione in memoria a partire dallo standard e dal Dispositivo forniti; restituisce la sessione creata.

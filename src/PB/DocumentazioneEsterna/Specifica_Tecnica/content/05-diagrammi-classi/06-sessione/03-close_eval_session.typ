=== CloseEvaluationSession <CloseEvaluationSession>

#figure(
  image("../uml/png/CloseSession/CloseEvaluationSession.png", width: 100%),
  caption: [Caso d'uso CloseEvaluationSession]
) <fig-close-evaluation-session>

Il diagramma illustra l'architettura del modulo dedicato alla chiusura e all'eliminazione di una sessione di valutazione. 

- Per la definizione di _EvaluationSessionController_, vedere la sezione @EvaluationSessionController. \
- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la sezione @InMemoryEvaluationSessionCache.

Di seguito vengono documentati esclusivamente i componenti introdotti specificamente per questo caso d'uso.


==== CloseEvaluationSessionUseCase <CloseEvaluationSessionUseCase>

#figure(
  image("../uml/png/CloseSession/CloseEvaluationSessionUseCase.png", width: 35%),
  caption: [CloseEvaluationSessionUseCase]
) <fig-close-evaluation-session-use-case>

*Descrizione*

_CloseEvaluationSessionUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per la chiusura definitiva di una sessione di valutazione attiva. Rappresenta l'operazione conclusiva del ciclo di vita della sessione e viene implementata da _CloseEvaluationSessionService_ e utilizzata dal controller _EvaluationSessionController_.

*Attributi*

_CloseEvaluationSessionUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ close_evaluation_session(command: CloseEvaluationSessionCommand): void` — firma del metodo delegato all'esecuzione della logica di chiusura della sessione a partire dal comando ricevuto in input. 

==== CloseEvaluationSessionService
#figure(
  image("../uml/png/CloseSession/CloseEvaluationSessionService.png", width: 35%),
  caption: [CloseEvaluationSessionService]
) <fig-close-evaluation-session-service>
*Descrizione*

_CloseEvaluationSessionService_ è il service applicativo appartenente all'Application Core responsabile della logica di chiusura della sessione. Implementa l'interfaccia _CloseEvaluationSessionUseCase_. Una volta eseguite le operazioni di dominio necessarie, richiede la rimozione della sessione dal sistema di persistenza richiamando la porta in uscita _CloseEvaluationSessionPort_.

*Attributi*

_CloseEvaluationSessionService_ non definisce attributi propri.

*Metodi e funzioni*

- `+ close_evaluation_session(command: CloseEvaluationSessionCommand): void` — concretizza il contratto definito da _CloseEvaluationSessionUseCase_. Inoltra la richiesta di eliminazione della sessione a _CloseEvaluationSessionPort_ utilizzando il session_id incapsulato nel comando.


==== CloseEvaluationSessionCommand
#figure(
  image("../uml/png/CloseSession/CloseEvaluationSessionCommand.png", width: 40%),
  caption: [CloseEvaluationSessionCommand]
) <fig-close-evaluation-session-command>
*Descrizione*

_CloseEvaluationSessionCommand_  incapsula i parametri necessari per richiedere la chiusura di una sessione di valutazione. Serve a disaccoppiare i dati di input dalle firme dei metodi dei service applicativi.

*Attributi*

- `+ session_id: String` — l'identificativo univoco della sessione di valutazione di cui si richiede la chiusura.

*Metodi e funzioni*

_CloseEvaluationSessionCommand_ non definisce metodi.

==== CloseEvaluationSessionPort <CloseEvaluationSessionPort>
#figure(
  image("../uml/png/CloseSession/CloseEvaluationSessionPort.png", width: 35%),
  caption: [CloseEvaluationSessionPort]
) <fig-close-evaluation-session-port>

*Descrizione*

_CloseEvaluationSessionPort_ è l'interfaccia (Outbound Port) che definisce il contratto per la chiusura di una sessione di valutazione nel sistema di persistenza in memoria. Viene utilizzata da _CloseEvaluationSessionService_ e implementata da _InMemoryEvaluationSessionCache_.

*Attributi*

_CloseEvaluationSessionPort_ non definisce attributi.

*Metodi e funzioni*

- `+ close_evaluation_session(session_id: String): void` — firma del metodo che si occupa di rimuovere la sessione di valutazione specificata dal sistema di persistenza in memoria.

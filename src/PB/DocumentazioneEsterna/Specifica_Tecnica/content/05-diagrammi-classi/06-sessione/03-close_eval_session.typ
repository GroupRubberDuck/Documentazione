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
  image("../uml/png/CloseSession/CloseEvaluationSessionUseCase.png", width: 60%),
  caption: [CloseEvaluationSessionUseCase]
) <fig-close-evaluation-session-use-case>

*Descrizione*

_CloseEvaluationSessionUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per la chiusura definitiva di una sessione di valutazione attiva. Rappresenta l'operazione conclusiva del ciclo di vita della sessione e viene implementata da _CloseEvaluationSessionService_ e utilizzata dal controller _EvaluationSessionController_.

*Attributi*

_CloseEvaluationSessionUseCase_ non definisce attributi.

*Metodi*

- `+ close(command: CloseEvaluationSessionCommand): void` — firma del metodo delegato all'esecuzione della logica di chiusura della sessione a partire dal comando ricevuto in input. 

==== CloseEvaluationSessionService
#figure(
  image("../uml/png/CloseSession/CloseEvaluationSessionService.png", width: 60%),
  caption: [CloseEvaluationSessionService]
) <fig-close-evaluation-session-service>
*Descrizione*

_CloseEvaluationSessionService_ è il service applicativo appartenente all'Application Core responsabile della logica di chiusura della sessione. Implementa l'interfaccia _CloseEvaluationSessionUseCase_. Una volta eseguite le operazioni di dominio necessarie, richiede la rimozione della sessione dal sistema di persistenza richiamando la porta in uscita _DeleteSessionPort_.

*Attributi*

- `- delete_session_port: DeleteSessionPort` — outbound port usata per eliminare la sessione.

*Metodi*

- `+ close(command: CloseEvaluationSessionCommand): void` — concretizza il contratto definito da _CloseEvaluationSessionUseCase_. Coordina le operazioni di chiusura e inoltra la richiesta di eliminazione della sessione utilizzando i parametri incapsulati nel comando.


==== CloseEvaluationSessionCommand
#figure(
  image("../uml/png/CloseSession/CloseEvaluationSessionCommand.png", width: 40%),
  caption: [CloseEvaluationSessionCommand]
) <fig-close-evaluation-session-command>
*Descrizione*

_CloseEvaluationSessionCommand_  incapsula i parametri necessari per richiedere la chiusura di una sessione di valutazione. Serve a disaccoppiare i dati di input dalle firme dei metodi dei service applicativi.

*Attributi*

- `+ session_id: String` — l'identificativo univoco della sessione di valutazione di cui si richiede la chiusura e l'eliminazione.

*Metodi*

_CloseEvaluationSessionCommand_ non definisce metodi.

==== DeleteSessionPort <DeleteSessionPort>
#figure(
  image("../uml/png/CloseSession/DeleteSessionPort.png", width: 60%),
  caption: [DeleteSessionPort]
) <fig-delete-session-port>
*Descrizione*

_DeleteSessionPort_ è l'interfaccia (Outbound Port) che definisce il contratto per l'eliminazione di una sessione di valutazione dal sistema di archiviazione (es. la cache in memoria). Viene utilizzata da _CloseEvaluationSessionService_ e implementata nel livello di adapter da _InMemoryEvaluationSessionCache_.

*Attributi*

_DeleteSessionPort_ non definisce attributi.

*Metodi*

- `+ delete_session(session_id: String): void` — firma del metodo che si occupa di rimuovere o invalidare lo stato di una specifica sessione di valutazione dal sistema di persistenza.


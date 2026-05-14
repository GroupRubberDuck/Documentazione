
=== CommitEvaluationSession <CommitEvaluationSession>
#figure(
  image("../uml/png/CommitSession/CommitEvaluationSession.png", width: 100%),
  caption: [Caso d'uso CommitEvaluationSession]
) <fig-commit-evaluation-session>

Il diagramma illustra l'architettura del modulo dedicato esclusivamente al consolidamento (commit) dei dati di una sessione di valutazione verso il dispositivo, senza richiederne la chiusura o l'eliminazione dalla memoria temporanea. 

- Per la definizione di _EvaluationSessionController_, vedere la sezione @EvaluationSessionController. \
- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la sezione @InMemoryEvaluationSessionCache. \
- Per la definizione di _MongoDeviceAdapter_, vedere la sezione @MongoDeviceAdapter. \
- Per la definizione di _SaveDevicePort_, vedere la sezione @SaveDevicePort. \
- Per la definizione di _GetEvaluationSessionPort_, vedere la sezione @GetEvaluationSessionPort.

Di seguito vengono documentati esclusivamente i componenti specifici introdotti per questo flusso operativo.


==== CommitEvaluationSessionService
#figure(
  image("../uml/png/CommitSession/CommitEvaluationSessionService.png", width: 35%),
  caption: [CommitEvaluationSessionService]
) <fig-commit-evaluation-session-service>

_CommitEvaluationSessionService_ è il service applicativo dell'Application Core responsabile di orchestrare l'operazione di commit. Implementa l'interfaccia _CommitEvaluationSessionUseCase_. Coordina il recupero della sessione attualmente in corso (tramite la porta _GetEvaluationSessionPort_), legge i dati necessari dal _CommitEvaluationSessionCommand_ e applica le modifiche definitive delegando il salvataggio all'entità dispositivo (tramite _SaveDevicePort_).

*Attributi*

_CommitEvaluationSessionService_ non definisce attributi propri.

*Metodi e funzioni*

- `+ commit(command: CommitEvaluationSessionCommand): void` — concretizza la logica di business relativa al consolidamento dei dati. Utilizza i parametri incapsulati nel comando per applicare le modifiche allo stato persistente del dispositivo.


==== CommitEvaluationSessionUseCase <CommitEvaluationSessionUseCase>
#figure(
  image("../uml/png/CommitSession/CommitEvaluationSessionUseCase.png", width: 40%),
  caption: [CommitEvaluationSessionUseCase]
) <fig-commit-evaluation-session-use-case>
*Descrizione*

_CommitEvaluationSessionUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per eseguire il consolidamento (commit) dei dati di una sessione di valutazione attiva, applicando definitivamente le modifiche all'entità dispositivo associata. Viene implementata da _CommitEvaluationSessionService_ e utilizzata dal controller _EvaluationSessionController_.

*Attributi*

_CommitEvaluationSessionUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ commit(command: CommitEvaluationSessionCommand): void` — firma del metodo delegato all'esecuzione della logica di consolidamento dei dati della sessione di valutazione a partire dal comando ricevuto in input.


==== CommitEvaluationSessionCommand
#figure(
  image("../uml/png/CommitSession/CommitEvaluationSessionCommand.png", width: 40%),
  caption: [CommitEvaluationSessionCommand]
) <fig-commit-evaluation-session-command>
*Descrizione*

_CommitEvaluationSessionCommand_ incapsula i parametri necessari per richiedere il consolidamento (commit) di una sessione di valutazione. Serve a disaccoppiare i dati di input dalle firme dei metodi dei service applicativi.

*Attributi*

- `+ session_id: String` — l'identificativo univoco della sessione di valutazione di cui si richiede il consolidamento dei dati.

*Metodi e funzioni*

_CommitEvaluationSessionCommand_ non definisce metodi.
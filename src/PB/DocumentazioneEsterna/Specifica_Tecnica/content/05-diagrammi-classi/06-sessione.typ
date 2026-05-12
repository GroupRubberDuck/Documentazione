== Session <classe_valutazione>
/*
//casi d'uso implementati : UC20 - UC30

#image("../uml/png/classe_valutazione.png")


Il diagramma delle classi illustra la progettazione architetturale per il modulo di Gestione delle Valutazioni dei Requisiti. Questo modulo è il cuore operativo del sistema: implementa la navigazione degli alberi decisionali della norma EN 18031 e la produzione degli esiti di conformità (PASS/FAIL/NA) per ciascun requisito applicato a un asset.


+ #[ *Inbound Adapter*
  Il pacchetto Inbound Adapter contiene il `ValutazioneController`, sviluppato come Blueprint Flask. Il suo unico compito è ricevere le richieste HTTP, tradurle in un formato comprensibile al sistema e restituire una risposta web. Questo livello non prende nessuna decisione logica; delega interamente il controllo alle Inbound Ports. Gli endpoint esposti corrispondono alle operazioni principali del ciclo di vita di una valutazione: avvio, progressione nodo per nodo, lettura dello stato corrente, reset e richiesta del report finale.
]

+ #[ *Application Core e Ports*


 Al centro del diagramma si trova la logica vera e propria del software. Per proteggere questa parte centrale, essa comunica con l'esterno unicamente tramite delle Porte (Interfacce astratte):


   `InterfaceValutazioneUseCase` (Inbound Port): Definisce il contratto dei casi d'uso offerti all'esterno. Il Controller invoca questa porta senza conoscere l'implementazione sottostante. I metodi principali riguardano l'avvio (avviaValutazione), la progressione nodo per nodo (valutaNodo), la lettura dello stato corrente (getStatoValutazione), il reset (resetValutazione) e la generazione del report finale (getReportConformita).

   `ValutazioneService` (Service): È la classe che svolge il lavoro reale. Implementa InterfaceValutazioneUseCase e orchestra l'intero flusso di navigazione degli alberi decisionali. In particolare:
   - ecupera il contesto di valutazione (dispositivo, modello normativo, stato corrente) tramite i repository iniettati (`dispositivoRepository` e `modelloRepository`) esposti come Outbound Ports appartenenti ai rispettivi moduli;
   - delega al Domain il calcolo della transizione di stato e della logica normativa EN 18031;
   - utilizza un metodo privato caricaContestoValutazione per centralizzare il caricamento ed evitare duplicazione tra le operazioni.

   `InterfaceValutazioneRepository` (Outbound Port): Definisce il contratto di persistenza specifico per le valutazioni che il Service utilizza. Astrae completamente la tecnologia di storage: il nucleo non conosce MongoDB. I metodi esposti comprendono la ricerca per dispositivo e requisito, il salvataggio, la cancellazione e il recupero completo per dispositivo.

]
+ #[ *Domain*


  Il livello Domain incapsula le entità e le regole di business pure.
  - `ValutazioneRequisito`: è la classe di associazione centrale tra un Asset e un Requisito normativo (già visibile nel diagramma di dominio alla Sezione 5.1). Memorizza nella mappa mapRisposte le risposte booleane date dall'utente per ciascun nodo dell'albero, permettendo la sospensione e la ripresa della compilazione. Il metodo calcolaEsito delega al DecisionTree la restituzione del verdetto finale percorrendo il cammino registrato. Il metodo `getUltimoNodoAttivo` determina a quale nodo dell'albero l'utente deve essere reindirizzato in caso di ripresa.
  - `ReportConformita`: aggrega una collezione di `ValutazioneRequisito` relative a un intero Dispositivo. La relazione è di aggregazione e non di composizione: l'eventuale rigenerazione o cancellazione di un report non invalida le valutazioni persistite nel sistema. Offre metodi per calcolare l'esito globale e per interrogare la distribuzione dei verdetti (totale PASS, FAIL, NA).
  - `StatoValutazione` e `Verdetto`: due enumerazioni che impongono vincoli di dominio stringenti sullo stato del processo di valutazione e sull'esito finale, garantendo type-safety e prevenendo stati non previsti dalla norma.
]
+ #[ *Outbound Adapter*


  Il pacchetto Outbound Adapter contiene il `MongoValutazioneAdapter`. Questa classe implementa concretamente il contratto `InterfaceValutazioneRepository`. A differenza del `MongoDispositivoAdapter`, che opera su documenti di primo livello, il `MongoValutazioneAdapter` agisce sull'array `lista_valutazioni` annidato all'interno del sub-documento `lista_asset` del documento Dispositivo, come definito nello Schema Dati alla Sezione 3.6.2. Questa scelta è coerente con la struttura di composizione tra le entità e con la strategia di normalizzazione selettiva adottata.
]
*/
=== OpenEvaluationSession <OpenEvaluationSession>

#block(breakable: false)[
#figure(
  image("../uml/png/Session/OpenEvaluationSession.png", width: 100%),
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
  image("../uml/png/Session/EvaluationSessionController.png", width: 45%),
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
  image("../uml/png/Session/OpenEvaluationSessionCommand.png", width: 40%),
  caption: [OpenEvaluationSessionCommand]
) <fig-open-evaluation-session-command>

*Descrizione*

_OpenEvaluationSessionCommand_ è il Command Object utilizzato per trasportare i dati necessari all'apertura di una nuova sessione di valutazione. Incapsula i parametri di input del metodo esposto da _OpenEvaluationSessionUseCase_.

*Attributi*

- `+ device_id: String` — identificativo univoco del Dispositivo per cui aprire la sessione.
- `+ session_id: String` — identificativo univoco della sessione di valutazione da aprire.

*Metodi e funzioni*

_OpenEvaluationSessionCommand_ non definisce metodi propri.

==== OpenEvaluationSessionUseCase

#figure(
  image("../uml/png/Session/OpenEvaluationSessionUseCase.png", width: 45%),
  caption: [OpenEvaluationSessionUseCase]
) <fig-open-evaluation-session-use-case>

*Descrizione*

_OpenEvaluationSessionUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per l'apertura di una nuova sessione di valutazione. Viene implementata da _OpenEvaluationSessionService_ e utilizzata da _EvaluationSessionController_.

*Attributi*

_OpenEvaluationSessionUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ open(command: OpenEvaluationSessionCommand): String` — firma del metodo delegato all'esecuzione della logica di apertura della sessione a partire dai dati contenuti nel Command.

==== OpenEvaluationSessionService

#figure(
  image("../uml/png/Session/OpenEvaluationSessionService.png", width: 45%),
  caption: [OpenEvaluationSessionService]
) <fig-open-evaluation-session-service>

*Descrizione*

_OpenEvaluationSessionService_ è il service applicativo appartenente all'Application Core responsabile della logica di apertura di una sessione di valutazione. Implementa l'interfaccia _OpenEvaluationSessionUseCase_ e coordina il recupero del Dispositivo tramite _FindDevicePort_, il recupero dello standard di conformità tramite _FindStandardPort_ e la creazione della sessione tramite _CreateSessionPort_.

*Attributi*

_OpenEvaluationSessionService_ non definisce attributi propri.

*Metodi e funzioni*

- `+ open(command: OpenEvaluationSessionCommand): String` — concretizza il contratto definito da _OpenEvaluationSessionUseCase_. Recupera il Dispositivo e lo standard associato, inizializza una nuova _EvaluationSession_ e ne richiede la creazione tramite _CreateSessionPort_; restituisce l'identificativo della sessione creata.

==== SessionCoordinator
#figure(
  image("../uml/png/Session/SaveAssetService.png", width: 45%),
  caption: [SaveAssetService]
) <fig-save-asset-service-session>
*Descrizione*

_SessionCoordinator_ è il Domain Service che coordina la logica di dominio relativa alla gestione della sessione di valutazione. Verifica le precondizioni necessarie all'apertura di una sessione, come l'assenza di sessioni attive per il Dispositivo.

*Attributi*

_SessionCoordinator_ non definisce attributi propri.

*Metodi e funzioni*

- `+ can_open_session(session_type: SessionType): bool` — verifica se è possibile aprire una nuova sessione del tipo specificato, restituendo `true` se le precondizioni sono soddisfatte.



==== CreateSessionPort
#figure(
  image("../uml/png/Session/CreateSessionPort.png", width: 45%),
  caption: [CreateSessionPort]
) <fig-create-session-port>

*Descrizione*

_CreateSessionPort_ è l'interfaccia (Outbound Port) che definisce il contratto per la creazione di una nuova sessione di valutazione nel sistema di persistenza in memoria. Viene implementata da _InMemoryEvaluationSessionCache_ e utilizzata da _OpenEvaluationSessionService_.

*Attributi*

_CreateSessionPort_ non definisce attributi.

*Metodi e funzioni*

- `+ create_session(): EvaluationSession` — firma del metodo che inizializza e registra una nuova sessione di valutazione nel sistema in memoria.


=== SaveEvaluationSession <SaveEvaluationSession>


#figure(
  image("../uml/png/Session/SaveEvaluationSession.png", width: 80%),
  caption: [Caso d'uso SaveEvaluationSession]
) <fig-save-evaluation-session>

Il diagramma illustra l'architettura del modulo dedicato al salvataggio dello stato di una sessione di valutazione corrente.

- Per la definizione di _EvaluationSessionController_, vedere la sezione @EvaluationSessionController. \
- Per la definizione di _Device_, vedere la sezione @Device. \
- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la sezione @InMemoryEvaluationSessionCache.

Di seguito vengono documentati esclusivamente i componenti introdotti specificamente per questo caso d'uso.



==== SaveEvaluationSessionUseCase
#figure(
  image("../uml/png/Session/SaveEvaluationSessionUseCase.png", width: 35%),
  caption: [SaveEvaluationSessionUseCase]
) <fig-save-evaluation-session-use-case>
*Descrizione*

_SaveEvaluationSessionUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per il salvataggio dello stato di una sessione di valutazione attiva. Viene implementata da _SaveEvaluationSessionService_ e utilizzata da _EvaluationSessionController_.

*Attributi*

_SaveEvaluationSessionUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ save(command: SaveEvaluationSessionCommand): void` — firma del metodo delegato all'esecuzione della logica di salvataggio della sessione a partire dal comando ricevuto in input.


==== SaveEvaluationSessionService
#figure(
  image("../uml/png/Session/SaveEvaluationSessionService.png", width: 40%),
  caption: [SaveEvaluationSessionService]
) <fig-save-evaluation-session-service>
*Descrizione*

_SaveEvaluationSessionService_ è il service applicativo appartenente all'Application Core responsabile del coordinamento dell'operazione di salvataggio. Implementa l'interfaccia _SaveEvaluationSessionUseCase_. Recupera la sessione corrente e ne richiede la persistenza aggiornata tramite la porta di uscita _SaveSessionPort_.

*Attributi*

_SaveEvaluationSessionService_ non definisce attributi propri.

*Metodi e funzioni*

- `+ save(command: SaveEvaluationSessionCommand): void` — concretizza il contratto definito da _SaveEvaluationSessionUseCase_. Coordina il salvataggio dello stato attuale della sessione di valutazione utilizzando i parametri incapsulati nel comando.


==== SaveEvaluationSessionCommand
#figure(
  image("../uml/png/Session/SaveEvaluationSessionCommand.png", width: 40%),
  caption: [SaveEvaluationSessionCommand]
) <fig-save-evaluation-session-command>
*Descrizione*

_SaveEvaluationSessionCommand_  incapsula i parametri necessari per richiedere il salvataggio di una sessione di valutazione. Serve a disaccoppiare i dati di input dalle firme dei metodi dei service.

*Attributi*

- `+ session_id: String` — l'identificativo univoco della sessione di valutazione di cui si richiede il salvataggio.

*Metodi e funzioni*

_SaveEvaluationSessionCommand_ non definisce metodi.

==== SaveSessionPort
#figure(
  image("../uml/png/Session/SaveSessionPort.png", width: 40%),
  caption: [SaveSessionPort]
) <fig-save-session-port>

_SaveSessionPort_ è l'interfaccia (Outbound Port) che definisce il contratto per la persistenza di una sessione di valutazione nel sistema di archiviazione (in questo caso, la cache in memoria). Viene implementata da _InMemoryEvaluationSessionCache_ e utilizzata da _SaveEvaluationSessionService_.

*Attributi*

_SaveSessionPort_ non definisce attributi.

*Metodi e funzioni*

- `+ save_session(session: EvaluationSession): void` — firma del metodo che sovrascrive o aggiorna lo stato di una sessione di valutazione nel sistema di persistenza.




=== CloseEvaluationSession <CloseEvaluationSession>


#figure(
  image("../uml/png/Session/CloseEvaluationSession.png", width: 100%),
  caption: [Caso d'uso CloseEvaluationSession]
) <fig-close-evaluation-session>

Il diagramma illustra l'architettura del modulo dedicato alla chiusura e all'eliminazione di una sessione di valutazione. 

- Per la definizione di _EvaluationSessionController_, vedere la sezione @EvaluationSessionController. \
- Per la definizione di _Device_, vedere la sezione @Device. \
- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la sezione @InMemoryEvaluationSessionCache.

Di seguito vengono documentati esclusivamente i componenti introdotti specificamente per questo caso d'uso.


==== CloseEvaluationSessionUseCase <CloseEvaluationSessionUseCase>

#figure(
  image("../uml/png/Session/CloseEvaluationSessionUseCase.png", width: 35%),
  caption: [CloseEvaluationSessionUseCase]
) <fig-close-evaluation-session-use-case>

*Descrizione*

_CloseEvaluationSessionUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per la chiusura definitiva di una sessione di valutazione attiva. Rappresenta l'operazione conclusiva del ciclo di vita della sessione e viene implementata da _CloseEvaluationSessionService_ e utilizzata dal controller _EvaluationSessionController_.

*Attributi*

_CloseEvaluationSessionUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ close(command: CloseEvaluationSessionCommand): void` — firma del metodo delegato all'esecuzione della logica di chiusura della sessione a partire dal comando ricevuto in input. 

==== CloseEvaluationSessionService
#figure(
  image("../uml/png/Session/CloseEvaluationSessionService.png", width: 35%),
  caption: [CloseEvaluationSessionService]
) <fig-close-evaluation-session-service>
*Descrizione*

_CloseEvaluationSessionService_ è il service applicativo appartenente all'Application Core responsabile della logica di chiusura della sessione. Implementa l'interfaccia _CloseEvaluationSessionUseCase_. Una volta eseguite le operazioni di dominio necessarie, richiede la rimozione della sessione dal sistema di persistenza richiamando la porta in uscita _DeleteSessionPort_.

*Attributi*

_CloseEvaluationSessionService_ non definisce attributi propri.

*Metodi e funzioni*

- `+ close(command: CloseEvaluationSessionCommand): void` — concretizza il contratto definito da _CloseEvaluationSessionUseCase_. Coordina le operazioni di chiusura e inoltra la richiesta di eliminazione della sessione utilizzando i parametri incapsulati nel comando.


==== CloseEvaluationSessionCommand
#figure(
  image("../uml/png/Session/CloseEvaluationSessionCommand.png", width: 40%),
  caption: [CloseEvaluationSessionCommand]
) <fig-close-evaluation-session-command>
*Descrizione*

_CloseEvaluationSessionCommand_  incapsula i parametri necessari per richiedere la chiusura di una sessione di valutazione. Serve a disaccoppiare i dati di input dalle firme dei metodi dei service applicativi.

*Attributi*

- `+ session_id: String` — l'identificativo univoco della sessione di valutazione di cui si richiede la chiusura e l'eliminazione.

*Metodi e funzioni*

_CloseEvaluationSessionCommand_ non definisce metodi.

==== DeleteSessionPort <DeleteSessionPort>
#figure(
  image("../uml/png/Session/DeleteSessionPort.png", width: 35%),
  caption: [DeleteSessionPort]
) <fig-delete-session-port>
*Descrizione*

_DeleteSessionPort_ è l'interfaccia (Outbound Port) che definisce il contratto per l'eliminazione di una sessione di valutazione dal sistema di archiviazione (es. la cache in memoria). Viene utilizzata da _CloseEvaluationSessionService_ e implementata nel livello di adapter da _InMemoryEvaluationSessionCache_.

*Attributi*

_DeleteSessionPort_ non definisce attributi.

*Metodi e funzioni*

- `+ delete_session(session_id: String): void` — firma del metodo che si occupa di rimuovere o invalidare lo stato di una specifica sessione di valutazione dal sistema di persistenza.

=== CommitEvaluationSession <CommitEvaluationSession>


#figure(
  image("../uml/png/Session/CommitEvaluationSession.png", width: 100%),
  caption: [Caso d'uso CommitEvaluationSession]
) <fig-commit-evaluation-session>

Il diagramma illustra l'architettura del modulo dedicato esclusivamente al consolidamento (commit) dei dati di una sessione di valutazione verso il dispositivo, senza richiederne la chiusura o l'eliminazione dalla memoria temporanea. 

- Per la definizione di _EvaluationSessionController_, vedere la sezione @EvaluationSessionController. \
- Per la definizione di _Device_, vedere la sezione @Device. \
- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la sezione @InMemoryEvaluationSessionCache. \
- Per la definizione di _MongoDeviceAdapter_, vedere la sezione @MongoDeviceAdapter. \
- Per la definizione di _SaveDevicePort_, vedere la sezione @SaveDevicePort. \
- Per la definizione di _GetSessionPort_, vedere la sezione @GetSessionPort.

Di seguito vengono documentati esclusivamente i componenti specifici introdotti per questo flusso operativo.


block(breakable: false)[
==== CommitEvaluationSessionService
#figure(
  image("../uml/png/Session/CommitEvaluationSessionService.png", width: 35%),
  caption: [CommitEvaluationSessionService]
) <fig-commit-evaluation-session-service>

_CommitEvaluationSessionService_ è il service applicativo dell'Application Core responsabile di orchestrare l'operazione di commit. Implementa l'interfaccia _CommitEvaluationSessionUseCase_. Coordina il recupero della sessione attualmente in corso (tramite la porta _GetSessionPort_), legge i dati necessari dal _CommitEvaluationSessionCommand_ e applica le modifiche definitive delegando il salvataggio all'entità dispositivo (tramite _SaveDevicePort_).

*Attributi*

_CommitEvaluationSessionService_ non definisce attributi propri.

*Metodi e funzioni*

- `+ commit(command: CommitEvaluationSessionCommand): void` — concretizza la logica di business relativa al consolidamento dei dati. Utilizza i parametri incapsulati nel comando per applicare le modifiche allo stato persistente del dispositivo.
]

==== CommitEvaluationSessionUseCase <CommitEvaluationSessionUseCase>
#figure(
  image("../uml/png/Session/CommitEvaluationSessionUseCase.png", width: 40%),
  caption: [CommitEvaluationSessionUseCase]
) <fig-commit-evaluation-session-use-case>
*Descrizione*

_CommitEvaluationSessionUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per eseguire il consolidamento (commit) dei dati di una sessione di valutazione attiva, applicando definitivamente le modifiche all'entità dispositivo associata. Viene implementata a livello applicativo e utilizzata dal controller _EvaluationSessionController_.

*Attributi*

_CommitEvaluationSessionUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ commit(command: CommitEvaluationSessionCommand): void` — firma del metodo delegato all'esecuzione della logica di consolidamento dei dati della sessione di valutazione a partire dal comando ricevuto in input.


==== CommitEvaluationSessionCommand
#figure(
  image("../uml/png/Session/CommitEvaluationSessionCommand.png", width: 40%),
  caption: [CommitEvaluationSessionCommand]
) <fig-commit-evaluation-session-command>
*Descrizione*

_CommitEvaluationSessionCommand_ incapsula i parametri necessari per richiedere il consolidamento (commit) di una sessione di valutazione. Serve a disaccoppiare i dati di input dalle firme dei metodi dei service applicativi.

*Attributi*

- `+ session_id: String` — l'identificativo univoco della sessione di valutazione di cui si richiede il consolidamento dei dati.

*Metodi e funzioni*

_CommitEvaluationSessionCommand_ non definisce metodi.
==== CommitCloseSession <CommitCloseSession>


#figure(
  image("../uml/png/Session/CommitCloseEvaluationSession.png", width: 100%),
  caption: [Caso d'uso CommitCloseSession]
) <fig-commit-close-session>

Il diagramma illustra l'architettura del modulo dedicato al consolidamento (commit) e alla contestuale chiusura di una sessione di valutazione.

- Per la definizione di _EvaluationSessionController_, vedere la sezione @EvaluationSessionController. \
- Per la definizione di _Device_, vedere la sezione @Device. \
- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la sezione @InMemoryEvaluationSessionCache. \
- Per la definizione di _MongoDeviceAdapter_, vedere la sezione @MongoDeviceAdapter. \
- Per la definizione di _CloseEvaluationSessionUseCase_, vedere la sezione @CloseEvaluationSessionUseCase. \
- Per la definizione di _DeleteSessionPort_, vedere la sezione @DeleteSessionPort. \
- Per la definizione di _SaveDevicePort_, vedere la sezione @SaveDevicePort. \
- Per la definizione di _CommitEvaluationSessionUseCase_, vedere la sezione @CommitEvaluationSessionUseCase.
Di seguito vengono documentati esclusivamente i componenti introdotti o aggregati specificamente per questo flusso operativo.


#block(breakable: false)[
==== CommitCloseEvaluationSessionService
#figure(
  image("../uml/png/Session/CommitCloseEvaluationSessionService.png", width: 40%),
  caption: [CommitCloseEvaluationSessionService]
) <fig-commit-close-evaluation-session-service>
*Descrizione*

_CommitCloseEvaluationSessionService_ è il service applicativo dell'Application Core responsabile di orchestrare le operazioni combinate. Fungendo da implementazione per i casi d'uso di commit e chiusura, coordina il recupero della sessione in corso (tramite _GetSessionPort_), il salvataggio dei risultati consolidati sul dispositivo (tramite _SaveDevicePort_) e, in caso di successo, la rimozione della sessione attiva (tramite _DeleteSessionPort_).

*Attributi*

_CommitCloseEvaluationSessionService_ non definisce attributi propri.

*Metodi e funzioni*

- `+ commit_and_close(session_id: String): void` — concretizza la logica di business principale. Prende in input l'identificativo della sessione, ne effettua il commit dei dati sull'entità _Device_ e successivamente procede con l'eliminazione della sessione dalla memoria temporanea.
]


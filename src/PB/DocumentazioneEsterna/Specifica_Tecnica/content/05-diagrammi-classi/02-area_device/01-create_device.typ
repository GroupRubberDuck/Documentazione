=== CreateDevice <CreateDevice>

#figure(
  image("../uml/png/CreateDevice/CreateDevice.png", width: 100%),
  caption: [ Caso d'uso CreateDevice],
) <fig-create-device>

Il diagramma illustra l'architettura del modulo di creazione dei Dispositivi secondo i principi dell'architettura esagonale.
- Per la definizione di _Device_, vedere la sezione @Device. \

==== FlaskWriteDeviceController <FlaskWriteDeviceController>

#figure(
  image("../uml/png/CreateDevice/FlaskWriteDeviceController.png", width: 45%),
  caption: [FlaskWriteDeviceController],
) <fig-write-device-controller>

*Descrizione*

_FlaskWriteDeviceController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP relative alla gestione dei Dispositivi e le inoltra al livello applicativo.

*Attributi*

- `- create_device_use_case: CreateDeviceUseCase` — inbound port usata per la creazione di un device
- `- update_device_use_case: UpdateDeviceUseCase` — inbound port usata per la modifica di un device
- `- delete_device_use_case: DeleteDeviceUseCase` — inbound port usata per l'eliminazione di un device

*Metodi*

- `+ create_device(req: Request): Response` — riceve la richiesta HTTP di creazione di un nuovo Dispositivo, estrae i dati dal corpo della richiesta e li inoltra al livello applicativo; restituisce una risposta HTTP con l'esito dell'operazione.
- `+ update_device(req: Request): Response` — riceve la richiesta HTTP di modifica di un Dispositivo esistente, estrae i dati aggiornati e li inoltra al livello applicativo; restituisce una risposta HTTP con l'esito dell'operazione.
- `+ delete_device(req: Request): Response` — riceve la richiesta HTTP di eliminazione di un Dispositivo, estrae l'identificativo dalla richiesta e lo inoltra al livello applicativo; restituisce una risposta HTTP con l'esito dell'operazione.

==== CreateDeviceUseCase

#figure(
  image("../uml/png/CreateDevice/CreateDeviceUseCase.png", width: 35%),
  caption: [ CreateDeviceUseCase],
) <fig-create-device-use-case>

*Descrizione*

_CreateDeviceUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per la creazione di un nuovo Dispositivo. Viene implementata da _CreateDeviceService_ e utilizzata da _FlaskWriteDeviceController_.

*Attributi*

_CreateDeviceUseCase_ non definisce attributi.

*Metodi*

- `+ create(command: CreateDeviceCommand): void` — firma del metodo delegato all'esecuzione della logica di creazione a partire dai dati contenuti nel comando.

==== CreateDeviceCommand

#figure(
  image("../uml/png/CreateDevice/CreateDeviceCommand.png", width: 35%),
  caption: [CreateDeviceCommand],
) <fig-create-device-command>

*Descrizione*

_CreateDeviceCommand_ è il Command Object che veicola i dati necessari alla creazione di un Dispositivo dal controller al service. L'uso di questo pattern separa la struttura dei dati in ingresso dall'entità di dominio, rendendo esplicita l'intenzione dell'operazione.

*Attributi*

- `+ device_name: String` — nome del nuovo Dispositivo.
- `+ device_os: String` — sistema operativo del Dispositivo.
- `+ device_description: String` — descrizione testuale del Dispositivo.
- `+ standard_id: String` — identificativo dello standard di conformità associato.

*Metodi*

_CreateDeviceCommand_ non definisce metodi.

==== CreateDeviceService

#figure(
  image("../uml/png/CreateDevice/CreateDeviceService.png", width: 45%),
  caption: [CreateDeviceService],
) <fig-create-device-service>

*Descrizione*

_CreateDeviceService_ è il service applicativo appartenente all'Application Core responsabile della logica di creazione di un Dispositivo. Implementa l'interfaccia _CreateDeviceUseCase_, riceve il comando in ingresso, costruisce l'entità di dominio e ne coordina la persistenza tramite _RegisterDevicePort_.

*Attributi*

- `- register_device_port: RegisterDevicePort` — porta outbound utilizzata per la persistenza del nuovo Dispositivo.

*Metodi*

- `+ create(command: CreateDeviceCommand): void` — concretizza il contratto definito da _CreateDeviceUseCase_. Mappa i dati del comando nell'entità _Device_ e ne richiede la registrazione tramite _RegisterDevicePort_.

==== RegisterDevicePort <RegisterDevicePort>

#figure(
  image("../uml/png/CreateDevice/RegisterDevicePort.png", width: 35%),
  caption: [RegisterDevicePort],
) <fig-register-device-port>

*Descrizione*

_RegisterDevicePort_ è l'interfaccia (Outbound Port) che definisce il contratto per la registrazione di un nuovo Dispositivo nel sistema di persistenza. Viene implementata da _MongoDeviceAdapter_ e utilizzata da _CreateDeviceService_.

*Attributi*

_RegisterDevicePort_ non definisce attributi.

*Metodi*

- `+ register(device: Device): void` — firma del metodo che esegue l'inserimento fisico del Dispositivo nel sistema di persistenza.

==== MongoDeviceAdapter <MongoDeviceAdapter>

#figure(
  image("../uml/png/CreateDevice/MongoDeviceAdapter.png", width: 45%),
  caption: [MongoDeviceAdapter],
) <fig-mongo-device-adapter>

*Descrizione*

_MongoDeviceAdapter_ è la classe dell'Outbound Adapter che implementa le porte outbound del sistema, traducendo le operazioni del dominio in interazioni concrete con MongoDB tramite `pymongo.Collection`.

*Attributi*

- `- collection: pymongo.Collection` — riferimento alla collezione MongoDB su cui vengono eseguite le operazioni di persistenza.

*Metodi*

- `+ save(device: Device): void` — salva le modifiche a un Dispositivo esistente nella collezione.
- `+ register(device: Device): void` — inserisce un nuovo Dispositivo nella collezione.
- `+ delete(device_id: String): void` — rimuove il Dispositivo identificato da `device_id` dalla collezione.
- `+ find_by_id(device_id: String): Device` — recupera il Dispositivo corrispondente all'identificativo fornito.
- `+ find_all(): List<DeviceSummary>` — recupera la lista sintetica di tutti i Dispositivi presenti nella collezione.


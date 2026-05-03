
== Device <classe_disp>


/*
// #image("../uml/png/classe_dispositivo.png")

Il diagramma delle classi illustra la progettazione architetturale per il modulo di Gestione dei Dispositivi.

+ #[*Inbound Adapter*

  Il pacchetto Inbound Adapter rappresenta il punto di contatto con l'utente. Contiene il DispositivoController, sviluppato con il framework Flask. Il suo unico compito è ricevere le richieste HTTP, tradurle in un formato comprensibile al sistema e restituire una risposta web. Questo livello non prende nessuna decisione logica.
]
+ #[ *Application Core e Ports*

  Al centro del diagramma si trova la logica vera e propria del software. Per proteggere questa parte centrale, essa comunica con l'esterno unicamente tramite delle Porte rappresentate da interfacce:

    `InterfaceDispositivoUseCase` (Inbound Port): È l'elenco dei servizi offerti all'utente. Il Controller "utilizza" questa porta per inviare i comandi, senza aver bisogno di sapere come verranno eseguiti.

    `DispositivoService` (Service): È la classe che svolge il lavoro reale. Riceve i comandi dalla porta Inbound, crea le entità (`Dispositivo`) e verifica che i dati rispettino le regole del progetto tramite un metodo privato dedicato (`validaRegoleBusiness`).

    `InterfaceDispositivoRepository` (Outbound Port): Quando il Service ha finito i controlli e deve salvare i dati, non contatta direttamente il database. Usa invece questa porta di uscita, che dichiara solo il bisogno di salvare o leggere un dato, senza specificare la tecnologia.
]
#[ *Outbound Adapter*

  Il pacchetto Outbound Adapter contiene il `MongoDispositivoAdapter`. Questa classe implementa il contratto richiesto dalla porta in uscita e traduce gli oggetti del programma in documenti fisici salvati su MongoDB.

]
*/

#block(breakable: false)[
=== WriteDeviceModule
#figure(
  image("../uml/png/CreateDevice/WriteDeviceModule.png", width: 100%),
  caption: [ Modulo di scrittura Dispositivi]
) <fig-write-device-module>

Il diagramma offre una visione d'insieme del modulo di scrittura per la gestione dei Dispositivi, mostrando come i tre casi d'uso — _CreateDevice_, _SaveDevice_ e _DeleteDevice_ — condividano gli stessi componenti infrastrutturali (_WriteDeviceController_ e _MongoDeviceAdapter_) pur introducendo ciascuno le proprie interfacce e service dedicati. I componenti sono descritti in dettaglio nelle sezioni seguenti.
]
=== CreateDevice <CreateDevice>

#figure(
  image("../uml/png/CreateDevice/CreateDevice.png", width: 100%),
  caption: [ Caso d'uso CreateDevice]
) <fig-create-device>

Il diagramma illustra l'architettura del modulo di scrittura per la gestione dei Dispositivi, coprendo le operazioni di creazione, modifica ed eliminazione secondo i principi dell'architettura esagonale.

==== WriteDeviceController <WriteDeviceController>

#figure(
  image("../uml/png/CreateDevice/WriteDeviceController.png", width: 45%),
  caption: [WriteDeviceController]
) <fig-write-device-controller>

*Descrizione*

_WriteDeviceController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP relative alla gestione dei Dispositivi e le inoltra al livello applicativo.

*Attributi*

_WriteDeviceController_ non definisce attributi propri.

*Metodi e funzioni*

- `+ create_device(req: Request): Response` — riceve la richiesta HTTP di creazione di un nuovo Dispositivo, estrae i dati dal corpo della richiesta e li inoltra al livello applicativo; restituisce una risposta HTTP con l'esito dell'operazione.
- `+ save_device(req: Request): Response` — riceve la richiesta HTTP di modifica di un Dispositivo esistente, estrae i dati aggiornati e li inoltra al livello applicativo; restituisce una risposta HTTP con l'esito dell'operazione.
- `+ delete_device(req: Request): Response` — riceve la richiesta HTTP di eliminazione di un Dispositivo, estrae l'identificativo dalla richiesta e lo inoltra al livello applicativo; restituisce una risposta HTTP con l'esito dell'operazione.

==== CreateDeviceUseCase

#figure(
  image("../uml/png/CreateDevice/CreateDeviceUseCase.png", width: 35%),
  caption: [ CreateDeviceUseCase]
) <fig-create-device-use-case>

*Descrizione*

_CreateDeviceUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per la creazione di un nuovo Dispositivo. Viene implementata da _CreateDeviceService_ e utilizzata da _WriteDeviceController_.

*Attributi*

_CreateDeviceUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ create(command: CreateDeviceCommand): void` — firma del metodo delegato all'esecuzione della logica di creazione a partire dai dati contenuti nel comando.

==== CreateDeviceCommand

#figure(
  image("../uml/png/CreateDevice/CreateDeviceCommand.png", width: 35%),
  caption: [CreateDeviceCommand]
) <fig-create-device-command>

*Descrizione*

_CreateDeviceCommand_ è il Command Object che veicola i dati necessari alla creazione di un Dispositivo dal controller al service. L'uso di questo pattern separa la struttura dei dati in ingresso dall'entità di dominio, rendendo esplicita l'intenzione dell'operazione.

*Attributi*

- `+ device_name: String` — nome del nuovo Dispositivo.
- `+ device_os: String` — sistema operativo del Dispositivo.
- `+ device_description: String` — descrizione testuale del Dispositivo.
- `+ compliance_standard_id: String` — identificativo dello standard di conformità associato.

*Metodi e funzioni*

_CreateDeviceCommand_ non definisce metodi.

==== CreateDeviceService

#figure(
  image("../uml/png/CreateDevice/CreateDeviceService.png", width: 45%),
  caption: [CreateDeviceService]
) <fig-create-device-service>

*Descrizione*

_CreateDeviceService_ è il service applicativo appartenente all'Application Core responsabile della logica di creazione di un Dispositivo. Implementa l'interfaccia _CreateDeviceUseCase_, riceve il comando in ingresso, costruisce l'entità di dominio e ne coordina la persistenza tramite _RegisterDevicePort_.

*Attributi*

- `- register_device_port: RegisterDevicePort` — porta outbound utilizzata per la persistenza del nuovo Dispositivo.

*Metodi e funzioni*

- `+ create(command: CreateDeviceCommand): void` — concretizza il contratto definito da _CreateDeviceUseCase_. Mappa i dati del comando nell'entità _Device_ e ne richiede la registrazione tramite _RegisterDevicePort_.

==== Device <Device>

#figure(
  image("../uml/png/CreateDevice/Device.png", width: 35%),
  caption: [Device]
) <fig-device>

*Descrizione*

_Device_ è l'entità centrale del dominio che rappresenta il Dispositivo oggetto della valutazione di conformità. È associata alla classe _Asset_ con una relazione di composizione avente cardinalità `1..*`.

*Attributi*

- `- id: String` — identificativo univoco del Dispositivo.
- `- name: String` — nome del Dispositivo.
- `- operating_system: String` — sistema operativo.
- `- description: String` — descrizione testuale.
- `- assets: List<Asset>` — lista degli asset associati al Dispositivo.

*Metodi e funzioni*

- `+ add_asset(asset: Asset): void` — aggiunge un _Asset_ alla lista del Dispositivo.
- `+ remove_asset(asset_id: String): void` — rimuove l'_Asset_ identificato da `asset_id` dalla lista del Dispositivo.

==== RegisterDevicePort

#figure(
  image("../uml/png/CreateDevice/RegisterDevicePort.png", width: 35%),
  caption: [RegisterDevicePort]
) <fig-register-device-port>

*Descrizione*

_RegisterDevicePort_ è l'interfaccia (Outbound Port) che definisce il contratto per la registrazione di un nuovo Dispositivo nel sistema di persistenza. Viene implementata da _MongoDeviceAdapter_ e utilizzata da _CreateDeviceService_.

*Attributi*

_RegisterDevicePort_ non definisce attributi.

*Metodi e funzioni*

- `+ register(device: Device): void` — firma del metodo che esegue l'inserimento fisico del Dispositivo nel sistema di persistenza.

==== MongoDeviceAdapter <MongoDeviceAdapter>

#figure(
  image("../uml/png/CreateDevice/MongoDeviceAdapter.png", width: 45%),
  caption: [MongoDeviceAdapter]
) <fig-mongo-device-adapter>

*Descrizione*

_MongoDeviceAdapter_ è la classe dell'Outbound Adapter che implementa le porte outbound del sistema, traducendo le operazioni del dominio in interazioni concrete con MongoDB tramite `pymongo.Collection`.

*Attributi*

- `- collection: pymongo.Collection` — riferimento alla collezione MongoDB su cui vengono eseguite le operazioni di persistenza.

*Metodi e funzioni*

- `+ save(device: Device): void` — salva le modifiche a un Dispositivo esistente nella collezione.
- `+ register(device: Device): void` — inserisce un nuovo Dispositivo nella collezione.
- `+ delete(device_id: String): void` — rimuove il Dispositivo identificato da `device_id` dalla collezione.
- `+ find_by_id(device_id: String): Device` — recupera il Dispositivo corrispondente all'identificativo fornito.
- `+ find_all(): List<DeviceSummary>` — recupera la lista sintetica di tutti i Dispositivi presenti nella collezione.

=== DeleteDevice

#figure(
  image("../uml/png/DeleteDevice/DeleteDevice.png", width: 100%),
  caption: [Caso d'uso DeleteDevice]
) <fig-delete-device>

Il diagramma illustra l'architettura del modulo dedicato all'eliminazione di un Dispositivo. 

- Per la definizione di _WriteDeviceController_, vedere la sezione @WriteDeviceController. \
- Per la definizione di _Device_, vedere la sezione @Device. \
- Per la definizione di _MongoDeviceAdapter_, vedere la sezione @MongoDeviceAdapter.

Di seguito vengono documentati esclusivamente i componenti introdotti specificamente per questo caso d'uso.
==== DeleteDeviceUseCase
#figure(
  image("../uml/png/DeleteDevice/DeleteDeviceUseCase.png", width: 40%),
  caption: [DeleteDeviceUseCase]
) <fig-delete-device-use-case>
*Descrizione*

_DeleteDeviceUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per l'eliminazione di un Dispositivo. Viene implementata da _DeleteDeviceService_ e utilizzata da _WriteDeviceController_.

*Attributi*

_DeleteDeviceUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ delete(device_id: String): void` — firma del metodo delegato all'esecuzione della logica di eliminazione a partire dall'identificativo del Dispositivo.

==== DeleteDeviceService

#figure(
  image("../uml/png/DeleteDevice/DeleteDeviceService.png", width: 40%),
  caption: [DeleteDeviceService]
) <fig-delete-device-service>

*Descrizione*

_DeleteDeviceService_ è il service applicativo appartenente all'Application Core responsabile della logica di eliminazione di un Dispositivo. Implementa l'interfaccia _DeleteDeviceUseCase_ e, a differenza del servizio di creazione, non richiede un Command Object: riceve direttamente l'identificativo del Dispositivo e ne coordina la rimozione dal sistema.

*Attributi*

_DeleteDeviceService_ non definisce attributi propri.

*Metodi e funzioni*

- `+ delete(device_id: String): void` — riceve l'identificativo univoco del Dispositivo e ne coordina la rimozione tramite _DeleteDevicePort_.

==== DeleteDevicePort

#figure(
  image("../uml/png/DeleteDevice/DeleteDevicePort.png", width: 40%),
  caption: [DeleteDevicePort]
) <fig-delete-device-port>
*Descrizione*

_DeleteDevicePort_ è l'interfaccia (Outbound Port) che definisce il contratto per la rimozione fisica di un Dispositivo dal sistema di persistenza. Viene implementata da _MongoDeviceAdapter_ e utilizzata da _DeleteDeviceService_.

*Attributi*

_DeleteDevicePort_ non definisce attributi.

*Metodi e funzioni*

- `+ delete(device_id: String): void` — firma del metodo che esegue la rimozione fisica del Dispositivo identificato da `device_id` dal sistema di persistenza.


// SAVEE

=== SaveDevice <SaveDevice>

#block(breakable: false)[
#figure(
  image("../uml/png/SaveDevice/SaveDevice.png", width: 100%),
  caption: [Caso d'uso SaveDevice]
) <fig-save-device>

Il diagramma illustra l'architettura del modulo dedicato alla modifica e al salvataggio dello stato di un Dispositivo esistente. 

- Per la definizione di _WriteDeviceController_, vedere la sezione @WriteDeviceController. \
- Per la definizione di _Device_, vedere la sezione @Device. \
- Per la definizione di _MongoDeviceAdapter_, vedere la sezione @MongoDeviceAdapter.

Di seguito vengono documentati esclusivamente i componenti introdotti specificamente per questo caso d'uso.
]
==== SaveDeviceUseCase
#block(breakable: false)[
#figure(
  image("../uml/png/SaveDevice/SaveDeviceUseCase.png", width: 40%),
  caption: [SaveDeviceUseCase]
) <fig-save-device-use-case>
*Descrizione*

_SaveDeviceUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per la modifica di un Dispositivo esistente. Viene implementata da _SaveDeviceService_ e utilizzata da _WriteDeviceController_.

*Attributi*

_SaveDeviceUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ save(command: SaveDeviceCommand): void` — firma del metodo delegato all'esecuzione della logica di aggiornamento a partire dai dati contenuti nel comando.
]
==== SaveDeviceCommand
#block(breakable: false)[
#figure(
  image("../uml/png/SaveDevice/SaveDeviceCommand.png", width: 35%),
  caption: [SaveDeviceCommand]
) <fig-save-device-command>

*Descrizione*

_SaveDeviceCommand_ è il Command Object che veicola i dati necessari alla modifica di un Dispositivo dal controller al service. Analogamente a _CreateDeviceCommand_, separa la struttura dei dati in ingresso dall'entità di dominio.

*Attributi*

- `+ device_name: String` — nome aggiornato del Dispositivo.
- `+ device_os: String` — sistema operativo aggiornato.
- `+ device_description: String` — descrizione testuale aggiornata.

*Metodi e funzioni*

_SaveDeviceCommand_ non definisce metodi.
]
==== SaveDeviceService
#block(breakable: false)[
#figure(
  image("../uml/png/SaveDevice/SaveDeviceService.png", width: 45%),
  caption: [SaveDeviceService]
) <fig-save-device-service>

*Descrizione*

_SaveDeviceService_ è il service applicativo appartenente all'Application Core responsabile della logica di aggiornamento di un Dispositivo esistente. Implementa l'interfaccia _SaveDeviceUseCase_, riceve il comando in ingresso e ne coordina la persistenza tramite _SaveDevicePort_.

*Attributi*

_SaveDeviceService_ non definisce attributi propri.
\
*Metodi e funzioni*
]
- `+ save(command: SaveDeviceCommand): void` — concretizza il contratto definito da _SaveDeviceUseCase_. Mappa i dati del comando nell'entità _Device_ e ne richiede l'aggiornamento tramite _SaveDevicePort_.

==== SaveDevicePort <SaveDevicePort>
#block(breakable: false)[
#figure(
  image("../uml/png/SaveDevice/SaveDevicePort.png", width: 30%),
  caption: [SaveDevicePort]
) <fig-save-device-port>
*Descrizione*

_SaveDevicePort_ è l'interfaccia (Outbound Port) che definisce il contratto per l'aggiornamento fisico di un Dispositivo nel sistema di persistenza. Viene implementata da _MongoDeviceAdapter_ e utilizzata da _SaveDeviceService_.
]
*Attributi*

_SaveDevicePort_ non definisce attributi.

*Metodi e funzioni*

- `+ save(device: Device): void` — firma del metodo che esegue l'aggiornamento fisico del Dispositivo nel sistema di persistenza.


=== ReadDeviceModule <ReadDeviceModule>

#block(breakable: false)[
#figure(
  image("../uml/png/GetDeviceDetail/QueryDeviceModule.png", width: 100%),
  caption: [Modulo di lettura Dispositivi]
) <fig-read-device-module>

Il diagramma illustra l'architettura del modulo di lettura per la gestione dei Dispositivi, coprendo le operazioni di recupero del dettaglio di un singolo Dispositivo e della lista sintetica di tutti i Dispositivi registrati. 

- Per la definizione di _Device_, vedere la sezione @Device. \
- Per la definizione di _MongoDeviceAdapter_, vedere la sezione @MongoDeviceAdapter.

Di seguito vengono documentati esclusivamente i componenti introdotti specificamente per questo modulo.
]
=== GetDeviceDetail

#figure(
  image("../uml/png/GetDeviceDetail/GetDeviceDetail.png", width: 100%),
  caption: [GetDeviceDetail]
) <fig-get-device-detail>

Il diagramma illustra l'architettura del modulo dedicato al recupero del dettaglio di un Dispositivo.
 - Per la definizione di _Device_, vedere la sezione @Device. \
- Per la definizione di _MongoDeviceAdapter_, vedere la sezione @MongoDeviceAdapter. 
Di seguito vengono documentati esclusivamente i componenti introdotti specificamente per questo caso d'uso.

==== QueryDeviceController <QueryDeviceController>

#figure(
  image("../uml/png/GetDeviceDetail/QueryDeviceController.png", width: 45%),
  caption: [QueryDeviceController]
) <fig-query-device-controller>

*Descrizione*

_QueryDeviceController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP di lettura relative ai Dispositivi e le inoltra al livello applicativo.

*Attributi*

_QueryDeviceController_ non definisce attributi propri.

*Metodi e funzioni*

- `+ get_device_list(req: Request): Response` — riceve la richiesta HTTP di recupero della lista dei Dispositivi e restituisce una risposta HTTP con l'elenco sintetico.
- `+ get_device_detail(req: Request): Response` — riceve la richiesta HTTP di recupero del dettaglio di un Dispositivo specifico e restituisce una risposta HTTP con i dati completi.

==== GetDeviceDetailUseCase
#figure(
  image("../uml/png/GetDeviceDetail/GetDeviceDetailUseCase.png", width: 35%),
  caption: [GetDeviceDetailUseCase]
) <fig-get-device-detail-use-case>
*Descrizione*

_GetDeviceDetailUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per il recupero del dettaglio di un Dispositivo. Viene implementata da _GetDeviceDetailService_ e utilizzata da _QueryDeviceController_.

*Attributi*

_GetDeviceDetailUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ get_device(device_id: String): Device` — firma del metodo delegato al recupero del Dispositivo corrispondente all'identificativo fornito.

==== GetDeviceDetailService

#figure(
  image("../uml/png/GetDeviceDetail/GetDeviceDetailService.png", width: 45%),
  caption: [GetDeviceDetailService]
) <fig-get-device-detail-service>

*Descrizione*

_GetDeviceDetailService_ è il service applicativo appartenente all'Application Core responsabile del recupero del dettaglio di un Dispositivo. Implementa l'interfaccia _GetDeviceDetailUseCase_ e coordina il recupero dei dati tramite la porta outbound _FindDevicePort_.

*Attributi*

_GetDeviceDetailService_ non definisce attributi propri.

*Metodi e funzioni*

- `+ get_device(device_id: String): Device` — concretizza il contratto definito da _GetDeviceDetailUseCase_. Recupera il Dispositivo corrispondente all'identificativo fornito tramite _FindDevicePort_.

==== FindDevicePort <FindDevicePort>
#figure(
  image("../uml/png/GetDeviceDetail/FindDevicePort.png", width: 35%),
  caption: [FindDevicePort]
) <fig-find-device-port>
*Descrizione*

_FindDevicePort_ è l'interfaccia (Outbound Port) che definisce il contratto per il recupero di un Dispositivo dal sistema di persistenza. Viene implementata da _MongoDeviceAdapter_ e utilizzata da _GetDeviceDetailService_.

*Attributi*

_FindDevicePort_ non definisce attributi.

*Metodi e funzioni*

- `+ find_by_id(device_id: String): Device` — firma del metodo che recupera il Dispositivo corrispondente all'identificativo fornito dal sistema di persistenza.

=== GetDeviceList

#block(breakable: false)[
#figure(
  image("../uml/png/GetDeviceList/GetDeviceList.png", width: 100%),
  caption: [Caso d'uso GetDeviceList]
) <fig-get-device-list>

Il diagramma illustra l'architettura del modulo dedicato al recupero della lista sintetica dei Dispositivi. 

Per la definizione di _QueryDeviceController_, vedere la sezione @QueryDeviceController. \
Per la definizione di _Device_, vedere la sezione @Device. \
Per la definizione di _MongoDeviceAdapter_, vedere la sezione @MongoDeviceAdapter.

Di seguito vengono documentati esclusivamente i componenti introdotti specificamente per questo caso d'uso.
]

#block(breakable: false)[
==== GetDeviceListUseCase
#figure(
  image("../uml/png/GetDeviceList/GetDeviceListUseCase.png", width: 35%),
  caption: [GetDeviceListUseCase]
) <fig-get-device-list-use-case>
*Descrizione*

_GetDeviceListUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per il recupero della lista sintetica dei Dispositivi. Viene implementata da _GetDeviceListService_ e utilizzata da _QueryDeviceController_.

*Attributi*

_GetDeviceListUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ get_list(): List<DeviceSummary>` — firma del metodo delegato al recupero della lista sintetica di tutti i Dispositivi presenti nel sistema.
]

#block(breakable: false)[
==== GetDeviceListService

#figure(
  image("../uml/png/GetDeviceList/GetDeviceListService.png", width: 45%),
  caption: [GetDeviceListService]
) <fig-get-device-list-service>

*Descrizione*

_GetDeviceListService_ è il service applicativo appartenente all'Application Core responsabile del recupero della lista sintetica dei Dispositivi. Implementa l'interfaccia _GetDeviceListUseCase_ e coordina il recupero tramite la porta outbound _FindAllDevicesPort_.

*Attributi*

- `- find_port: FindAllDevicesPort` — porta outbound utilizzata per il recupero della lista dei Dispositivi dal sistema di persistenza.

*Metodi e funzioni*

- `+ get_list(): List<DeviceSummary>` — concretizza il contratto definito da _GetDeviceListUseCase_. Recupera la lista sintetica di tutti i Dispositivi tramite _FindAllDevicesPort_.
]

#block(breakable: false)[
==== DeviceSummary
#figure(
  image("../uml/png/GetDeviceList/DeviceSummary.png", width: 30%),
  caption: [DeviceSummary]
) <fig-device-summary>
*Descrizione*

_DeviceSummary_ è il Data Transfer Object che veicola la rappresentazione sintetica di un Dispositivo verso il livello di presentazione. Espone esclusivamente le informazioni necessarie alla visualizzazione in lista, evitando di esporre l'intera entità di dominio.

*Attributi*

- `- name: String` — nome del Dispositivo.

*Metodi e funzioni*

_DeviceSummary_ non definisce metodi.
]

#block(breakable: false)[
==== FindAllDevicesPort
#figure(
  image("../uml/png/GetDeviceList/FindAllDevicesPort.png", width: 45%),
  caption: [FindAllDevicesPort]
) <fig-find-all-devices-port>
*Descrizione*

_FindAllDevicesPort_ è l'interfaccia (Outbound Port) che definisce il contratto per il recupero della lista sintetica di tutti i Dispositivi dal sistema di persistenza. Viene implementata da _MongoDeviceAdapter_ e utilizzata da _GetDeviceListService_.

*Attributi*

_FindAllDevicesPort_ non definisce attributi.

*Metodi e funzioni*

- `+ find_all(): List<DeviceSummary>` — firma del metodo che recupera la lista sintetica di tutti i Dispositivi presenti nel sistema di persistenza.
]


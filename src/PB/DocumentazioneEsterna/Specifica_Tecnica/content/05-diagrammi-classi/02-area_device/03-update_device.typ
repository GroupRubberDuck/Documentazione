=== UpdateDevice <UpdateDevice>


#figure(
  image("../uml/png/UpdateDevice/UpdateDevice.png", width: 100%),
  caption: [Caso d'uso UpdateDevice],
) <fig-update-device>

Il diagramma illustra l'architettura del modulo dedicato alla modifica e al salvataggio dello stato di un Dispositivo esistente.

- Per la definizione di _FlaskWriteDeviceController_, vedere la @FlaskWriteDeviceController. \
- Per la definizione di _Device_, vedere la @Device. \
- Per la definizione di _MongoDeviceAdapter_, vedere la @MongoDeviceAdapter.

Di seguito vengono documentati esclusivamente i componenti introdotti specificamente per questo caso d'uso.

==== UpdateDeviceUseCase

#figure(
  image("../uml/png/UpdateDevice/UpdateDeviceUseCase.png", width: 40%),
  caption: [UpdateDeviceUseCase],
) <fig-update-device-use-case>
*Descrizione*

_UpdateDeviceUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per la modifica di un Dispositivo esistente. Viene implementata da _UpdateDeviceService_ e utilizzata da _FlaskWriteDeviceController_.

*Attributi*

_UpdateDeviceUseCase_ non definisce attributi.

*Metodi*

- `update_device(command: UpdateDeviceCommand)` — firma del metodo delegato all'esecuzione della logica di aggiornamento a partire dai dati contenuti nel comando.

==== UpdateDeviceCommand

#figure(
  image("../uml/png/UpdateDevice/UpdateDeviceCommand.png", width: 35%),
  caption: [UpdateDeviceCommand],
) <fig-update-device-command>

*Descrizione*

_UpdateDeviceCommand_ è il Command Object che veicola i dati necessari alla modifica di un Dispositivo dal controller al service. Analogamente a _CreateDeviceCommand_, separa la struttura dei dati in ingresso dall'entità di dominio.

*Attributi*

- `+ device_id: String` — identificativo univoco del Dispositivo da aggiornare.
- `+ device_name: String` — nome aggiornato del Dispositivo.
- `+ device_os: String` — sistema operativo aggiornato.
- `+ device_description: String` — descrizione testuale aggiornata.

*Metodi*

_UpdateDeviceCommand_ non definisce metodi.

==== UpdateDeviceService

#figure(
  image("../uml/png/UpdateDevice/UpdateDeviceService.png", width: 45%),
  caption: [UpdateDeviceService],
) <fig-update-device-service>

*Descrizione*

_UpdateDeviceService_ è il service applicativo appartenente all'Application Core responsabile della logica di aggiornamento di un Dispositivo esistente. Implementa l'interfaccia _UpdateDeviceUseCase_, riceve il comando in ingresso e ne coordina la persistenza tramite _SaveDevicePort_.

*Attributi*

- `- find_device_port: FindDevicePort` — utilizza la porta di outbound per prelevare il device
- `- save_device_port: SaveDevicePort` — utilizza la porta di outbound per salvare le modifiche

*Metodi*

- `+ update_device(command: UpdateDeviceCommand): void` — concretizza il contratto definito da _SaveDeviceUseCase_. Mappa i dati del comando nell'entità _Device_ e ne richiede l'aggiornamento tramite _SaveDevicePort_.

==== SaveDevicePort <SaveDevicePort>

#figure(
  image("../uml/png/UpdateDevice/SaveDevicePort.png", width: 30%),
  caption: [SaveDevicePort],
) <fig-save-device-port>
*Descrizione*

_SaveDevicePort_ è l'interfaccia (Outbound Port) che definisce il contratto per l'aggiornamento fisico di un Dispositivo nel sistema di persistenza. Viene implementata da _MongoDeviceAdapter_ e utilizzata da _UpdateDeviceService_.

*Attributi*

_UpdateDevicePort_ non definisce attributi.

*Metodi*

- `+ save(device: Device): void` — firma del metodo che esegue l'aggiornamento fisico del Dispositivo nel sistema di persistenza.

==== FindDevicePort <FindDevicePort>

#figure(
  image("../uml/png/UpdateDevice/FindDevicePort.png", width: 50%),
  caption: [FindDevicePort],
) <fig-find-device-port>
*Descrizione*

_FindDevicePort_ è l'interfaccia (Outbound Port) che definisce il contratto per prelevare un Device tramite id. Viene implementata da _MongoDeviceAdapter_ e utilizzata da _UpdateDeviceService_.

*Attributi*

_FindDevicePort_ non definisce attributi.

*Metodi*

- `+ find_by_id(device_id: String): Device` — firma del metodo che esegue l'aggiornamento fisico del Dispositivo nel sistema di persistenza.
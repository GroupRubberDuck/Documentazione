=== DeleteDevice

#figure(
  image("../uml/png/DeleteDevice/DeleteDevice.png", width: 90%),
  caption: [Caso d'uso DeleteDevice],
) <fig-delete-device>

Il diagramma illustra l'architettura del modulo dedicato all'eliminazione di un Dispositivo.

- Per la definizione di _FlaskWriteDeviceController_, vedere la @FlaskWriteDeviceController. \
- Per la definizione di _Device_, vedere la @Device. \
- Per la definizione di _MongoDeviceAdapter_, vedere la @MongoDeviceAdapter.

Di seguito vengono documentati esclusivamente i componenti introdotti specificamente per questo caso d'uso.
==== DeleteDeviceUseCase
#figure(
  image("../uml/png/DeleteDevice/DeleteDeviceUseCase.png", width: 70%),
  caption: [DeleteDeviceUseCase],
) <fig-delete-device-use-case>
*Descrizione*

_DeleteDeviceUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per l'eliminazione di un Dispositivo. Viene implementata da _DeleteDeviceService_ e utilizzata da _FlaskWriteDeviceController_.

*Attributi*

_DeleteDeviceUseCase_ non definisce attributi.

*Metodi*

- `+ delete(device_id: String): void` — firma del metodo delegato all'esecuzione della logica di eliminazione a partire dall'identificativo del Dispositivo.

==== DeleteDeviceCommand

#figure(
  image("../uml/png/DeleteDevice/DeleteDeviceCommand.png", width: 35%),
  caption: [DeleteDeviceCommand],
) <fig-delete-device-command>

*Descrizione*

_DeleteDeviceCommand_ è il Command Object utilizzato per trasportare i dati necessari all'eliminazione di un Dispositivo.

*Attributi*

- `+ device_id: String` — identificativo univoco del Dispositivo da eliminare.

*Metodi*

_DeleteDeviceCommand_ non definisce metodi propri.

==== DeleteDeviceService

#figure(
  image("../uml/png/DeleteDevice/DeleteDeviceService.png", width: 45%),
  caption: [DeleteDeviceService],
) <fig-delete-device-service>

*Descrizione*

_DeleteDeviceService_ è il service applicativo appartenente all'Application Core responsabile della logica di eliminazione di un Dispositivo. Implementa l'interfaccia _DeleteDeviceUseCase_ e riceve un _DeleteDeviceCommand_ contenente l'identificativo del Dispositivo, coordinandone la rimozione dal sistema.

*Attributi*

- `- delete_device_port: DeleteDevicePort` — porta outbound utilizzata per eliminare il device

*Metodi*

- `+ delete(command: DeleteDeviceCommand): void` — riceve il Command Object contenente l'identificativo univoco del Dispositivo e ne coordina la rimozione tramite _DeleteDevicePort_.
==== DeleteDevicePort

#figure(
  image("../uml/png/DeleteDevice/DeleteDevicePort.png", width: 40%),
  caption: [DeleteDevicePort],
) <fig-delete-device-port>
*Descrizione*

_DeleteDevicePort_ è l'interfaccia (Outbound Port) che definisce il contratto per la rimozione fisica di un Dispositivo dal sistema di persistenza. Viene implementata da _MongoDeviceAdapter_ e utilizzata da _DeleteDeviceService_.

*Attributi*

_DeleteDevicePort_ non definisce attributi.

*Metodi*

- `+ delete(device_id: String): void` — firma del metodo che esegue la rimozione fisica del Dispositivo identificato da `device_id` dal sistema di persistenza.


// Update


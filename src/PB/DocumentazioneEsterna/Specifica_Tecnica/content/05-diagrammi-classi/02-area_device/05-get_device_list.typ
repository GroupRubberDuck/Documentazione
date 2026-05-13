=== GetDeviceList


#figure(
  image("../uml/png/GetDeviceList/GetDeviceList.png", width: 100%),
  caption: [Caso d'uso GetDeviceList],
) <fig-get-device-list>

Il diagramma illustra l'architettura del modulo dedicato al recupero della lista sintetica dei Dispositivi.

Per la definizione di _FlaskQueryDeviceController_, vedere la sezione @FlaskQueryDeviceController. \
Per la definizione di _Device_, vedere la sezione @Device. \
Per la definizione di _MongoDeviceAdapter_, vedere la sezione @MongoDeviceAdapter.

Di seguito vengono documentati esclusivamente i componenti introdotti specificamente per questo caso d'uso.



==== GetDeviceListUseCase
#figure(
  image("../uml/png/GetDeviceList/GetDeviceListUseCase.png", width: 35%),
  caption: [GetDeviceListUseCase],
) <fig-get-device-list-use-case>
*Descrizione*

_GetDeviceListUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per il recupero della lista sintetica dei Dispositivi. Viene implementata da _GetDeviceListService_ e utilizzata da _FlaskQueryDeviceController_.

*Attributi*

_GetDeviceListUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ get_list(): List<DeviceSummary>` — firma del metodo delegato al recupero della lista sintetica di tutti i Dispositivi presenti nel sistema.

==== GetDeviceListService

#figure(
  image("../uml/png/GetDeviceList/GetDeviceListService.png", width: 45%),
  caption: [GetDeviceListService],
) <fig-get-device-list-service>

*Descrizione*

_GetDeviceListService_ è il service applicativo appartenente all'Application Core responsabile del recupero della lista sintetica dei Dispositivi. Implementa l'interfaccia _GetDeviceListUseCase_ e coordina il recupero tramite la porta outbound _FindAllDevicesPort_.

*Attributi*

- `- find_port: FindAllDevicesPort` — porta outbound utilizzata per il recupero della lista dei Dispositivi dal sistema di persistenza.

*Metodi e funzioni*

- `+ get_list(): List<DeviceSummary>` — concretizza il contratto definito da _GetDeviceListUseCase_. Recupera la lista sintetica di tutti i Dispositivi tramite _FindAllDevicesPort_.

==== DeviceSummary
#figure(
  image("../uml/png/GetDeviceList/DeviceSummary.png", width: 30%),
  caption: [DeviceSummary],
) <fig-device-summary>
*Descrizione*

_DeviceSummary_ è il Data Transfer Object che veicola la rappresentazione sintetica di un Dispositivo verso il livello di presentazione. Espone esclusivamente le informazioni necessarie alla visualizzazione in lista, evitando di esporre l'intera entità di dominio.

*Attributi*

- `+ device_id: String` — identificativo univoco del dispositivo
- `+ name: String` — nome del dispositivo
- `+ os: String` — sistema operativo del dispositivo
- `+ description: String` — descrizione del dispositivo
- `+ compliance_standard_id: String` — identificativo univoco dello Standard

*Metodi e funzioni*

_DeviceSummary_ non definisce metodi.



==== FindAllDevicesPort
#figure(
  image("../uml/png/GetDeviceList/FindAllDevicesPort.png", width: 45%),
  caption: [FindAllDevicesPort],
) <fig-find-all-devices-port>
*Descrizione*

_FindAllDevicesPort_ è l'interfaccia (Outbound Port) che definisce il contratto per il recupero della lista sintetica di tutti i Dispositivi dal sistema di persistenza. Viene implementata da _MongoDeviceAdapter_ e utilizzata da _GetDeviceListService_.

*Attributi*

_FindAllDevicesPort_ non definisce attributi.

*Metodi e funzioni*

- `+ find_all(): List<DeviceSummary>` — firma del metodo che recupera la lista sintetica di tutti i Dispositivi presenti nel sistema di persistenza.




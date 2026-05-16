=== GetDeviceDetail

#figure(
  image("../uml/png/GetDeviceDetail/GetDeviceDetail.png", width: 100%),
  caption: [GetDeviceDetail],
) <fig-get-device-detail>

Il diagramma illustra l'architettura del modulo dedicato al recupero del dettaglio di un Dispositivo.
- Per la definizione di _Device_, vedere la sezione @Device. \
- Per la definizione di _MongoDeviceAdapter_, vedere la sezione @MongoDeviceAdapter.
- Per la definizione di _FindDevicePort_, vedere la sezione @FindDevicePort.
- Per la definizione di _ComplianceStandard_, vedere la sezione @ComplianceStandard
Di seguito vengono documentati esclusivamente i componenti introdotti specificamente per questo caso d'uso.


==== FlaskQueryDeviceController <FlaskQueryDeviceController>

#figure(
  image("../uml/png/GetDeviceDetail/FlaskQueryDeviceController.png", width: 45%),
  caption: [FlaskQueryDeviceController],
) <fig-query-device-controller>

*Descrizione*

_FlaskQueryDeviceController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP di lettura relative ai Dispositivi e le inoltra al livello applicativo.

*Attributi*

- `- get_device_list_use_case: GetDeviceListUseCase` — inbound port usata per prendere la lista dei dispostivi
- `- get_device_detail_use_case: GetDeviceDetailUseCase` — inbound port usata per prendere il dettaglio di un dispositivo
- `- get_compliance_standard_use_case: GetComplianceStandardUseCase` — inbound port usata per prendere lo Standard

*Metodi e funzioni*

- `+ get_device_list(req: Request): Response` — riceve la richiesta HTTP di recupero della lista dei Dispositivi e restituisce una risposta HTTP con l'elenco sintetico.
- `+ get_device_detail(req: Request): Response` — riceve la richiesta HTTP di recupero del dettaglio di un Dispositivo specifico e restituisce una risposta HTTP con i dati completi, per recuperare questi dati utilizza le porte _GetDeviceDetailUseCase_ per le informazioni del dispositivo e _GetComplianceStandardUseCase_ per recuperare lo standard associato.

==== GetDeviceDetailUseCase
#figure(
  image("../uml/png/GetDeviceDetail/GetDeviceDetailUseCase.png", width: 35%),
  caption: [GetDeviceDetailUseCase],
) <fig-get-device-detail-use-case>
*Descrizione*

_GetDeviceDetailUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per il recupero del dettaglio di un Dispositivo. Viene implementata da _GetDeviceDetailService_ e utilizzata da _FlaskQueryDeviceController_.

*Attributi*

_GetDeviceDetailUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ get_device(command: GetDeviceDetailCommand): Device` — firma del metodo delegato al recupero del Dispositivo corrispondente al Command fornito.

==== GetDeviceDetailService

#figure(
  image("../uml/png/GetDeviceDetail/GetDeviceDetailService.png", width: 45%),
  caption: [GetDeviceDetailService],
) <fig-get-device-detail-service>

*Descrizione*

_GetDeviceDetailService_ è il service applicativo appartenente all'Application Core responsabile del recupero del dettaglio di un Dispositivo. Implementa l'interfaccia _GetDeviceDetailUseCase_ e coordina il recupero dei dati tramite la porta outbound _FindDevicePort_.

*Attributi*

- `find_device_port: FindDevicePort` — outbound port usata per prelevare un dispositivo.

*Metodi e funzioni*

- `+ get_device(command: GetDeviceDetailCommand): Device` — concretizza il contratto definito da _GetDeviceDetailUseCase_. Recupera il Dispositivo corrispondente all'identificativo contenuto nel Command tramite _FindDevicePort_.

==== GetDeviceDetailCommand

#figure(
  image("../uml/png/GetDeviceDetail/GetDeviceDetailCommand.png", width: 35%),
  caption: [GetDeviceDetailCommand],
) <fig-get-device-detail-command>

*Descrizione*

_GetDeviceDetailCommand_ è  utilizzato per trasportare i dati necessari al recupero del dettaglio di un Dispositivo. Incapsula i parametri di input del metodo esposto da _GetDeviceDetailUseCase_.

*Attributi*

- `+ device_id: String` — identificativo univoco del Dispositivo di cui recuperare il dettaglio.

*Metodi e funzioni*

_GetDeviceDetailCommand_ non definisce metodi propri.

==== GetComplianceStandardUseCase
#figure(
  image("../uml/png/GetDeviceDetail/GetComplianceStandardUseCase.png", width: 35%),
  caption: [GetComplianceStandardUseCase]
) <fig-get-compliance-standard-use-case>
*Descrizione*

_GetComplianceStandardUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per il recupero dello standard. Viene implementata da _GetComplianceStandardService_ e utilizzata da _FlaskQueryDeviceController_.

*Attributi*

_GetComplianceStandardUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ get_compliance_standard(command: GetComplianceStandardCommand): ComplianceStandard` — firma del metodo delegato al recupero dello Standard corrispondente al Command fornito.

==== GetComplianceStandardService
#figure(
  image("../uml/png/GetDeviceDetail/GetComplianceStandardService.png", width: 60%),
  caption: [GetComplianceStandardService]
) <fig-get-compliance-standard-service>

*Descrizione*

_GetComplianceStandardService_ è il service applicativo appartenente all'Application Core responsabile del recupero di un Compliance Standard. Implementa l'interfaccia _GetComplianceStandardUseCase_ e coordina il recupero dei dati tramite la porta outbound _FindStandardPort_.

*Attributi*

- `find_standard_port: FindStandardPort` — outbound port usata per prelevare lo Standard.

*Metodi e funzioni*

- `+ get_compliance_standard(command: GetComplianceStandardCommand): ComplianceStandard` — concretizza il contratto definito da _GetComplianceStandardUseCase_. Recupera il Compliance Standard corrispondente all'identificativo contenuto nel Command tramite _FindStandardPort_.

==== GetComplianceStandardCommand
#figure(
  image("../uml/png/GetDeviceDetail/GetComplianceStandardCommand.png", width: 35%),
  caption: [GetComplianceStandardCommand],
) <fig-get-compliance-standard-command>

*Descrizione*

_GetComplianceStandardCommand_ è  utilizzato per trasportare i dati necessari al recupero del dettaglio di un Compliance Standard. Incapsula i parametri di input del metodo esposto da _GetComplianceStandardUseCase_.

*Attributi*

- `+ standard_id: String` — identificativo univoco dello Standard di cui recuperare il dettaglio.

*Metodi e funzioni*

_GetComplianceStandardCommand_ non definisce metodi propri.

==== FindStandardPort <FindStandardPort>
#figure(
  image("../uml/png/GetDeviceDetail/FindStandardPort.png", width: 50%),
  caption: [FindStandardPort],
) <fig-find-standard-port>
*Descrizione*

_FindStandardPort_ è l'interfaccia (Outbound Port) che definisce il contratto per il recupero di uno standard di conformità dal sistema di persistenza. Viene implementata da _MongoStandardAdapter_ e utilizzata da _OpenEvaluationSessionService_.

*Attributi*

_FindStandardPort_ non definisce attributi.

*Metodi e funzioni*

- `+ find_by_id(standard_id: String): ComplianceStandard` — firma del metodo che recupera lo standard di conformità corrispondente all'identificativo fornito.


==== MongoStandardAdapter <MongoStandardAdapter>
#figure(
  image("../uml/png/GetDeviceDetail/MongoStandardAdapter.png", width: 50%),
  caption: [MongoStandardAdapter],
) <fig-mongo-standard-adapter>
*Descrizione*

_MongoStandardAdapter_ è la classe dell'Outbound Adapter annotata come _Mongo Repository_ che implementa _FindStandardPort_, traducendo le operazioni di recupero degli standard di conformità in interazioni concrete con MongoDB.

*Attributi*

_MongoStandardAdapter_ non definisce attributi propri nel diagramma.

*Metodi e funzioni*

- `+ save(standard: ComplianceStandard): void` — persiste uno standard di conformità nel database.
- `+ find_by_id(standard_id: String): ComplianceStandard` — recupera lo standard di conformità corrispondente all'identificativo fornito.


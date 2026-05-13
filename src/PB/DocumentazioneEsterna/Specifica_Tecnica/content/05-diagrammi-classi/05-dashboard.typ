== Dashboard 

=== GetDeviceDashboard

#figure(
  image("../uml/png/Dashboard/GetDeviceDashboard.png", width: 100%),
  caption: [Caso d'uso GetDeviceDashboard]
) <fig-get-device-dashboard>

Il diagramma illustra l'architettura del modulo dedicato al recupero della dashboard di un Dispositivo, che aggrega le informazioni della sessione di valutazione attiva in una vista sintetica.
- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la sezione @InMemoryEvaluationSessionCache.
- Per la definizione di _GetEvaluationSessionPort_, vedere la sezione @GetEvaluationSessionPort. \


 
==== GetDeviceDashboardCommand

#figure(
  image("../uml/png/Dashboard/GetDeviceDashboardCommand.png", width: 40%),
  caption: [GetDeviceDashboardCommand]
) <fig-get-device-dashboard-command>

*Descrizione*

_GetDeviceDashboardCommand_ è il Command Object utilizzato per trasportare i dati necessari al recupero della dashboard di un Dispositivo. Incapsula i parametri di input del metodo esposto da _GetDeviceDashboardUseCase_.

*Attributi*

- `+ device_id: String` — identificativo univoco del Dispositivo di cui recuperare la dashboard.

*Metodi e funzioni*

_GetDeviceDashboardCommand_ non definisce metodi propri.

==== GetDeviceDashboardUseCase

#figure(
  image("../uml/png/Dashboard/GetDeviceDashboardUseCase.png", width: 40%),
  caption: [GetDeviceDashboardUseCase]
) <fig-get-device-dashboard-use-case>

*Descrizione*

_GetDeviceDashboardUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per il recupero della dashboard di un Dispositivo. Viene implementata da _GetDeviceDashboardService_ e utilizzata da _QueryDashboardController_.

*Attributi*

_GetDeviceDashboardUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ get_device_dashboard(command: GetDeviceDashboardCommand): DashboardCommand` — firma del metodo delegato al recupero e all'aggregazione delle informazioni della sessione di valutazione in una vista dashboard.

==== GetDeviceDashboardService

#figure(
  image("../uml/png/Dashboard/GetDeviceDashboardService.png", width: 50%),
  caption: [GetDeviceDashboardService]
) <fig-get-device-dashboard-service>

*Descrizione*

_GetDeviceDashboardService_ è il service applicativo appartenente all'Application Core responsabile del recupero della dashboard di un Dispositivo. Implementa l'interfaccia _GetDeviceDashboardUseCase_, recupera la sessione attiva tramite _GetEvaluationSessionPort_ e costruisce il _DashboardCommand_ con le informazioni aggregate.

*Attributi*

_GetDeviceDashboardService_ non definisce attributi propri.

*Metodi e funzioni*

- `+ get_device_dashboard(command: GetDeviceDashboardCommand): DashboardCommand` — concretizza il contratto definito da _GetDeviceDashboardUseCase_. Recupera la sessione attiva, aggrega le informazioni del Dispositivo e dei suoi Asset e restituisce la rappresentazione _DashboardCommand_.

==== DashboardCommand
#figure(
  image("../uml/png/Dashboard/DashboardCommand.png", width: 45%),
  caption: [DashboardCommand]
) 

*Descrizione*

_DashboardCommand_ è il Data Transfer Object che veicola la rappresentazione aggregata della dashboard di un Dispositivo verso il livello di presentazione. Espone le informazioni del Dispositivo, il suo stato di valutazione complessivo e la lista sintetica degli Asset associati.

*Attributi*

- `+ device_id: String` — identificativo univoco del Dispositivo.
- `+ device_name: String` — nome del Dispositivo.
- `+ operating_system: String` — sistema operativo del Dispositivo.
- `+ description: String` — descrizione testuale del Dispositivo.
- `+ aggregate_status: EvaluationState` — stato di valutazione aggregato del Dispositivo.
- `+ asset_list: List<AssetSummaryCommand>` — lista sintetica degli Asset associati al Dispositivo.

*Metodi e funzioni*

_DashboardCommand_ non definisce metodi.


==== AssetSummaryCommand
#figure(
  image("../uml/png/Dashboard/AssetSummaryCommand.png", width: 40%),
  caption: [AssetSummaryCommand]
) 
*Descrizione*

_AssetSummaryCommand_ è il Data Transfer Object che rappresenta la vista sintetica di un Asset all'interno della dashboard. È contenuto nella lista `asset_list` di _DashboardCommand_.

*Attributi*

- `+ asset_id: String` — identificativo univoco dell'Asset.
- `+ name: String` — nome dell'Asset.
- `+ type: AssetType` — tipo dell'Asset.
- `+ stato_aggregato: EvaluationState` — stato di valutazione aggregato dell'Asset.

*Metodi e funzioni*

_AssetSummaryCommand_ non definisce metodi.

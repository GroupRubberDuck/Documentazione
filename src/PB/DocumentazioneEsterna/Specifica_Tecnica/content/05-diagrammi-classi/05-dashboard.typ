== Dashboard 

=== GetDeviceDashboard

#figure(
  image("../uml/png/Dashboard/GetDeviceDashboard.png", width: 100%),
  caption: [Caso d'uso GetDeviceDashboard]
) <fig-get-device-dashboard>

Il diagramma illustra l'architettura del modulo dedicato al recupero della dashboard di un Dispositivo, che aggrega le informazioni della sessione di valutazione attiva in una vista sintetica.
- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la sezione @InMemoryEvaluationSessionCache.
- Per la definizione di _GetSessionPort_, vedere la sezione @GetSessionPort. \
- Per la definizione di _QueryDashboardController_, vedere la sezione @QueryDashboardController. \
- Per la definizione di _EvaluationSession_, vedere la sezione @EvaluationSession. \

 
==== GetDeviceDashboardUseCase
#figure(
  image("../uml/png/Dashboard/GetDeviceDashboardUseCase.png", width: 40%),
  caption: [GetDeviceDashboardUseCase]
) 

*Descrizione*

_GetDeviceDashboardUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per il recupero della dashboard di un Dispositivo. Viene implementata da _GetDeviceDashboardService_ e utilizzata da _QueryDashboardController_.

*Attributi*

_GetDeviceDashboardUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ get_device_dashboard(session_id: String): DashboardDTO` — firma del metodo delegato al recupero e all'aggregazione delle informazioni della sessione di valutazione in una vista dashboard.



==== GetDeviceDashboardService
#figure(
  image("../uml/png/Dashboard/GetDeviceDashboardService.png", width: 50%),
  caption: [GetDeviceDashboardService]
) 
*Descrizione*

_GetDeviceDashboardService_ è il service applicativo appartenente all'Application Core responsabile del recupero della dashboard di un Dispositivo. Implementa l'interfaccia _GetDeviceDashboardUseCase_, recupera la sessione attiva tramite _GetSessionPort_,  e costruisce il DTO _DashboardCommand_ con le informazioni aggregate.

*Attributi*

_GetDeviceDashboardService_ non definisce attributi propri.

*Metodi e funzioni*

- `+ get_device_dashboard(session_id: String): DashboardDTO` — concretizza il contratto definito da _GetDeviceDashboardUseCase_. Recupera la sessione attiva, aggrega le informazioni del Dispositivo e dei suoi Asset e restituisce la rappresentazione _DashboardCommand_.

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

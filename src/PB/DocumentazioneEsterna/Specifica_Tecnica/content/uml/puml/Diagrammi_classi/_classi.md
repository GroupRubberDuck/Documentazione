Regole grammatiche:
   1. Inbound Adapter (Controller): {Azione}{Entità}Controller
   2. Inbound port (use case): {Azione}{Entità}UseCase -> CreateAssetUseCase
   3. Application service: {Azione}{Entità}Service
   4. Outbound port: {Azione}{Entità}Port

Inbound Adapter:
   - QueryDeviceController
   - WriteDeviceController

   - QueryAssetController
   - WriteAssetController

   - QueryDashboardController

Inbound Port:
   - GetDeviceListUseCase
   - GetDeviceDetailUseCase
   - CreateDeviceUseCase
   - SaveDeviceUseCase
   - DeleteDeviceUseCase

   - CreateAssetUseCase
   - SaveAssetUseCase
   - DeleteAssetUseCase

   - GetDeviceDashboardUseCase
   - GetAssetDetailUseCase

Service
   - GetDeviceListService
   - GetDeviceDetailService
   - CreateDeviceService
   - SaveDeviceService
   - DeleteDeviceService

   - CreateAssetService
   - SaveAssetService
   - DeleteAssetService

   - GetDeviceDashboardService
   - GetAssetDetailService


Outbound Port:
   - FindAllDevicesPort
   - FindDeviceByIdPort
   - SaveDevicePort
   - DeleteDevicePort

   - SaveEvaluationSessionPort
   - GetEvaluationSessionPort
   - DeleteEvaluationSessionPort

Outbound Adapter:
   - MongoDeviceAdapter
   - InMemoryEvaluationSessionCache
  


----------------------------------------------------

Inbound Adapter:
- open -> apre la sessione
- close -> chiude la sessione
- commit -> salva modifica (sul db)
- commit_and_close -> salva e chiude

Application Service
- openService -> comunica con openSessionPort
- closeService -> comunica con deleteSessionPort
- commitService -> comuinica con getSessionPort (recupera info device) + saveDevicePort della repo del dispositivo (salva Device su Mongo)
- commitCloseService -> ha le porte di commit e close


Outbound port
- hasActiveSessionPort
- deleteSessionPort
- createSessionPort
- getSessionPort
- saveSessionPort (usato per operazioni di modifica quando c'è sessione attiva)


Outbound Adapter
- InMemoryEvaluationSessionCache
  - save_session()
  - get_session(id: String) ritorna l'oggetto sessione
  - delete_session()
  - create_session() ritorna l'id della sessione creata
  - has_active_session()

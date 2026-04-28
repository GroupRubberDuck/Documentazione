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
   - DeleteAssetService

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
   - EvaluationSessionPort

Outbound Adapter:
   - MongoDeviceAdapter
   - InMemoryEvaluationSessionCache
  
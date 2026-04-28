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

Inbound Port:
   - GetDeviceListUseCase
   - GetDeviceDetailUseCase
   - CreateDeviceUseCase
   - UpdateDeviceUseCase
   - DeleteDeviceUseCase

   - CreateAssetUseCase
   - UpdateAssetUseCase
   - DeleteAssetService

Service
   - GetDeviceListService
   - GetDeviceDetailService
   - CreateDeviceService
   - UpdateDeviceService
   - DeleteDeviceService

   - CreateAssetService
   - UpdateAssetService
   - DeleteAssetService


Outbound Port:
   - FindAllDevicesPort
   - FindDeviceByIdPort
   - SaveDevicePort
   - DeleteDevicePort

   - SaveAssetToSessionPort
   - GetAssetFromSessionPort
   - DeleteAssetFromSessionPort



Outbound Adapter:
   - MongoDeviceAdapter
  
Regole grammatiche:
   1. Inbound Adapter (Controller): {Azione}{Entità}Controller
   2. Inbound port (use case): {Azione}{Entità}UseCase -> CreateAssetUseCase
   3. Application service: {Azione}{Entità}Service
   4. Outbound port: {Azione}{Entità}Port

Inbound Adapter:
   - QueryDeviceController
   - WriteDeviceController

Inbound Port:
   - GetDeviceListUseCase
   - GetDeviceDetailUseCase
   - CreateDeviceUseCase
   - ModifyDeviceUseCase
   - DeleteDeviceUseCase

Service
   - GetDeviceListService
   - GetDeviceDetailService
   - CreateDeviceService
   - ModifyDeviceService
   - DeleteDeviceService


Outbound Port:
   - FindAllDevicesPort
   - FindDeviceByIdPort
   - SaveDevicePort
   - DeleteDevicePort



Outbound Adapter:
   - MongoDeviceAdapter
  
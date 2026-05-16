=== ImportDevice

#figure(
  image("../uml/png/ImportDevice/ImportDevice.png", width: 120%),
  caption: [Caso d'uso ImportDevice]
) <fig-import-device>

Il diagramma illustra l'architettura del modulo dedicato all'importazione di Dispositivi tramite file. Il modulo supporta tre formati — CSV, XML e JSON — gestiti tramite il pattern _Template Method_ e una factory dedicata. Il componente _MongoDeviceAdapter_ è già descritto nella sezione _CreateDevice_ . 
- Per la definizione di _MongoDeviceAdapter_, vedere la sezione @MongoDeviceAdapter.
- Per la definizione di _RegisterDevicePort_, vedere la sezione @RegisterDevicePort
Di seguito vengono documentati i componenti introdotti specificamente per questo caso d'uso.

#block(breakable: false)[
==== UploadFileController <UploadFileController>
#figure(
  image("../uml/png/ImportDevice/UploadFileController.png", width: 60%),
  caption: [UploadFileController]
) 
*Descrizione*

_UploadFileController_ è una classe di utilità appartenente all'Inbound Adapter che fornisce i metodi comuni per l'estrazione del contenuto e dell'estensione di un file dalla richiesta HTTP. Viene utilizzata da _FlaskImportDeviceController_.

*Attributi*

_UploadFileController_ non definisce attributi propri.

*Metodi e funzioni*

- `+ get_http_file_payload(file: FileStorage): IO[bytes]` — estrae il contenuto binario del file dalla richiesta HTTP.
- `+ get_http_file_extension(filename: String): AllowedDeviceFileExtension` — estrae l'estensione del file dalla richiesta HTTP.
]

==== FlaskFlaskImportDeviceController

#figure(
  image("../uml/png/ImportDevice/FlaskImportDeviceController.png", width: 40%),
  caption: [FlaskImportDeviceController]
) <fig-import-device-controller>

*Descrizione*

_FlaskImportDeviceController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP di importazione di Dispositivi tramite file. Utilizza _UploadFileController_ per estrarre il contenuto binario e l'estensione del file dalla request.

*Attributi*

- `- _service: ImportDeviceUseCase` — riferimento alla porta di Inbound (caso d'uso) responsabile della logica applicativa di importazione.

*Metodi e funzioni*

- `+ import_device(req: Request): Response` — riceve la richiesta HTTP di importazione, estrae il file e la sua estensione tramite _UploadFileController_ e inoltra il Command al livello applicativo; restituisce una risposta HTTP con l'esito dell'operazione.


==== ImportDeviceUseCase

#figure(
  image("../uml/png/ImportDevice/ImportDeviceUseCase.png", width: 40%),
  caption: [ImportDeviceUseCase]
) <fig-import-device-use-case>

*Descrizione*

_ImportDeviceUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per l'importazione di Dispositivi da file. Viene implementata da _ImportDeviceService_ e utilizzata da _FlaskImportDeviceController_.

*Attributi*

_ImportDeviceUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ import_device(command: ImportDeviceCommand): void` — firma del metodo delegato all'esecuzione della logica di importazione a partire dai dati contenuti nel Command.


==== ImportDeviceCommand

#figure(
  image("../uml/png/ImportDevice/ImportDeviceCommand.png", width: 40%),
  caption: [ImportDeviceCommand]
) <fig-import-device-command>

*Descrizione*

_ImportDeviceCommand_ è il Command Object che veicola i dati necessari all'importazione di Dispositivi dal controller al service.

*Attributi*

- `+ device_file_content: BinaryIO` — contenuto binario del file da importare.
- `+ extension: AllowedDeviceFileExtension` — estensione del file, vincolata ai valori dell'enumerazione _AllowedDeviceFileExtension_.

*Metodi e funzioni*

_ImportDeviceCommand_ non definisce metodi propri.



==== AllowedDeviceFileExtension <AllowedDeviceFileExtension>
#figure(
  image("../uml/png/ImportDevice/AllowedDeviceFileExtension.png", width: 40%),
  caption: [AllowedDeviceFileExtension]
) 
*Descrizione*

_AllowedDeviceFileExtension_ è un'enumerazione che definisce i formati di file supportati per l'importazione di Dispositivi.

*Valori*

- `CSV` — formato CSV.
- `XML` — formato XML.
- `JSON` — formato JSON.


==== ImportDeviceService
#figure(
  image("../uml/png/ImportDevice/ImportDeviceService.png", width: 80%),
  caption: [ImportDeviceService]
) 
*Descrizione*

_ImportDeviceService_ è il service applicativo appartenente all'Application Core responsabile della logica di importazione di Dispositivi da file. Implementa l'interfaccia _ImportDeviceUseCase_ e coordina il parsing del file tramite _FileDeviceImporterFactoryPort_, la lettura del contenuto tramite _FileDeviceImporterPort_ e la persistenza tramite _RegisterDevicePort_.

*Attributi*

- `device_importer_factory: FileDEviceImporterFactoryPort`
- `register_device_port = RegisterDevicePort`

*Metodi e funzioni*

- `+ import_device(command: ImportDeviceCommand): void` — concretizza il contratto definito da _ImportDeviceUseCase_. Ottiene l'importer appropriato tramite la factory, effettua il parsing del file e persiste i Dispositivi estratti tramite _DeviceRepositoryPort_.

==== FileDeviceImporterPort
#figure(
  image("../uml/png/ImportDevice/FileDeviceImporterPort.png", width: 60%),
  caption: [FileDeviceImporterPort]
) 
*Descrizione*

_FileDeviceImporterPort_ è l'interfaccia (Outbound Port) che definisce il contratto per il parsing di un file contenente dati di Dispositivi. Viene implementata dalle classi concrete _XMLFileDeviceImporter_, _JSONFileDeviceImporter_ e _CSVFileDeviceImporter_ tramite _FileDeviceImporter_.

*Attributi*

_FileDeviceImporterPort_ non definisce attributi.

*Metodi e funzioni*

- `+ parse_device_file(device_file_content: BinaryIO): Device` — firma del metodo che effettua il parsing del contenuto binario del file e restituisce l'entità _Device_ estratta.


==== FileDeviceImporter
#figure(
  image("../uml/png/ImportDevice/FileDeviceImporter.png", width: 55%),
  caption: [FileDeviceImporter]
) 
*Descrizione*

_FileDeviceImporter_ è la classe astratta appartenente all'Outbound Adapter che implementa il pattern _Template Method_ per il parsing dei file di Dispositivi. Definisce lo scheletro dell'algoritmo di importazione, delegando alle sottoclassi concrete l'implementazione dei passi specifici per ciascun formato.

*Attributi*

_FileDeviceImporter_ non definisce attributi propri.

*Metodi e funzioni*

- `+ parse_device_file(device_file_content: IO[bytes]): Device` — metodo pubblico che orchestra l'algoritmo di parsing invocando in sequenza i metodi del template; restituisce l'entità _Device_ estratta dal file.
- `# deserialize(device_file_content: IO[bytes]): Any` — metodo protetto astratto che deserializza il contenuto binario del file nella struttura dati grezza specifica del formato; deve essere implementato dalle sottoclassi.
- `# parse_data(raw: Any): dict` — metodo protetto astratto che estrae e normalizza i campi necessari dalla struttura dati grezza; deve essere implementato dalle sottoclassi.
- `- pre_validate(device_file_content: IO[bytes]): void` — metodo privato che verifica che il file non superi la dimensione massima consentita di 10 MB prima di procedere al parsing.
- `- close_stream(): void` — metodo privato che chiude lo stream di lettura del file.
- `- build_device(data: dict): Device` — metodo privato che costruisce l'entità _Device_ a partire dal dizionario normalizzato, verificando la presenza dei campi obbligatori.
- `- build_asset(asset_data: dict): Asset` — metodo privato che costruisce un'entità _Asset_ a partire dai dati del singolo asset estratti dal file.

==== XMLFileDeviceImporter, JSONFileDeviceImporter, CSVFileDeviceImporter
#figure(
  image("../uml/png/ImportDevice/FilesDeviceImporter.png", width: 60%),
  caption: [XMLFileDeviceImporter, JSONFileDeviceImporter, CSVFileDeviceImporter]
) 
*Descrizione*

_XMLFileDeviceImporter_, _JSONFileDeviceImporter_ e _CSVFileDeviceImporter_ sono le implementazioni concrete di _FileDeviceImporter_, ciascuna specializzata nel parsing del rispettivo formato di file. Implementano i metodi protetti del template per la gestione dello stream e del parsing specifico del formato.

*Attributi*

Le tre classi non definiscono attributi propri.

*Metodi e funzioni*

Ciascuna classe implementa i metodi ereditati da _FileDeviceImporter_:

- `# deserialize(device_file_content: IO[bytes]): Any` — metodo protetto che deserializza il contenuto binario del file nel formato specifico della sottoclasse.
- `# parse_data(raw: Any): dict` — metodo protetto che estrae e normalizza i campi necessari dalla struttura dati grezza prodotta da `deserialize`.

==== FileDeviceImporterFactoryPort
#figure(
  image("../uml/png/ImportDevice/FileDeviceImporterFactoryPort.png", width: 50%),
  caption: [FileDeviceImporterFactoryPort]
) 
*Descrizione*

_FileDeviceImporterFactoryPort_ è l'interfaccia (Outbound Port) che definisce il contratto per l'ottenimento dell'importer appropriato in base all'estensione del file. Viene implementata da _ConcreteFileDeviceImporterFactory_.

*Attributi*

_FileDeviceImporterFactoryPort_ non definisce attributi.

*Metodi e funzioni*

- `+ get_file_device_importer(extension: AllowedDeviceFileExtension): FileDeviceImporterPort` — restituisce l'istanza dell'importer appropriato per il formato specificato.

==== ConcreteFileDeviceImporterFactory
#figure(
  image("../uml/png/ImportDevice/ConcreteFileDeviceImporterFactory.png", width: 80%),
  caption: [ConcreteFileDeviceImporterFactory]
) 
*Descrizione*

_ConcreteFileDeviceImporterFactory_ è la classe dell'Outbound Adapter che implementa _FileDeviceImporterFactoryPort_. Istanzia e restituisce l'importer appropriato in base all'estensione del file fornita, selezionando tra _XMLFileDeviceImporter_, _JSONFileDeviceImporter_ e _CSVFileDeviceImporter_.

*Attributi*

_ConcreteFileDeviceImporterFactory_ non definisce attributi propri.

*Metodi e funzioni*

- `+ get_file_device_importer(extension: AllowedDeviceFileExtension): FileDeviceImporterPort` — restituisce l'istanza dell'importer corrispondente al formato specificato.
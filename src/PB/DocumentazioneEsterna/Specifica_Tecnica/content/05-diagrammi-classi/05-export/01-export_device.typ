=== ExportDevice

#figure(
  image("../uml/png/ExportDevice/ExportDevice.png", width: 120%),
  caption: [Caso d'uso ExportDevice]
) <fig-export-device>

Il diagramma illustra l'architettura del modulo dedicato all'esportazione dei dati di un dispositivo (inclusi i suoi asset e le relative valutazioni di conformità) in un file scaricabile. Il sistema supporta tre formati — CSV, XML e JSON — gestiti tramite il pattern _Factory_ per la selezione dell'esportatore corretto e il pattern _Template Method_ per standardizzare l'algoritmo di generazione del file.

- Per la definizione di _MongoDeviceAdapter_, vedere la @MongoDeviceAdapter. \
- Per la definizione di _FindDevicePort_, vedere la @FindDevicePort. \
- Per la definizione di _AllowedDeviceFileExtension_, vedere la @AllowedDeviceFileExtension.
- Per la definizione di _ExportedFile_, vedere la @ExportedFile

Di seguito vengono documentati esclusivamente i componenti introdotti specificamente per questo caso d'uso.

==== FlaskExportDeviceController
#figure(
  image("../uml/png/ExportDevice/FlaskExportDeviceController.png", width: 35%),
  caption: [FlaskExportDeviceController]
)

*Descrizione*

_FlaskExportDeviceController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP di esportazione di un dispositivo, estrae l'identificativo del dispositivo e il formato desiderato dalla request e inoltra il Command al livello applicativo.

*Attributi*

- `- export_device_use_case: ExportDeviceUseCase` — inbound port usata per esportare un dispositivo.

*Metodi*

- `+ export_device(req: Request): Response` — riceve la richiesta HTTP, estrae l'identificativo del dispositivo e il formato desiderato come query parameter, invoca il caso d'uso di esportazione e restituisce il file generato come risposta HTTP scaricabile.

==== ExportDeviceUseCase
#figure(
  image("../uml/png/ExportDevice/ExportDeviceUseCase.png", width: 35%),
  caption: [ExportDeviceUseCase]
)

*Descrizione*

_ExportDeviceUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per l'esportazione dei dati di un dispositivo in un file. Viene implementata da _ExportDeviceService_ e utilizzata da _FlaskExportDeviceController_.

*Attributi*

_ExportDeviceUseCase_ non definisce attributi.

*Metodi*

- `+ export_device(command: ExportDeviceCommand): ExportedFile` — firma del metodo delegato all'esecuzione della logica di esportazione a partire dai dati contenuti nel Command.

==== ExportDeviceCommand
#figure(
  image("../uml/png/ExportDevice/ExportDeviceCommand.png", width: 40%),
  caption: [ExportDeviceCommand]
)

*Descrizione*

_ExportDeviceCommand_ è il Command Object che veicola i parametri della richiesta di esportazione dal controller al service.

*Attributi*

- `+ device_id: String` — identificativo univoco del dispositivo da esportare.
- `+ extension: AllowedDeviceFileExtension` — formato del file richiesto per l'esportazione, vincolato ai valori dell'enumerazione _AllowedDeviceFileExtension_.

*Metodi*

_ExportDeviceCommand_ non definisce metodi propri.

==== ExportDeviceService
#figure(
  image("../uml/png/ExportDevice/ExportDeviceService.png", width: 45%),
  caption: [ExportDeviceService]
)

*Descrizione*

_ExportDeviceService_ è il service applicativo appartenente all'Application Core responsabile di orchestrare il processo di esportazione. Implementa l'interfaccia _ExportDeviceUseCase_, recupera il dispositivo tramite _FindDevicePort_, ottiene l'esportatore appropriato tramite _FileDeviceExporterFactoryPort_ e avvia la generazione del file tramite _FileDeviceExporterPort_; restituisce il risultato incapsulato in un oggetto _ExportedFile_.

*Attributi*

- `- find_device: FindDevicePort` — outbound port usata per prelevare il dispositivo.
- `- exporter_factory: FileDeviceExporterFactoryPort` — outbound port usata per ottenere l'exporter desiderato.

*Metodi*

- `+ export_device(command: ExportDeviceCommand): ExportedFile` — concretizza il contratto definito da _ExportDeviceUseCase_. Recupera il dispositivo, ottiene l'esportatore corretto tramite la factory e restituisce il file generato incapsulato in _ExportedFile_.

==== FileDeviceExporterFactoryPort
#figure(
  image("../uml/png/ExportDevice/FileDeviceExporterFactoryPort.png", width: 70%),
  caption: [FileDeviceExporterFactoryPort]
)

*Descrizione*

_FileDeviceExporterFactoryPort_ è l'interfaccia (Outbound Port) che definisce il contratto per l'ottenimento dell'esportatore appropriato in base al formato richiesto. Viene implementata da _ConcreteFileDeviceExporterFactory_ e utilizzata da _ExportDeviceService_.

*Attributi*

_FileDeviceExporterFactoryPort_ non definisce attributi.

*Metodi*

- `+ get_file_device_exporter(extension: AllowedDeviceFileExtension): FileDeviceExporterPort` — restituisce l'istanza dell'esportatore corrispondente al formato specificato.

==== FileDeviceExporterPort
#figure(
  image("../uml/png/ExportDevice/FileDeviceExportPort.png", width: 40%),
  caption: [FileDeviceExporterPort]
)

*Descrizione*

_FileDeviceExporterPort_ è l'interfaccia (Outbound Port) che definisce il contratto per la generazione del file di esportazione. Viene implementata da _FileDeviceExporter_ e utilizzata da _ExportDeviceService_.

*Attributi*

_FileDeviceExporterPort_ non definisce attributi.

*Metodi*

- `+ generate_device_file(device: Device): bytes` — firma del metodo delegato alla generazione del file; riceve l'entità _Device_ e restituisce il file generato come bytes.

==== FileDeviceExporter
#figure(
  image("../uml/png/ExportDevice/FileDeviceExporter.png", width: 45%),
  caption: [FileDeviceExporter]
)

*Descrizione*

_FileDeviceExporter_ è la classe astratta appartenente all'Outbound Adapter che implementa _FileDeviceExporterPort_ definendo lo scheletro dell'algoritmo di esportazione tramite il pattern _Template Method_. Le sottoclassi concrete implementano i passi specifici per ciascun formato.

*Attributi*

_FileDeviceExporter_ non definisce attributi propri.

*Metodi*

- `+ generate_device_file(device: Device): bytes` — metodo pubblico che orchestra l'algoritmo di esportazione invocando in sequenza i metodi protetti del template.
- `# prepare_structure(device: Device): void` — metodo protetto astratto che inizializza la struttura del documento nel formato specifico.
- `# write_data(device: Device): void` — metodo protetto astratto che scrive i dati del dispositivo nella struttura inizializzata.
- `# finalize_output(): bytes` — metodo protetto astratto che chiude il documento e restituisce il contenuto serializzato come array di byte.

==== ConcreteFileDeviceExporterFactory
#figure(
  image("../uml/png/ExportDevice/ConcreteFileDeviceExporterFactory.png", width:60%),
  caption: [ConcreteFileDeviceExporterFactory]
)

*Descrizione*

_ConcreteFileDeviceExporterFactory_ è la classe dell'Outbound Adapter che implementa _FileDeviceExporterFactoryPort_. Istanzia e restituisce l'esportatore appropriato in base al formato richiesto, selezionando tra _CSVFileDeviceExporter_, _JSONFileDeviceExporter_ e _XMLFileDeviceExporter_.

*Attributi*
- `- exporters: Dict[AllowedDeviceFileExtension, FileDeviceExporterPort]` — dizionario che mappa ogni estensione supportata alla corrispondente istanza dell'esportatore.

*Metodi*

- `+ get_file_device_exporter(extension: AllowedDeviceFileExtension): FileDeviceExporterPort` — restituisce l'istanza dell'esportatore corrispondente al formato specificato.

==== CSVFileDeviceExporter, JSONFileDeviceExporter, XMLFileDeviceExporter
#figure(
  image("../uml/png/ExportDevice/FilesDeviceExporter.png", width: 60%),
  caption: [CSVFileDeviceExporter, JSONFileDeviceExporter, XMLFileDeviceExporter]
)

*Descrizione*

_CSVFileDeviceExporter_, _JSONFileDeviceExporter_ e _XMLFileDeviceExporter_ sono le implementazioni concrete di _FileDeviceExporter_, ciascuna specializzata nella generazione del file nel rispettivo formato. Implementano i metodi protetti del template per la gestione della struttura e della serializzazione specifica del formato.

*Attributi*

- `CSVFileDeviceExporter`: `- output: StringIO`, `- writer: Any` — `output` è lo stream in memoria su cui viene scritto il contenuto CSV; `writer` è il `csv.writer` che scrive le righe su `output`.
- `JSONFileDeviceExporter`: `- data: Dict` — dizionario che accumula incrementalmente la struttura JSON del dispositivo durante `write_data` e viene serializzato in `finalize_output`.
- `XMLFileDeviceExporter`: `- root: ET.Element` — nodo radice dell'albero XML costruito durante `write_data` e serializzato in `finalize_output`.

*Metodi*

- `# prepare_structure(device: Device): void` — inizializza la struttura del documento nel formato specifico.
- `# write_data(device: Device): void` — scrive i dati del dispositivo nella struttura inizializzata.
- `# finalize_output(): bytes` — serializza il documento e restituisce il contenuto come array di byte.




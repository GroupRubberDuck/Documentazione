/*== Generazione Report <report-generator>
Per realizzare la funzione di generazione del report di valutazione come file scaricabile rispettando i principi dell'architettura esagonale si è deciso di modellare il sistema mettendo in evidenza l'ambito di competenza delle varie classi.


#figure(caption:"Diagramma delle classi - Importazione Modello")[
  #image("/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/uml/png/Generate_Report.png")
]


Le classi dell'inbound adapter gestiscono l'invio del file dati in uscita usando le funzionalità di Flask.

L'Inbound Port è un'interfaccia funzionale che espone un metodo che accetta come parametri un id del modello su cui eseguire la valutazione e ritorna il file di report generato come una classe della libreria standard

La porta è implementata da un Service che realizza la logica applicativa.

Il service si avvale di una classe di Dominio apposita: reportDTO, questa scelta è stata presa in quanto è stato ritenuto più appropriato l'uso di un oggetto privo di comportamento   durante il processo di importazione ed esportazione

La generazione del file di report è gestita come servizio esterno con una porta dedicata e implementata da una classe esterna, non viene usato un factory in quanto è da supportare la generazione di una solo forma di report. 
*/
== Export <export>
=== ExportDevice

#figure(
  image("../uml/png/Export/ExportDevice.png", width: 100%),
  caption: [Caso d'uso ExportDevice]
) <fig-export-device>

Il diagramma illustra l'architettura del modulo dedicato all'esportazione dei dati di un dispositivo (inclusi i suoi asset e le relative valutazioni di conformità) in un file scaricabile. Il sistema supporta tre formati — CSV, XML e JSON — gestiti tramite il pattern _Factory_ per la selezione dell'esportatore corretto e il pattern _Template Method_ per standardizzare l'algoritmo di generazione del file.

- Per la definizione di _MongoDeviceAdapter_, vedere la sezione @MongoDeviceAdapter. \
- Per la definizione di _FindDevicePort_, vedere la sezione @FindDevicePort. \
- Per la definizione di _AllowedDeviceFileExtension_, vedere la sezione @AllowedDeviceFileExtension.

Di seguito vengono documentati esclusivamente i componenti introdotti specificamente per questo caso d'uso.

==== FlaskExportDeviceController
#figure(
  image("../uml/png/Export/ExportDeviceController.png", width: 35%),
  caption: [FlaskExportDeviceController]
)

*Descrizione*

_ExportDeviceController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP di esportazione di un dispositivo, estrae l'identificativo del dispositivo e il formato desiderato dalla request e inoltra il Command al livello applicativo.

*Attributi*

_ExportDeviceController_ non definisce attributi propri.

*Metodi e funzioni*

- `+ export_device(device_id: String): Response` — riceve la richiesta HTTP, estrae l'identificativo del dispositivo e il formato desiderato come query parameter, invoca il caso d'uso di esportazione e restituisce il file generato come risposta HTTP scaricabile.

==== ExportDeviceUseCase
#figure(
  image("../uml/png/Export/ExportDeviceUseCase.png", width: 35%),
  caption: [ExportDeviceUseCase]
)

*Descrizione*

_ExportDeviceUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per l'esportazione dei dati di un dispositivo in un file. Viene implementata da _ExportDeviceService_ e utilizzata da _ExportDeviceController_.

*Attributi*

_ExportDeviceUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ export_device(command: ExportDeviceCommand): ExportedFile` — firma del metodo delegato all'esecuzione della logica di esportazione a partire dai dati contenuti nel Command.

==== ExportDeviceCommand
#figure(
  image("../uml/png/Export/ExportDeviceCommand.png", width: 40%),
  caption: [ExportDeviceCommand]
)

*Descrizione*

_ExportDeviceCommand_ è il Command Object che veicola i parametri della richiesta di esportazione dal controller al service.

*Attributi*

- `+ device_id: String` — identificativo univoco del dispositivo da esportare.
- `+ extension: AllowedDeviceFileExtension` — formato del file richiesto per l'esportazione, vincolato ai valori dell'enumerazione _AllowedDeviceFileExtension_.

*Metodi e funzioni*

_ExportDeviceCommand_ non definisce metodi propri.

==== ExportedFile <ExportedFile>
#figure(
  image("../uml/png/Export/ExportedFile.png", width: 40%),
  caption: [ExportedFile]
)

*Descrizione*

_ExportedFile_ è il Data Transfer Object che incapsula il risultato dell'operazione di esportazione. Viene popolato dal service e restituito al controller per la costruzione della risposta HTTP.

*Attributi*

- `+ content: IO[bytes]` — contenuto binario del file generato.
- `+ filename: String` — nome del file da utilizzare nell'header della risposta HTTP.
- `+ media_type: String` — tipo MIME del file generato.

*Metodi e funzioni*

_ExportedFile_ non definisce metodi propri.

==== ExportDeviceService
#figure(
  image("../uml/png/Export/ExportDeviceService.png", width: 45%),
  caption: [ExportDeviceService]
)

*Descrizione*

_ExportDeviceService_ è il service applicativo appartenente all'Application Core responsabile di orchestrare il processo di esportazione. Implementa l'interfaccia _ExportDeviceUseCase_, recupera il dispositivo tramite _FindDevicePort_, ottiene l'esportatore appropriato tramite _FileDeviceExporterFactoryPort_ e avvia la generazione del file tramite _FileDeviceExporterPort_; restituisce il risultato incapsulato in un oggetto _ExportedFile_.

*Attributi*

_ExportDeviceService_ non definisce attributi propri.

*Metodi e funzioni*

- `+ export_device(command: ExportDeviceCommand): ExportedFile` — concretizza il contratto definito da _ExportDeviceUseCase_. Recupera il dispositivo, ottiene l'esportatore corretto tramite la factory e restituisce il file generato incapsulato in _ExportedFile_.

==== FileDeviceExporterFactoryPort
#figure(
  image("../uml/png/Export/FileDeviceExporterFactoryPort.png", width: 40%),
  caption: [FileDeviceExporterFactoryPort]
)

*Descrizione*

_FileDeviceExporterFactoryPort_ è l'interfaccia (Outbound Port) che definisce il contratto per l'ottenimento dell'esportatore appropriato in base al formato richiesto. Viene implementata da _ConcreteFileDeviceExporterFactory_ e utilizzata da _ExportDeviceService_.

*Attributi*

_FileDeviceExporterFactoryPort_ non definisce attributi.

*Metodi e funzioni*

- `+ get_file_device_exporter(extension: AllowedDeviceFileExtension): FileDeviceExporterPort` — restituisce l'istanza dell'esportatore corrispondente al formato specificato.

==== FileDeviceExporterPort
#figure(
  image("../uml/png/Export/FileDeviceExportPort.png", width: 40%),
  caption: [FileDeviceExporterPort]
)

*Descrizione*

_FileDeviceExporterPort_ è l'interfaccia (Outbound Port) che definisce il contratto per la generazione del file di esportazione. Viene implementata da _FileDeviceExporter_ e utilizzata da _ExportDeviceService_.

*Attributi*

_FileDeviceExporterPort_ non definisce attributi.

*Metodi e funzioni*

- `+ generate_device_file(device: Device): bytes` — firma del metodo delegato alla generazione del file; riceve l'entità _Device_ e restituisce il file generato come array di byte.

==== FileDeviceExporter
#figure(
  image("../uml/png/Export/FileDeviceExporter.png", width: 45%),
  caption: [FileDeviceExporter]
)

*Descrizione*

_FileDeviceExporter_ è la classe astratta appartenente all'Outbound Adapter che implementa _FileDeviceExporterPort_ definendo lo scheletro dell'algoritmo di esportazione tramite il pattern _Template Method_. Le sottoclassi concrete implementano i passi specifici per ciascun formato.

*Attributi*

_FileDeviceExporter_ non definisce attributi propri.

*Metodi e funzioni*

- `+ generate_device_file(device: Device): bytes` — metodo pubblico che orchestra l'algoritmo di esportazione invocando in sequenza i metodi protetti del template.
- `# prepare_structure(device: Device): void` — metodo protetto astratto che inizializza la struttura del documento nel formato specifico.
- `# write_data(device: Device): void` — metodo protetto astratto che scrive i dati del dispositivo nella struttura inizializzata.
- `# finalize_output(): bytes` — metodo protetto astratto che chiude il documento e restituisce il contenuto serializzato come array di byte.

==== ConcreteFileDeviceExporterFactory
#figure(
  image("../uml/png/Export/ConcreteFileDeviceExporterFactory.png", width: 50%),
  caption: [ConcreteFileDeviceExporterFactory]
)

*Descrizione*

_ConcreteFileDeviceExporterFactory_ è la classe dell'Outbound Adapter che implementa _FileDeviceExporterFactoryPort_. Istanzia e restituisce l'esportatore appropriato in base al formato richiesto, selezionando tra _CSVFileDeviceExporter_, _JSONFileDeviceExporter_ e _XMLFileDeviceExporter_.

*Attributi*

- `- exporters: Dict[AllowedDeviceFileExtension, FileDeviceExporterPort]` — dizionario che mappa ogni estensione supportata alla corrispondente istanza dell'esportatore. Viene inizializzato alla creazione della factory e consultato da `get_file_device_exporter` per restituire in O(1) l'esportatore corretto senza ricorrere a strutture condizionali come `if/elif` o `match`.

*Metodi e funzioni*

- `+ get_file_device_exporter(extension: AllowedDeviceFileExtension): FileDeviceExporterPort` — restituisce l'istanza dell'esportatore corrispondente al formato specificato.

==== CSVFileDeviceExporter, JSONFileDeviceExporter, XMLFileDeviceExporter
#figure(
  image("../uml/png/Export/FilesDeviceExporter.png", width: 60%),
  caption: [CSVFileDeviceExporter, JSONFileDeviceExporter, XMLFileDeviceExporter]
)

*Descrizione*

_CSVFileDeviceExporter_, _JSONFileDeviceExporter_ e _XMLFileDeviceExporter_ sono le implementazioni concrete di _FileDeviceExporter_, ciascuna specializzata nella generazione del file nel rispettivo formato. Implementano i metodi protetti del template per la gestione della struttura e della serializzazione specifica del formato.

*Attributi*

- `CSVFileDeviceExporter`: `- output: StringIO`, `- writer: Any` — `output` è lo stream in memoria su cui viene scritto il contenuto CSV; `writer` è il `csv.writer` che scrive le righe su `output`. Entrambi devono persistere tra `prepare_structure`, `write_data` e `finalize_output` poiché il pattern Template Method separa deliberatamente i tre passi in metodi distinti.
- `JSONFileDeviceExporter`: `- data: Dict` — dizionario che accumula incrementalmente la struttura JSON del dispositivo durante `write_data` e viene serializzato in `finalize_output`.
- `XMLFileDeviceExporter`: `- root: ET.Element` — nodo radice dell'albero XML costruito durante `write_data` e serializzato in `finalize_output`.

*Metodi e funzioni*

- `# prepare_structure(device: Device): void` — inizializza la struttura del documento nel formato specifico.
- `# write_data(device: Device): void` — scrive i dati del dispositivo nella struttura inizializzata.
- `# finalize_output(): bytes` — serializza il documento e restituisce il contenuto come array di byte.

#pagebreak()
=== ExportReport

#figure(
  image("../uml/png/Export/ExportReport.png", width: 100%),
  caption: [Caso d'uso ExportReport]
) <fig-export-report>

Il diagramma illustra l'architettura del modulo dedicato alla generazione e all'esportazione dei report riassuntivi di una valutazione. Il flusso permette di recuperare i dati di una sessione, valutare il dispositivo tramite _EvaluationEngine_ e compilare dinamicamente un documento PDF da restituire all'utente tramite download.

- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la sezione @InMemoryEvaluationSessionCache. \
- Per la definizione di _GetEvaluationSessionPort_, vedere la sezione @GetEvaluationSessionPort. \
- Per la definizione di _ExportedFile_, vedere la sezione @ExportedFile.

Di seguito vengono documentati esclusivamente i componenti introdotti specificamente per questo caso d'uso.

==== FlaskExportReportController
#figure(
  image("../uml/png/Export/ExportReportController.png", width: 35%),
  caption: [ExportReportController]
)

*Descrizione*

_ExportReportController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP per la generazione e l'esportazione del report di una sessione di valutazione. Estrae dalla request i parametri necessari, costruisce il Command e inoltra la richiesta al livello applicativo.

*Attributi*

_FlaskExportReportController_ non definisce attributi propri.

*Metodi e funzioni*

- `+ export_report(session_id: String, device_id: String, fmt: String): Response` — riceve la richiesta HTTP, valida il formato richiesto, costruisce il _GenerateReportCommand_ e invoca il caso d'uso; restituisce il file generato come risposta HTTP scaricabile.

==== GenerateReportUseCase
#figure(
  image("../uml/png/Export/ExportReportUseCase.png", width: 35%),
  caption: [GenerateReportUseCase]
)

*Descrizione*

_GenerateReportUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per la generazione e l'esportazione di un report. Viene implementata da _GenerateReportService_ e utilizzata da _ExportReportController_.

*Attributi*

_GenerateReportUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ export_report(command: GenerateReportCommand): ExportedFile` — firma del metodo delegato all'esecuzione della logica di generazione del report a partire dai dati contenuti nel Command; restituisce un oggetto _ExportedFile_ contenente il file generato, il nome del file e il tipo MIME necessari alla costruzione della risposta HTTP.

==== GenerateReportCommand
#figure(
  image("../uml/png/Export/ExportReportCommand.png", width: 30%),
  caption: [GenerateReportCommand]
)

*Descrizione*

_GenerateReportCommand_ è il Command Object che veicola i parametri necessari alla generazione del report dal controller al service.

*Attributi*

- `+ session_id: String` — identificativo univoco della sessione di valutazione da cui generare il report.
- `+ device_id: String` — identificativo univoco del dispositivo oggetto del report.
- `+ report_format: ReportFormat` — formato desiderato per il report in uscita, vincolato ai valori dell'enumerazione _ReportFormat_.

*Metodi e funzioni*

_GenerateReportCommand_ non definisce metodi propri.

==== ReportFormat
#figure(
  image("../uml/png/Export/ReportFormat.png", width: 30%),
  caption: [ReportFormat]
)

*Descrizione*

_ReportFormat_ è un'enumerazione che definisce i formati di report supportati dal sistema.

*Valori*

- `PDF` — formato PDF.

==== GenerateReportService
#figure(
  image("../uml/png/Export/ExportReportService.png", width: 45%),
  caption: [GenerateReportService]
)

*Descrizione*

_GenerateReportService_ è il service applicativo appartenente all'Application Core responsabile dell'orchestrazione del processo di generazione del report. Implementa l'interfaccia _GenerateReportUseCase_, recupera la sessione attiva tramite _GetEvaluationSessionPort_, valuta il dispositivo tramite _EvaluationEngine_, costruisce il dettaglio della valutazione e delega la generazione materiale del documento a _ReportGeneratorPort_; restituisce il risultato incapsulato in un oggetto _ExportedFile_. Internamente utilizza i metodi privati `_build_device_detail`, `_build_asset_detail` e `_build_requirement_detail` per costruire la struttura gerarchica dei dettagli di valutazione.

*Attributi*

_GenerateReportService_ non definisce attributi propri.

*Metodi e funzioni*

- `+ export_report(command: GenerateReportCommand): ExportedFile` — concretizza il contratto definito da _GenerateReportUseCase_. Recupera la sessione, valuta il dispositivo tramite _EvaluationEngine_, costruisce il dettaglio della valutazione e restituisce il file generato incapsulato in _ExportedFile_.

==== EvaluationEngine
#figure(
  image("../uml/png/Export/EvaluationEngine.png", width: 45%),
  caption: [EvaluationEngine]
)

*Descrizione*

_EvaluationEngine_ è il Domain Service appartenente all'Application Core responsabile della valutazione di conformità di un dispositivo rispetto a uno standard. Riceve il dispositivo e lo standard dalla sessione attiva, valuta ciascun asset e ciascun requisito applicando la logica dei decision tree, e restituisce un _DeviceEvaluationResult_ contenente il verdetto complessivo e i risultati per ogni asset e requisito. Internamente utilizza una cache per la memoizzazione dei risultati intermedi tramite il metodo privato `_resolve`, e aggrega i verdetti tramite `_aggregate_evaluation_states`.

*Attributi*

_EvaluationEngine_ non definisce attributi propri.

*Metodi e funzioni*

- `+ evaluate(device: Device, standard: ComplianceStandard): DeviceEvaluationResult` — valuta il dispositivo rispetto allo standard fornito e restituisce il risultato complessivo della valutazione.

==== ReportGeneratorPort
#figure(
  image("../uml/png/Export/ReportGeneratorPort.png", width: 40%),
  caption: [ReportGeneratorPort]
)

*Descrizione*

_ReportGeneratorPort_ è l'interfaccia (Outbound Port) che definisce il contratto per la generazione materiale del report a partire dal dettaglio della valutazione. Viene implementata da _PdfReportGenerator_ e utilizzata da _GenerateReportService_.

*Attributi*

_ReportGeneratorPort_ non definisce attributi.

*Metodi e funzioni*

- `+ generate_report(device_evaluation: DeviceEvaluationDetail): IO[bytes]` — firma del metodo delegato alla generazione del file del report a partire dal dettaglio della valutazione del dispositivo.

==== PdfReportGenerator
#figure(
  image("../uml/png/Export/PdfReportGeneratorAdapter.png", width: 50%),
  caption: [PdfReportGenerator]
)

*Descrizione*

_PdfReportGenerator_ è l'Outbound Adapter che implementa _ReportGeneratorPort_. Si occupa della formattazione e della generazione materiale del file del report in formato PDF a partire dal dettaglio della valutazione. Internamente utilizza metodi privati per la formattazione dell'intestazione, del corpo e del piè di pagina del documento.

*Attributi*

_PdfReportGenerator_ non definisce attributi propri.

*Metodi e funzioni*

- `+ generate_report(device_evaluation: DeviceEvaluationDetail): IO[bytes]` — implementa il metodo dell'interfaccia, avviando il processo di creazione del PDF e restituendo lo stream di byte generato.



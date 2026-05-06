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
== Export
=== ExportDevice

#figure(
  image("../uml/png/Export/ExportDevice.png", width: 100%),
  caption: [Caso d'uso ExportDevice]
) <fig-export-device>

Il diagramma illustra l'architettura del modulo dedicato all'esportazione dei dati di un dispositivo (inclusi i suoi asset e le relative valutazioni di conformità) in un file scaricabile. Il sistema supporta diversi formati (es. JSON, XML, CSV) utilizzando il pattern Factory per la creazione dell'esportatore corretto e il pattern Template Method per standardizzare l'algoritmo di generazione del file.

- Per la definizione di _MongoDeviceAdapter_, vedere la sezione @MongoDeviceAdapter.
- Per la definizione di _Device_, vedere la sezione @Device.
- Per la definizione di _FindDevicePort_, vedere la sezione @FindDevicePort.



==== ExportDeviceController
#figure(
  image("../uml/png/Export/ExportDeviceController.png", width: 35%),
  caption: [ExportDeviceController]
) 
*Descrizione*

_ExportDeviceController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP di esportazione di un dispositivo e le inoltra al livello applicativo.

*Attributi*

- `- export_uc: ExportDeviceUseCase` — riferimento all'interfaccia (porta di ingresso) del caso d'uso, iniettata nel controller per delegare l'esecuzione della logica di business.

*Metodi e funzioni*

- `+ export_device(req: Request): Response` — riceve la richiesta HTTP, estrae l'identificativo del dispositivo e il formato desiderato, invoca il caso d'uso di esportazione e delega la costruzione della risposta HTTP al _DownloadFileController_.

==== DownloadFileController <DownloadFileController>
#figure(
  image("../uml/png/Export/DownloadFileController.png", width: 40%),
  caption: [DownloadFileController]
) 
*Descrizione*

_DownloadFileController_ è una classe di utilità dell'Inbound Adapter responsabile della formattazione dell'output binario in una risposta HTTP valida per il download di file.

*Attributi*

_DownloadFileController_ non definisce attributi propri.

*Metodi e funzioni*

- `+ build_file_response(file_bytes: bytes, filename: string): FlaskResponse` — impacchetta l'array di byte generato dall'Application Core all'interno di una `FlaskResponse` configurata con gli header corretti per forzare il download del file lato client.


==== ExportDeviceUseCase
#figure(
  image("../uml/png/Export/ExportDeviceUseCase.png", width: 35%),
  caption: [ExportDeviceUseCase]
) 
*Descrizione*

_ExportDeviceUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per l'esportazione dei dati di un dispositivo in formato byte. Viene implementata da _ExportDeviceService_ e utilizzata da _ExportDeviceController_.


==== ExportDeviceCommand
#figure(
  image("../uml/png/Export/ExportDeviceCommand.png", width: 40%),
  caption: [ExportDeviceCommand]
) 
*Descrizione*

_ExportDeviceCommand_ è il Command Object che veicola i parametri della richiesta di esportazione dal controller al service.

*Attributi*

- `+ device_id: String` — identificativo univoco del dispositivo da esportare.
- `+ extension: AllowedDeviceFileExtension` — formato del file richiesto per l'esportazione (es. XML, JSON).


==== AllowedDeviceFileExtension
#figure(
  image("../uml/png/Export/AllowedDeviceFileExtension.png", width: 40%),
  caption: [AllowedDeviceFileExtension]
) 
*Descrizione*

_AllowedDeviceFileExtension_ è un'enumerazione che definisce i formati di file supportati dal sistema per l'esportazione dei dispositivi.

*Valori*
- `XML`
- `JSON`
- `CSV`


==== ExportDeviceService
#figure(
  image("../uml/png/Export/ExportDeviceService.png", width: 45%),
  caption: [ExportDeviceService]
) 
*Descrizione*

_ExportDeviceService_ è il service applicativo responsabile di orchestrare il processo di esportazione. Legge i parametri della richiesta, recupera il dispositivo tramite _FindDevicePort_, converte i dati, richiede l'esportatore corretto tramite _FileDeviceExporterFactoryPort_ e avvia la generazione del file tramite _FileDeviceExporterPort_.

*Attributi*

_ExportDeviceService_ non definisce attributi propri.

*Metodi e funzioni*

- `+ export(query: ExportDeviceQuery): bytes` — concretizza il contratto definito da _ExportDeviceUseCase_, restituendo il file generato sotto forma di array di byte. *(Nota: il parametro riceve i dati strutturati dal Command).*


==== DeviceFileCommand, AssetFileCommand e AssessmentFileCommand
#figure(
  image("../uml/png/Export/DeviceFileCommand.png", width: 45%),
  caption: [DDeviceFileCommand, AssetFileCommand e AssessmentFileCommand]
) 
*Descrizione*

Questo gruppo di classi rappresenta i Data Transfer Object (DTO) gerarchici creati dal service per passare i dati di dominio all'Adapter di esportazione in un formato disaccoppiato dalle entità core.

*Attributi principali*

- *DeviceFileCommand*: Contiene le anagrafiche del dispositivo (`device_name`, `device_os_name`, `model_name`, ecc.) e una lista di `AssetFileCommand`.
- *AssetFileCommand*: Contiene i dettagli del singolo asset (`asset_name`, `asset_type`, ecc.) e una lista di `AssessmentFileCommand`.
- *AssessmentFileCommand*: Contiene il codice del requisito valutato (`requirement_code`) e un dizionario con le relative risposte dell'utente (`answers`).


==== ConcreteFileDeviceExporterFactory
#figure(
  image("../uml/png/Export/ConcreteFileDeviceExporterFactory.png", width: 50%),
  caption: [ConcreteFileDeviceExporterFactory]
) 
*Descrizione*

_ConcreteFileDeviceExporterFactory_ è l'Outbound Adapter che implementa il pattern Factory. Si occupa di istanziare la classe di esportazione corretta in base all'estensione richiesta.

*Metodi e funzioni*

- `+ get_file_device_exporter(extension: AllowedDeviceFileExtension): FileDeviceExporterPort` — restituisce l'istanza specifica dell'esportatore (es. JSON o XML) associata al formato richiesto.


==== FileDeviceExporter 
#figure(
  image("../uml/png/Export/FileDeviceExporter.png", width: 45%),
  caption: [FileDeviceExporter]
) 
*Descrizione*

_FileDeviceExporter_ è una classe astratta nell'Outbound Adapter che implementa _FileDeviceExporterPort_ definendo lo scheletro dell'algoritmo di esportazione tramite il pattern Template Method. Le sottoclassi concrete (_JSONFileDeviceExporter_, _XMLFileDeviceExporter_) implementano i passaggi specifici per il formato di destinazione.

*Metodi e funzioni*

- `+ generate_device_file(device_dto: DeviceFileCommand): bytes` — metodo _Template_ principale che orchestra le chiamate ai metodi protetti sottostanti.
- `# prepare_structure()` — metodo astratto per l'inizializzazione della struttura del documento (es. root XML o dizionario JSON).
- `# write_data()` — metodo astratto per l'inserimento dei dati nel documento.
- `# finalize_output()` — metodo astratto per la chiusura del documento e la conversione finale in array di byte.

==== JSONFileDeviceExporter e XMLFileDeviceExporter
#figure(
  image("../uml/png/Export/JSONFileDeviceExporter.png", width: 50%),
  caption: [JSONFileDeviceExporter e XMLFileDeviceExporter]
)
*Descrizione*

_JSONFileDeviceExporter_ e _XMLFileDeviceExporter_ sono le classi concrete dell'Outbound Adapter che estendono la classe base astratta _FileDeviceExporter_. Ognuna di esse implementa i passaggi specifici dell'algoritmo di esportazione definito tramite il pattern Template Method, occupandosi rispettivamente della formattazione e serializzazione dei dati nei formati JSON e XML.

*Attributi*

Queste classi non definiscono attributi.

*Metodi e funzioni*

- `# prepare_structure()` — implementazione concreta del passaggio di inizializzazione della struttura del file (es. la creazione del nodo root in XML o del dizionario/oggetto base in JSON).
- `# write_data()` — implementazione concreta del passaggio in cui i dati, estratti precedentemente nel DTO, vengono mappati e scritti all'interno della struttura specifica del documento.
- `# finalize_output()` — implementazione concreta della chiusura del documento (se necessaria) e della sua conversione (serializzazione) in un array di byte finale, pronto per essere inviato al client.

==== FileDeviceExporterFactoryPort
#figure(
  image("../uml/png/Export/FileDeviceExporterFactoryPort.png", width: 40%),
  caption: [FileDeviceExporterFactoryPort]
)
*Descrizione*

_FileDeviceExporterFactoryPort_ è l'interfaccia (Outbound Port) definita nell'Application Core che stabilisce il contratto per istanziare dinamicamente l'esportatore di file corretto. Viene utilizzata dal service per disaccoppiare la logica di business dalla creazione concreta degli adapter ed è implementata da _ConcreteFileDeviceExporterFactory_.

*Attributi*

_FileDeviceExporterFactoryPort_ non definisce attributi.

*Metodi e funzioni*

- `+ get_file_device_exporter(extension: AllowedDeviceFileExtension): FileDeviceExporterPort` — firma del metodo delegato alla creazione dell'esportatore. Riceve in input l'estensione desiderata e restituisce la porta _FileDeviceExporterPort_ specifica e pronta all'uso per quel formato.


==== FileDeviceExporterPort
#figure(
  image("../uml/png/Export/FileDeviceExportPort.png", width: 40%),
  caption: [FileDeviceExporterPort]
)
*Descrizione*

_FileDeviceExporterPort_ è l'interfaccia (Outbound Port) definita nell'Application Core che stabilisce il contratto per la generazione materiale del file di esportazione. Viene utilizzata dal service per avviare la serializzazione dei dati ed è implementata dalla classe _FileDeviceExporter_ dell'Outbound Adapter.

*Attributi*

_FileDeviceExporterPort_ non definisce attributi.

*Metodi e funzioni*

- `+ generate_device_file(device_dto: DeviceFileCommand): bytes` — firma del metodo delegato all'esportazione vera e propria dei dati. Riceve in input la struttura gerarchica dei DTO (radicata in _DeviceFileCommand_) contenente le informazioni del dispositivo e restituisce il file generato sotto forma di array di byte.


=== ExportReport

#figure(
  image("../uml/png/Export/ExportReport.png", width: 100%),
  caption: [Caso d'uso ExportReport]
) <fig-export-report>

Il diagramma illustra l'architettura del modulo dedicato alla generazione e all'esportazione dei report riassuntivi di una valutazione. Il flusso permette di recuperare i dati di una sessione e di compilare dinamicamente un documento (ad esempio in formato PDF) da restituire all'utente tramite download.

- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la sezione @InMemoryEvaluationSessionCache.
- Per la definizione di _GetSessionPort_, vedere la sezione @GetSessionPort.
- Per la definizione di _DownloadFileController_, vedere la sezione @DownloadFileController


Di seguito vengono analizzati nel dettaglio i componenti specifici introdotti per questo caso d'uso.

==== ExportReportController
#figure(
  image("../uml/png/Export/ExportReportController.png", width: 35%),
  caption: [ExportReportController]
)
*Descrizione*

_ExportReportController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP per l'esportazione del report di una sessione di valutazione.

*Attributi*

_ExportReportController_ non definisce attributi propri.

*Metodi e funzioni*

- `+ export_report(req: Request): Response` — riceve la richiesta HTTP, estrae i parametri, invoca il caso d'uso per la generazione del report e delega alla classe di utilità _DownloadFileController_ la costruzione della risposta HTTP configurata per il download del file.


==== ExportReportUseCase
#figure(
  image("../uml/png/Export/ExportReportUseCase.png", width: 35%),
  caption: [ExportReportUseCase]
)
*Descrizione*

_ExportReportUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per l'esportazione di un report. Viene implementata da _ExportReportService_ e utilizzata da _ExportReportController_.

*Attributi*

_ExportReportUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ export(command: ExportReportCommand): bytes` — firma del metodo delegato all'esecuzione della logica di esportazione a partire dai parametri forniti.


==== ExportReportCommand
#figure(
  image("../uml/png/Export/ExportReportCommand.png", width: 30%),
  caption: [ExportReportCommand]
)
*Descrizione*

_ExportReportCommand_ è il Command Object che veicola i parametri necessari alla generazione del report dal controller al service.

*Attributi*

- `+ session_id: String` — identificativo univoco della sessione di valutazione da cui generare il report.
- `+ format: ReportFormat` — formato desiderato per il report in uscita (es. PDF).

*Metodi e funzioni*

_ExportReportCommand_ non definisce metodi.


==== ExportReportService
#figure(
  image("../uml/png/Export/ExportReportService.png", width: 45%),
  caption: [ExportReportService]
)
*Descrizione*

_ExportReportService_ è il service applicativo appartenente all'Application Core responsabile dell'orchestrazione del processo di generazione ed esportazione.

*Attributi*

_ExportReportService_ non definisce attributi propri.

*Metodi e funzioni*

- `+ export(command: ExportReportCommand): bytes` — concretizza il contratto definito da _ExportReportUseCase_. Legge l'identificativo della sessione dal comando, recupera l'entità della sessione tramite _GetSessionPort_ e delega la creazione materiale del documento a _ReportGeneratorPort_, restituendo l'array di byte finale.


==== ReportGeneratorPort
#figure(
  image("../uml/png/Export/ReportGeneratorPort.png", width: 40%),
  caption: [ReportGeneratorPort]
)
*Descrizione*

_ReportGeneratorPort_ è l'interfaccia (Outbound Port) definita nell'Application Core che stabilisce il contratto per la generazione di un report a partire dai dati di una sessione di valutazione. 

*Attributi*

_ReportGeneratorPort_ non definisce attributi.

*Metodi e funzioni*

- `+ generate_report(session: EvaluationSession): bytes` — firma del metodo delegato alla generazione materiale del file del report a partire dall'entità di dominio della sessione.


==== PdfReportGeneratorAdapter
#figure(
  image("../uml/png/Export/PdfReportGeneratorAdapter.png", width: 50%),
  caption: [PdfReportGeneratorAdapter]
)
*Descrizione*

_PdfReportGeneratorAdapter_ è l'Outbound Adapter che implementa _ReportGeneratorPort_. Si occupa della formattazione e della generazione materiale del file del report in formato PDF a partire dai dati di dominio estratti dalla sessione.

*Attributi*

_PdfReportGeneratorAdapter_ non definisce attributi propri.

*Metodi e funzioni*

- `+ generate_report(session: EvaluationSession): bytes` — implementa il metodo dell'interfaccia, avviando il processo di creazione del PDF e restituendo i byte generati.
- `# format_header()` — metodo di utilità interno per la formattazione dell'intestazione grafica e testuale del documento.
- `# print_asset_evaluations()` — metodo di utilità interno per l'iterazione e l'inserimento nel documento delle valutazioni relative ai singoli asset.
- `# format_footer()` — metodo di utilità interno per la formattazione del piè di pagina del documento.


=== ExportStandard

#figure(
  image("../uml/png/Export/ExportStandard.png", width: 100%),
  caption: [Caso d'uso ExportStandard]
) <fig-export-standard>

Il diagramma illustra l'architettura del modulo dedicato all'esportazione dei dati relativi a uno Standard di Conformità (inclusi i requisiti e le valutazioni associate) sotto forma di file scaricabile. Analogamente al caso d'uso di esportazione del dispositivo, il sistema supporta l'esportazione in vari formati ricorrendo ai pattern Factory e Template Method nel livello degli Outbound Adapter per garantire flessibilità ed estensibilità.

- Per la definizione di _MongoStandardAdapter_, vedere la sezione @MongoStandardAdapter.
- Per la definizione di _GetSessionPort_, vedere la sezione @GetSessionPort.
- Per la definizione di _DownloadFileController_, vedere la sezione @DownloadFileController
- Per la definizione di _FindStandardPort_, vedere la sezione @FindStandardPort


Di seguito vengono analizzati nel dettaglio i componenti introdotti per questo caso d'uso.

==== ExportStandardController
#figure(
  image("../uml/png/Export/ExportStandardController.png", width: 40%),
  caption: [ExportStandardController]
)
*Descrizione*

_ExportStandardController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP di esportazione di uno standard e le inoltra al livello applicativo.

*Attributi*

_ExportStandardController_ non definisce attributi propri.

*Metodi e funzioni*

- `+ export_standard(req: Request): Response` — riceve la richiesta HTTP, estrae l'identificativo dello standard e l'estensione desiderata, invoca il caso d'uso e restituisce la risposta HTTP delegando la costruzione al controller di utilità.


==== ExportStandardUseCase
#figure(
  image("../uml/png/Export/ExportStandardUseCase.png", width: 40%),
  caption: [ExportStandardUseCase]
)
*Descrizione*

_ExportStandardUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per l'esportazione dei dati di uno standard di conformità. Viene implementata da _ExportStandardService_.

*Attributi*

_ExportStandardUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ export(command: ExportStandardCommand): bytes` — firma del metodo delegato all'esecuzione della logica di esportazione a partire dai parametri forniti.


==== ExportStandardCommand
#figure(
  image("../uml/png/Export/ExportStandardCommand.png", width: 35%),
  caption: [ExportStandardCommand]
)
*Descrizione*

_ExportStandardCommand_ è il Command Object che veicola i parametri necessari all'esportazione dello standard dal controller al service.

*Attributi*

- `+ standard_id: String` — identificativo univoco dello standard da esportare.
- `+ extension: AllowedStandardFileExtension` — formato richiesto per l'esportazione.

*Metodi e funzioni*

_ExportStandardCommand_ non definisce metodi.


==== ExportStandardService
#figure(
  image("../uml/png/Export/ExportStandardService.png", width: 45%),
  caption: [ExportStandardService]
)
*Descrizione*

_ExportStandardService_ è il service applicativo appartenente all'Application Core responsabile dell'orchestrazione del processo di esportazione dello standard. 

*Attributi*

_ExportStandardService_ non definisce attributi propri.

*Metodi e funzioni*

- `+ export(command: ExportStandardCommand): bytes` — concretizza il contratto definito da _ExportStandardUseCase_. Recupera i dati dello standard, costruisce la struttura dei DTO, richiede l'esportatore corretto e avvia la generazione del file.


==== StandardFileCommand
#figure(
  image("../uml/png/Export/StandardFileCommand.png", width: 35%),
  caption: [StandardFileCommand]
)
*Descrizione*

_StandardFileCommand_ è il Data Transfer Object (DTO) radice utilizzato per disaccoppiare i dati di dominio dello standard di conformità passandoli all'Outbound Adapter per l'esportazione.

*Attributi*

- `+ standard_id: string` — identificativo dello standard.
- `+ standard_name: string` — nome dello standard.
- `+ standard_version: string` — versione dello standard.
- `+ standard_os_name: string` — sistema operativo di riferimento (se applicabile).
- `+ standard_description: string` — descrizione generale.
- `+ assets: list[AssetFileDTO]` — lista degli asset e delle rispettive valutazioni associate allo standard.

*Metodi e funzioni*

_StandardFileCommand_ non definisce metodi.


==== AssetFileCommand
#figure(
  image("../uml/png/Export/AssetFileCommand.png", width: 35%),
  caption: [AssetFileCommand]
)
*Descrizione*

_AssetFileCommand_ è il DTO che rappresenta le informazioni di un singolo asset all'interno del report di esportazione dello standard.

*Attributi*

- `+ asset_name: string` — nome dell'asset.
- `+ asset_type: AssetType` — tipologia dell'asset.
- `+ asset_description: string` — descrizione dell'asset.
- `+ assessments: list[AssessmentFileDTO]` — lista delle valutazioni effettuate sull'asset.

*Metodi e funzioni*

_AssetFileCommand_ non definisce metodi.


==== AssessmentFileCommand
#figure(
  image("../uml/png/Export/AssessmentFileCommand.png", width: 35%),
  caption: [AssessmentFileCommand]
)
*Descrizione*

_AssessmentFileCommand_ è il DTO foglia che incapsula l'esito della valutazione di uno specifico requisito di conformità.

*Attributi*

- `+ requirement_code: String` — codice del requisito valutato.
- `+ answers: dictionary[String:bool]` — dizionario contenente le risposte fornite durante la valutazione.

*Metodi e funzioni*

_AssessmentFileCommand_ non definisce metodi.

==== FileStandardExporterFactoryPort
#figure(
  image("../uml/png/Export/FileStandardExporterFactoryPort.png", width: 35%),
  caption: [ FileStandardExporterFactoryPort]
)
*Descrizione*

_FileStandardExporterFactoryPort_ è l'interfaccia (Outbound Port) che stabilisce il contratto per l'istanziazione dinamica dell'esportatore di standard corretto.

*Attributi*

_FileStandardExporterFactoryPort_ non definisce attributi.

*Metodi e funzioni*

- `+ get_file_standard_exporter(extension: AllowedStandardFileExtension): FileStandardExporterPort` — firma del metodo che restituisce l'istanza corretta dell'esportatore in base al formato richiesto.


==== FileStandardExporterPort
#figure(
  image("../uml/png/Export/FileStandardExporterPort.png", width: 35%),
  caption: [FileStandardExporterPort]
)
*Descrizione*

_FileStandardExporterPort_ è l'interfaccia (Outbound Port) definita nell'Application Core che stabilisce il contratto per la generazione materiale del file dello standard.

*Attributi*

_FileStandardExporterPort_ non definisce attributi.

*Metodi e funzioni*

- `+ generate_device_file(device_dto: StandardFileCommand): bytes` — firma del metodo delegato all'esportazione vera e propria dei dati partendo dal DTO fornito.


==== MongoStandardAdapter
#figure(
  image("../uml/png/Export/MongoStandardAdapter.png", width: 45%),
  caption: [MongoStandardAdapter]
)
*Descrizione*

_MongoStandardAdapter_ è l'Outbound Adapter che implementa le interfacce di persistenza per gli standard di conformità (inclusa _FindStandardPort_), interfacciandosi con un database MongoDB.

*Attributi*

_MongoStandardAdapter_ non definisce attributi.

*Metodi e funzioni*

- `+ save(standard: ComplianceStandard): void` — persiste uno standard di conformità nel database.
- `+ find_by_id(standard_id: String): ComplianceStandard` — implementa l'interfaccia per il recupero di uno standard in base all'ID.


==== ConcreteFileStandardExporterFactory
#figure(
  image("../uml/png/Export/ConcreteFileStandardExporterFactory.png", width: 55%),
  caption: [ConcreteFileStandardExporterFactory]
)
*Descrizione*

_ConcreteFileStandardExporterFactory_ è l'Outbound Adapter che implementa il pattern Factory per istanziare la classe di esportazione corretta.

*Attributi*

_ConcreteFileStandardExporterFactory_ non definisce attributi.

*Metodi e funzioni*

- `+ get_file_standard_exporter(extension: AllowedStandardFileExtension): FileStandardExporterPort` — restituisce un'istanza di _JSONFileStandardExporter_ o _XMLFileStandardExporter_ in base all'estensione fornita.

==== JSONFileStandardExporter e XMLFileStandardExporter
#figure(
  image("../uml/png/Export/ConcreteExporters.png", width: 50%),
  caption: [JSON e XML FileStandardExporter]
)
*Descrizione*

_JSONFileStandardExporter_ e _XMLFileStandardExporter_ sono le classi concrete che estendono _FileStandardExporter_ fornendo l'implementazione specifica per i formati JSON e XML dei passaggi previsti dal Template Method.

*Attributi*

Non definiscono attributi propri.

*Metodi e funzioni*

- `# prepare_structure()` — implementazione concreta del passaggio di inizializzazione della struttura del file.
- `# write_data()` — implementazione concreta della mappatura e scrittura dei dati.
- `# finalize_output()` — implementazione concreta della chiusura e serializzazione del documento in byte.


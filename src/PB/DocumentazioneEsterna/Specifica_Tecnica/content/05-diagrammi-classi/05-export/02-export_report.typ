=== ExportReport

#figure(
  image("../uml/png/ExportReport/GenerateReport.png", width: 120%),
  caption: [ExportReport]
) <fig-export-report>

Il diagramma illustra l'architettura del modulo dedicato alla generazione e all'esportazione dei report riassuntivi di una valutazione. Il flusso permette di recuperare i dati di una sessione, valutare il dispositivo tramite _EvaluationEngine_ e compilare dinamicamente un documento PDF da restituire all'utente tramite download.

- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la sezione @InMemoryEvaluationSessionCache. \
- Per la definizione di _GetEvaluationSessionPort_, vedere la sezione @GetEvaluationSessionPort. \
- Per la definizione di _ExportedFile_, vedere la sezione @ExportedFile.
- Per la definizione di _EvaluationEngine_, vedere la sezione @EvaluationEngine

Di seguito vengono documentati esclusivamente i componenti introdotti specificamente per questo caso d'uso.

==== FlaskExportReportController
#figure(
  image("../uml/png/ExportReport/FlaskExportReportController.png", width: 35%),
  caption: [ExportReportController]
)

*Descrizione*

_ExportReportController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP per la generazione e l'esportazione del report di una sessione di valutazione. Estrae dalla request i parametri necessari, costruisce il Command e inoltra la richiesta al livello applicativo.

*Attributi*

- `generate_report_use_case: GenerateReportUseCase` — porta di inbound usata per generare un Report.

*Metodi*

- `+ export_report(session_id: String, device_id: String, fmt: String): Response` — riceve la richiesta HTTP, valida il formato richiesto, costruisce il _GenerateReportCommand_ e invoca il caso d'uso; restituisce il file generato come risposta HTTP scaricabile.

==== GenerateReportUseCase
#figure(
  image("../uml/png/ExportReport/GenerateReportUseCase.png", width: 50%),
  caption: [GenerateReportUseCase]
)

*Descrizione*

_GenerateReportUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per la generazione e l'esportazione di un report. Viene implementata da _GenerateReportService_ e utilizzata da _ExportReportController_.

*Attributi*

_GenerateReportUseCase_ non definisce attributi.

*Metodi*

- `+ export_report(command: GenerateReportCommand): ExportedFile` — firma del metodo delegato all'esecuzione della logica di generazione del report a partire dai dati contenuti nel Command; restituisce un oggetto _ExportedFile_ contenente il file generato, il nome del file e il tipo MIME necessari alla costruzione della risposta HTTP.

==== GenerateReportCommand
#figure(
  image("../uml/png/ExportReport/GenerateReportCommand.png", width: 30%),
  caption: [GenerateReportCommand]
)

*Descrizione*

_GenerateReportCommand_ è il Command Object che veicola i parametri necessari alla generazione del report dal controller al service.

*Attributi*

- `+ session_id: String` — identificativo univoco della sessione di valutazione da cui generare il report.
- `+ device_id: String` — identificativo univoco del dispositivo oggetto del report.
- `+ report_format: ReportFormat` — formato desiderato per il report in uscita, vincolato ai valori dell'enumerazione _ReportFormat_.

*Metodi*

_GenerateReportCommand_ non definisce metodi propri.

==== ReportFormat

*Descrizione*

_ReportFormat_ è un'enumerazione che definisce i formati di report supportati dal sistema.

*Valori*

- `PDF` — formato PDF.

==== GenerateReportService
#figure(
  image("../uml/png/ExportReport/ExportReportService.png", width: 60%),
  caption: [GenerateReportService]
)

*Descrizione*

_GenerateReportService_ è il service applicativo appartenente all'Application Core responsabile dell'orchestrazione del processo di generazione del report. Implementa l'interfaccia _GenerateReportUseCase_, recupera la sessione attiva tramite _GetEvaluationSessionPort_, valuta il dispositivo tramite _EvaluationEngine_, costruisce il dettaglio della valutazione e delega la generazione materiale del documento a _ReportGeneratorPort_; restituisce il risultato incapsulato in un oggetto _ExportedFile_. Internamente utilizza i metodi privati `_build_device_detail`, `_build_asset_detail` e `_build_requirement_detail` per costruire la struttura gerarchica dei dettagli di valutazione.

*Attributi*

- `get_evaluation_session_port: GetEvaluationSessionPort` — outbound port usata per prelevare la sessione di valutazione.
- `report_generator_port: ReportGeneratorPort` — outbound port usata per generare il Report.
- `evaluation_engine: EvaluationEngine` — oggetto di dominio usato per calcolare il _DeviceResult_ i cui dati saranno immessi nel Report.

*Metodi*

- `+ export_report(command: GenerateReportCommand): ExportedFile` — concretizza il contratto definito da _GenerateReportUseCase_. Recupera la sessione, valuta il dispositivo tramite _EvaluationEngine_, costruisce il dettaglio della valutazione e restituisce il file generato incapsulato in _ExportedFile_.

==== ReportGeneratorPort
#figure(
  image("../uml/png/ExportReport/ReportGeneratorPort.png", width: 60%),
  caption: [ReportGeneratorPort]
)

*Descrizione*

_ReportGeneratorPort_ è l'interfaccia (Outbound Port) che definisce il contratto per la generazione materiale del report a partire dal dettaglio della valutazione. Viene implementata da _PdfReportGenerator_ e utilizzata da _GenerateReportService_.

*Attributi*

_ReportGeneratorPort_ non definisce attributi.

*Metodi*

- `+ generate_report(device_evaluation: DeviceEvaluationDetail): IO[bytes]` — firma del metodo delegato alla generazione del file del report a partire dal dettaglio della valutazione del dispositivo.

==== PdfReportGenerator
#figure(
  image("../uml/png/ExportReport/PdfReportGeneratorAdapter.png", width: 50%),
  caption: [PdfReportGenerator]
)

*Descrizione*

_PdfReportGenerator_ è l'Outbound Adapter che implementa _ReportGeneratorPort_. Si occupa della formattazione e della generazione materiale del file del report in formato PDF a partire dal dettaglio della valutazione. Internamente utilizza metodi privati per la formattazione dell'intestazione, del corpo e del piè di pagina del documento.

*Attributi*

_PdfReportGenerator_ non definisce attributi propri.

*Metodi*

- `+ generate_report(device_evaluation: DeviceEvaluationDetail): IO[bytes]` — implementa il metodo dell'interfaccia, avviando il processo di creazione del PDF e restituendo lo stream di byte generato
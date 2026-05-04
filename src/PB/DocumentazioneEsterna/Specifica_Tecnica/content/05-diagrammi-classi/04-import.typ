/*== Importazione ed Esportazione Dispositivi <import-export-device>

Per realizzare le funzioni di importazione ed esportazione dei dispositivi tramite file esterno rispettando i principi dell'architettura esagonale si è deciso di modellare il sistema mettendo in evidenza l'ambito di competenza delle varie classi.

=== Importazione Dispositivo
#figure(caption:"Diagramma delle classi - Importazione Dispositivo")[
  #image("../uml/png/Import_Device.png")
]
Le classi dell'inbound adapter gestiscono la ricezione del file dati in ingresso usando le funzionalità di Flask.

L'Inbound Port è un'interfaccia funzionale che espone un metodo che accetta il file come parametro un oggetto di una classe della libreria  Python standard 

La porta è implementata da un Service che realizza la logica applicativa.

Il service si avvale di una classe di Dominio apposita: DeviceFileDTO, questa scelta è stata presa in quanto è stato ritenuto più appropriato l'uso di un oggetto privo di comportamento   durante il processo di importazione ed esportazione

Per gestire la conversione da DTO a oggetti di dominio si usa una classe utility che converte il DTO in un oggetto di dominio che può essere inoltrato al sistema di permanenza

Vi sono altri servizi definiti esternamente tramite le outbound ports device file importer e device file importer factory, il factory serve a non dare al service la responsabilità di creazione dell'importer appropriato al formato di file caricato.

L'importer è implementato tramite un template method le cui implementazioni concrete sono create dal factory


=== Esportazione dispositivo

#figure(caption:"Diagramma delle classi - Esportazione Dispositivo")[
  #image("../uml/png/Export_Device.png")
]

Le classi dell'inbound adapter gestiscono l'invio del file dati in uscita usando le funzionalità di Flask.

L'Inbound Port è un'interfaccia funzionale che espone un metodo che accetta come parametri un id del dispositivo da esportare e come tipo di ritorno una classe della libreria standard 

La porta è implementata da un Service che realizza la logica applicativa.

Il service si avvale di una classe di Dominio apposita: DeviceFileDTO, questa scelta è stata presa in quanto è stato ritenuto più appropriato l'uso di un oggetto privo di comportamento   durante il processo di importazione ed esportazione


Vi sono servizi definiti esternamente tramite le outbound ports device file exporter e device file exporter factory, il factory serve a non dare al service la responsabilità di creazione dell'exporter appropriato al formato di file richiesto.

L'exporter è implementato tramite un template method le cui implementazioni concrete sono create dal factory




=== Classi Condivise

Essendo importazione ed esportazione 2 processi strettamente collegati, è stato ritenuto accettabile mantenere una classe condivisa di DTO, in quanto i dati necessari sono gli stessi sia durante il processo di importazione sia di esportazione
*/
/*
== Importazione ed Esportazione Modelli <import-export-model>

Per realizzare le funzioni di importazione ed esportazione dei modelli tramite file esterno rispettando i principi dell'architettura esagonale si è deciso di modellare il sistema mettendo in evidenza l'ambito di competenza delle varie classi.

=== Importazione Modello
#figure(caption:"Diagramma delle classi - Importazione Modello")[
  #image("../uml/png/Import_Model.png")
]
Le classi dell'inbound adapter gestiscono la ricezione del file dati in ingresso usando le funzionalità di Flask.

L'Inbound Port è un'interfaccia funzionale che espone un metodo che accetta il file come parametro un oggetto di una classe della libreria  Python standard 

La porta è implementata da un Service che realizza la logica applicativa.

Il service si avvale di una classe di Dominio apposita: ModelFileDTO, questa scelta è stata presa in quanto è stato ritenuto più appropriato l'uso di un oggetto privo di comportamento   durante il processo di importazione ed esportazione

Per gestire la conversione da DTO a oggetti di dominio si usa una classe utility che converte il DTO in un oggetto di dominio che può essere inoltrato al sistema di permanenza

Vi sono altri servizi definiti esternamente tramite le outbound ports model file importer e model file importer factory, il factory serve a non dare al service la responsabilità di creazione dell'importer appropriato al formato di file caricato.

L'importer è implementato tramite un template method le cui implementazioni concrete sono create dal factory


=== Esportazione modello
#figure(caption:"Diagramma delle classi - Esportazione Modello")[
  #image("../uml/png/Export_Model.png")
]
Le classi dell'inbound adapter gestiscono l'invio del file dati in uscita usando le funzionalità di Flask.

L'Inbound Port è un'interfaccia funzionale che espone un metodo che accetta come parametri un id del modello da esportare e ritorna il file generato come una classe della libreria 

La porta è implementata da un Service che realizza la logica applicativa.

Il service si avvale di una classe di Dominio apposita: ModelFileDTO, questa scelta è stata presa in quanto è stato ritenuto più appropriato l'uso di un oggetto privo di comportamento   durante il processo di importazione ed esportazione


Vi sono servizi definiti esternamente tramite le outbound ports model file exporter e model file exporter factory, il factory serve a non dare al service la responsabilità di creazione dell'exporter appropriato al formato di file richiesto.

L'exporter è implementato tramite un template method le cui implementazioni concrete sono create dal factory






=== Classi Condivise

Essendo importazione ed esportazione 2 processi strettamente collegati, è stato ritenuto accettabile mantenere una classe condivisa di DTO, in quanto i dati necessari sono gli stessi sia durante il processo di importazione sia di esportazione
*/
== Import
=== ImportDevice

#figure(
  image("../uml/png/ImportDevice/import-device.png", width: 90%),
  caption: [Caso d'uso ImportDevice]
) <fig-import-device>

Il diagramma illustra l'architettura del modulo dedicato all'importazione di Dispositivi tramite file. Il modulo supporta tre formati — CSV, XML e JSON — gestiti tramite il pattern _Template Method_ e una factory dedicata. Il componente _MongoDeviceAdapter_ è già descritto nella sezione _CreateDevice_ . 
- Per la definizione di _MongoDeviceAdapter_, vedere la sezione @MongoDeviceAdapter.
- Per la definizione di _RegisterDevicePort_, vedere la sezione @RegisterDevicePort
Di seguito vengono documentati i componenti introdotti specificamente per questo caso d'uso.

#block(breakable: false)[
==== UploadFileController <UploadFileController>
#figure(
  image("../uml/png/ImportDevice/UploadFileController.png", width: 40%),
  caption: [UploadFileController]
) 
*Descrizione*

_UploadFileController_ è una classe di utilità appartenente all'Inbound Adapter che fornisce i metodi comuni per l'estrazione del contenuto e dell'estensione di un file dalla richiesta HTTP. Viene estesa da _ImportDeviceController_.

*Attributi*

_UploadFileController_ non definisce attributi propri.

*Metodi e funzioni*

- `+ get_http_file_payload(): BinaryIO` — estrae il contenuto binario del file dalla richiesta HTTP.
- `+ get_http_file_extension(): String` — estrae l'estensione del file dalla richiesta HTTP.
]


==== ImportDeviceController
#figure(
  image("../uml/png/ImportDevice/ImportDeviceController.png", width: 40%),
  caption: [ImportDeviceController]
) 
*Descrizione*

_ImportDeviceController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP di importazione di Dispositivi tramite file. 

*Attributi*

_ImportDeviceController_ non definisce attributi propri.

*Metodi e funzioni*

- `+ import_device(req: Request): Response` — riceve la richiesta HTTP di importazione, estrae il file e la sua estensione tramite i metodi ereditati e inoltra il comando al livello applicativo; restituisce una risposta HTTP con l'esito dell'operazione.


#block(breakable: false)[
==== ImportDeviceUseCase
#figure(
  image("../uml/png/ImportDevice/ImportDeviceUseCase.png", width: 40%),
  caption: [ImportDeviceUseCase]
) 
*Descrizione*

_ImportDeviceUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per l'importazione di Dispositivi da file. Viene implementata da _ImportDeviceService_ e utilizzata da _ImportDeviceController_.

*Attributi*

_ImportDeviceUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ import_device(command: ImportDeviceCommand): void` — firma del metodo delegato all'esecuzione della logica di importazione a partire dai dati contenuti nel comando.
]


==== ImportDeviceCommand
#figure(
  image("../uml/png/ImportDevice/ImportDeviceCommand.png", width: 40%),
  caption: [ImportDeviceCommand]
) 
*Descrizione*

_ImportDeviceCommand_ è il Command Object che veicola i dati necessari all'importazione di Dispositivi dal controller al service.

*Attributi*

- `+ device_file_content: BinaryIO` — contenuto binario del file da importare.
- `+ extension: AllowedDeviceFileExtension` — estensione del file, vincolata ai valori dell'enumerazione _AllowedDeviceFileExtension_.

*Metodi e funzioni*

_ImportDeviceCommand_ non definisce metodi.



==== AllowedDeviceFileExtension
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

- `- device_repository: DeviceRepositoryPort` — porta outbound per la persistenza dei Dispositivi importati.
- `- device_importer_factory: FileDeviceImporterFactoryPort` — porta outbound per l'ottenimento dell'importer appropriato in base al formato del file.

*Metodi e funzioni*

- `+ __init__(device_importer_factory: FileDeviceImporterFactoryPort, device_repository: DeviceRepositoryPort)` — inizializza il service con le dipendenze necessarie.
- `+ import_device(command: ImportDeviceCommand): void` — concretizza il contratto definito da _ImportDeviceUseCase_. Ottiene l'importer appropriato tramite la factory, effettua il parsing del file e persiste i Dispositivi estratti tramite _DeviceRepositoryPort_.

#block(breakable: false)[
==== FileDeviceImporterPort
#figure(
  image("../uml/png/ImportDevice/FileDeviceImporterPort.png", width: 40%),
  caption: [FileDeviceImporterPort]
) 
*Descrizione*

_FileDeviceImporterPort_ è l'interfaccia (Outbound Port) che definisce il contratto per il parsing di un file contenente dati di Dispositivi. Viene implementata dalle classi concrete _XMLFileDeviceImporter_, _JSONFileDeviceImporter_ e _CSVFileDeviceImporter_ tramite _FileDeviceImporter_.

*Attributi*

_FileDeviceImporterPort_ non definisce attributi.

*Metodi e funzioni*

- `+ parse_device_file(device_file_content: BinaryIO): Device` — firma del metodo che effettua il parsing del contenuto binario del file e restituisce l'entità _Device_ estratta.
]


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

- `+ parse_device_file(device_file_content: BinaryIO): Device` — metodo pubblico che orchestra l'algoritmo di parsing invocando in sequenza i metodi del template.
- `# check_metadata()` — metodo protetto che verifica i metadati del file.
- `# open_stream()` — metodo protetto che apre lo stream di lettura del file.
- `# parse_data()` — metodo protetto che effettua il parsing dei dati.
- `# close_stream()` — metodo protetto che chiude lo stream di lettura.



==== XMLFileDeviceImporter, JSONFileDeviceImporter, CSVFileDeviceImporter
#figure(
  image("../uml/png/ImportDevice/Class.png", width: 60%),
  caption: [XMLFileDeviceImporter, JSONFileDeviceImporter, CSVFileDeviceImporter]
) 
*Descrizione*

_XMLFileDeviceImporter_, _JSONFileDeviceImporter_ e _CSVFileDeviceImporter_ sono le implementazioni concrete di _FileDeviceImporter_, ciascuna specializzata nel parsing del rispettivo formato di file. Implementano i metodi protetti del template per la gestione dello stream e del parsing specifico del formato.

*Attributi*

Le tre classi non definiscono attributi propri.

*Metodi e funzioni*

Ciascuna classe implementa i metodi ereditati da _FileDeviceImporter_:
- `# check_metadata()` — verifica i metadati specifici del formato.
- `# open_stream()` — apre lo stream nel formato appropriato.
- `# parse_data()` — effettua il parsing dei dati nel formato specifico.
- `# close_stream()` — chiude lo stream di lettura.



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


=== ImportStandard
#figure(
  image("../uml/png/ImportStandard/import-standard.png", width: 120%),
  caption: [ImportStandard]
) 


Il diagramma illustra l'architettura del modulo dedicato all'importazione di standard di conformità tramite file. La struttura ricalca il pattern già adottato per _ImportDevice_ (si veda @fig-import-device), con le dovute specializzazioni per la gestione degli standard.
- Per la definizione di _UploadFileController_, vedere la sezione @UploadFileController.
- Per la definizione di _MongoStandardAdapter_, vedere la sezione @MongoStandardAdapter.
 Di seguito vengono documentati i componenti introdotti specificamente per questo caso d'uso.

#block(breakable: false)[
==== ImportStandardController
#figure(
  image("../uml/png/ImportStandard/ImportStandardController.png", width: 45%),
  caption: [ImportStandardController]
) 
*Descrizione*

_ImportStandardController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP di importazione di standard di conformità tramite file. Estende _UploadFileController_ per la gestione del payload e delega la logica applicativa tramite _ImportStandardUseCase_.

*Attributi*

_ImportStandardController_ non definisce attributi.

*Metodi e funzioni*

- `+ __init__(import_port: ImportStandardUseCase)` — inizializza il controller con la dipendenza verso il caso d'uso.
- `+ import_standard(req: Request): Response` — riceve la richiesta HTTP di importazione, estrae il file e la sua estensione tramite i metodi ereditati da _UploadFileController_ e inoltra il comando al livello applicativo; restituisce una risposta HTTP con l'esito dell'operazione.
]

#block(breakable: false)[
==== ImportStandardUseCase
#figure(
  image("../uml/png/ImportStandard/ImportStandardUseCase.png", width: 45%),
  caption: [ImportStandardUseCase]
) 
*Descrizione*

_ImportStandardUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per l'importazione di standard di conformità da file. Viene implementata da _ImportStandardService_ e utilizzata da _ImportStandardController_.

*Attributi*

_ImportStandardUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ import_standard(command: ImportStandardCommand): void` — firma del metodo delegato all'esecuzione della logica di importazione a partire dai dati contenuti nel comando.
]

#block(breakable: false)[
==== ImportStandardCommand
#figure(
  image("../uml/png/ImportStandard/ImportStandardCommand.png", width: 45%),
  caption: [ImportStandardCommand]
) 
*Descrizione*

_ImportStandardCommand_ è il Command Object che veicola i dati necessari all'importazione di uno standard di conformità dal controller al service.

*Attributi*

- `+ standard_file_content: BinaryIO` — contenuto binario del file da importare.
- `+ extension: AllowedStandardFileExtension` — estensione del file, vincolata ai valori dell'enumerazione _AllowedStandardFileExtension_.

*Metodi e funzioni*

_ImportStandardCommand_ non definisce metodi.
]



==== AllowedStandardFileExtension
#figure(
  image("../uml/png/ImportStandard/AllowedStandardFileExtension.png", width: 45%),
  caption: [AllowedStandardFileExtension]
) 
*Descrizione*

_AllowedStandardFileExtension_ è un'enumerazione che definisce i formati di file supportati per l'importazione di standard di conformità.

*Valori*

- `XML` — formato XML.
- `JSON` — formato JSON.



==== ImportStandardService
#figure(
  image("../uml/png/ImportStandard/ImportStandardService.png", width: 80%),
  caption: [ImportStandardService]
) 
*Descrizione*

_ImportStandardService_ è il service applicativo appartenente all'Application Core responsabile della logica di importazione di standard di conformità da file. Implementa l'interfaccia _ImportStandardUseCase_ e coordina il parsing del file tramite _FileStandardImporterFactoryPort_, la lettura del contenuto tramite _FileStandardImporterPort_ e la persistenza tramite _StandardSavePort_.

*Attributi*

- `- device_repository: StandardRepositoryPort` — porta outbound per la persistenza degli standard importati.
- `- device_importer_factory: FileStandardImporterFactoryPort` — porta outbound per l'ottenimento dell'importer appropriato in base al formato del file.

*Metodi e funzioni*

- `+ __init__(device_importer_factory: FileStandardImporterFactoryPort, device_repository: StandardRepositoryPort)` — inizializza il service con le dipendenze necessarie.
- `+ import_standard(command: ImportStandardCommand): void` — concretizza il contratto definito da _ImportStandardUseCase_. Ottiene l'importer appropriato tramite la factory, effettua il parsing del file e persiste lo standard estratto tramite _StandardSavePort_.


#block(breakable: false)[
==== FileStandardImporterPort
#figure(
  image("../uml/png/ImportStandard/FileStandardImportPort.png", width: 50%),
  caption: [FileStandardImporterPort]
) 
*Descrizione*

_FileStandardImporterPort_ è l'interfaccia (Outbound Port) che definisce il contratto per il parsing di un file contenente dati di standard di conformità. Viene implementata dalle classi concrete _XMLFileStandardImporter_ e _JSONFileStandardImporter_ tramite _FileStandardImporter_.

*Attributi*

_FileStandardImporterPort_ non definisce attributi.

*Metodi e funzioni*

- `+ parse_standard_file(standard_file_content: BinaryIO): ComplianceStandard` — firma del metodo che effettua il parsing del contenuto binario del file e restituisce l'entità _ComplianceStandard_ estratta.
]

#block(breakable: false)[
==== StandardSavePort
#figure(
  image("../uml/png/ImportStandard/StandardSavePort.png", width: 35%),
  caption: [StandardSavePort]
) 
*Descrizione*

_StandardSavePort_ è l'interfaccia (Outbound Port) che definisce il contratto per la persistenza di uno standard di conformità nel database. Viene implementata da _MongoStandardAdapter_ e utilizzata da _ImportStandardService_.

*Attributi*

_StandardSavePort_ non definisce attributi.

*Metodi e funzioni*

- `+ save(standard: ComplianceStandard): void` — firma del metodo che persiste lo standard di conformità nel database.
]

#block(breakable: false)[
==== FileStandardImporterFactoryPort
#figure(
  image("../uml/png/ImportStandard/FileStandardImporterFactoryPort.png", width: 70%),
  caption: [FileStandardImporterFactoryPort]
) 
*Descrizione*

_FileStandardImporterFactoryPort_ è l'interfaccia (Outbound Port) che definisce il contratto per l'ottenimento dell'importer appropriato in base all'estensione del file. Viene implementata da _ConcreteFileStandardImporterFactory_.

*Attributi*

_FileStandardImporterFactoryPort_ non definisce attributi.

*Metodi e funzioni*

- `+ get_file_standard_importer(extension: AllowedStandardFileExtension): FileStandardImporterPort` — restituisce l'istanza dell'importer appropriato per il formato specificato.
]

#block(breakable: false)[
==== FileStandardImporter
#figure(
  image("../uml/png/ImportStandard/FileStandardImporter.png", width: 70%),
  caption: [FileStandardImporter]
) 
*Descrizione*

_FileStandardImporter_ è la classe astratta appartenente all'Outbound Adapter che implementa il pattern _Template Method_ per il parsing dei file di standard di conformità. Definisce lo scheletro dell'algoritmo di importazione, delegando alle sottoclassi concrete l'implementazione dei passi specifici per ciascun formato.

*Attributi*

_FileStandardImporter_ non definisce attributi propri.

*Metodi e funzioni*

- `+ parse_standard_file(standard_file_content: BinaryIO): ComplianceStandard` — metodo pubblico che orchestra l'algoritmo di parsing invocando in sequenza i metodi del template.
- `# check_metadata()` — verifica i metadati del file.
- `# open_stream()` — apre lo stream di lettura del file.
- `# parse_data()` — effettua il parsing dei dati.
- `# close_stream()` — chiude lo stream di lettura.
]

#block(breakable: false)[
==== JSONFileStandardImporter e XMLFileStandardImporter
#figure(
  image("../uml/png/ImportStandard/File.png", width: 70%),
  caption: [JSONFileStandardImporter e XMLFileStandardImporter]
) 
*Descrizione*

_JSONFileStandardImporter_ e _XMLFileStandardImporter_ sono le implementazioni concrete di _FileStandardImporter_, ciascuna specializzata nel parsing del rispettivo formato di file. Implementano i metodi protetti del template per la gestione dello stream e del parsing specifico del formato.

*Attributi*

Le due classi non definiscono attributi propri.

*Metodi e funzioni*

Ciascuna classe implementa i metodi ereditati da _FileStandardImporter_:
- `# check_metadata()` — verifica i metadati specifici del formato.
- `# open_stream()` — apre lo stream nel formato appropriato.
- `# parse_data()` — effettua il parsing dei dati nel formato specifico.
- `# close_stream()` — chiude lo stream di lettura.
]

#block(breakable: false)[
==== ConcreteFileStandardImporterFactory
#figure(
  image("../uml/png/ImportStandard/ConcreteFileStandardImporterFactory.png", width: 70%),
  caption: [ConcreteFileStandardImporterFactory]
) 
*Descrizione*

_ConcreteFileStandardImporterFactory_ è la classe dell'Outbound Adapter che implementa _FileStandardImporterFactoryPort_. Istanzia e restituisce l'importer appropriato in base all'estensione del file fornita, selezionando tra _JSONFileStandardImporter_ e _XMLFileStandardImporter_.

*Attributi*

_ConcreteFileStandardImporterFactory_ non definisce attributi propri.

*Metodi e funzioni*

- `+ get_file_standard_importer(extension: AllowedStandardFileExtension): FileStandardImporterPort` — restituisce l'istanza dell'importer corrispondente al formato specificato.
]
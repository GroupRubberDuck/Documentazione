
=== Design Patterns Creazionali <design-pattern-creazionali>

==== Factory — create_app()

*Introduzione*

Il Factory è un pattern creazionale che centralizza la costruzione di oggetti complessi
in un unico punto, evitando che i componenti si costruiscano le dipendenze da soli.

*Motivazioni dell'utilizzo*

In un'architettura esagonale tutti i layer devono comunicare attraverso interfacce, non
attraverso implementazioni concrete. Se ogni componente si costruisse le proprie
dipendenze, il dominio finirebbe per conoscere MongoDB, Flask e le librerie esterne,
violando la regola fondamentale dell'architettura. Il Factory risolve questo problema
concentrando tutta la conoscenza delle implementazioni concrete in un solo posto.

*Applicazione nel progetto*

`create_app()` è l'unico punto del sistema in cui le implementazioni concrete vengono
istanziate e collegate. Crea i repository MongoDB, gli adapter di import ed export, li
inietta nei service applicativi `DispositivoService`, `AssetService` e
`ValutazioneService`, e registra i Blueprint Flask. Nessun altro modulo conosce
`MongoDispositivoAdapter`, `MongoAssetAdapter` o `MongoValutazioneAdapter` direttamente
--- riceve solo oggetti già configurati attraverso le interfacce delle porte.

=== Design Patterns Strutturali <design-pattern-strutturali>

==== Facade — Application Services

*Introduzione*

Il Facade è un pattern strutturale che fornisce un'interfaccia semplificata a un insieme
di componenti complessi. Nasconde la complessità interna del sistema esponendo solo i
metodi necessari al chiamante, che non ha bisogno di sapere quante classi ci sono dietro.

*Motivazioni dell'utilizzo*

Senza Facade i Blueprint Flask dovrebbero orchestrare direttamente repository, logica di
dominio e porte outbound. Le route diventerebbero lunghe e difficili da testare. Il Facade
concentra tutta l'orchestrazione nei service applicativi, mantenendo i Blueprint sottili
e privi di logica di business.

*Applicazione nel progetto*

I service applicativi `DispositivoService`, `AssetService` e `ValutazioneService` sono
Facade. Un Blueprint che vuole creare un dispositivo chiama
`DispositivoService.creaDispositivo(dto)` in una sola riga. Dietro quella riga il Facade
valida le regole di business tramite `validaRegoleBusiness()`, crea l'entità
`Dispositivo` e la persiste attraverso `InterfaceDispositivoRepository`. Il Blueprint non
sa nulla di questo processo. Lo stesso vale per `ValutazioneService`, che dietro il
metodo `valutaNodo()` orchestra il recupero del contesto, la navigazione del decision
tree e la persistenza dello stato.

==== Adapter

*Introduzione*

L'Adapter è un pattern strutturale che traduce l'interfaccia di un componente esterno
nell'interfaccia che il sistema si aspetta. Permette a due componenti incompatibili di
collaborare senza che nessuno dei due debba cambiare la propria interfaccia.

*Motivazioni dell'utilizzo*

Il dominio definisce le proprie interfacce in termini di concetti di business ---
Dispositivo, Asset, ValutazioneRequisito. Le tecnologie esterne come MongoDB parlano un
linguaggio completamente diverso. L'Adapter traduce tra questi due mondi, proteggendo il
dominio dalla conoscenza delle tecnologie esterne.

*Applicazione nel progetto*

Ogni tecnologia esterna ha il proprio Adapter:

- `MongoDispositivoAdapter` implementa `InterfaceDispositivoRepository` e traduce i
  documenti BSON di MongoDB in entità `Dispositivo`.
- `MongoAssetAdapter` implementa `InterfaceAssetRepository` e opera direttamente
  sull'array `lista_asset` annidato nel documento `Dispositivo`, coerentemente con la
  strategia di normalizzazione selettiva adottata.
- `MongoValutazioneAdapter` implementa `InterfaceValutazioneRepository` e opera
  sull'array `lista_valutazioni` annidato all'interno del sub-documento `lista_asset`
  del documento `Dispositivo`.
- `CsvFileDeviceImporter`, `XmlFileDeviceImporter` e `JSONFileDeviceImporter`
  implementano `FileDeviceImporterPort` e traducono i rispettivi formati di file in
  oggetti `DeviceFileDTO`.
- `CsvFileDeviceExporter`, `XmlFileDeviceExporter` e `JSONFileDeviceExporter`
  implementano `FileDeviceExporterPort` e traducono i `DeviceFileDTO` nei rispettivi
  formati di file binari.
- `PDFReportGenerator` implementa `ReportGeneratorPort` e converte i dati di conformità
  in un documento PDF binario tramite fpdf2.

Il dominio non sa che MongoDB esiste --- parla solo con le porte, implementate dagli
Adapter.

=== Design Patterns Comportamentali <design-pattern-comportamentali>

==== Strategy 

*Introduzione*

Lo Strategy è un pattern comportamentale che definisce una famiglia di algoritmi
intercambiabili, incapsulandoli in classi separate che condividono la stessa interfaccia.
Il chiamante seleziona quale algoritmo usare a runtime senza modificare il proprio codice.

*Motivazioni dell'utilizzo*

Il sistema deve supportare più formati di import ed export --- JSON, CSV, XML --- e
potenzialmente nuovi formati in futuro. Senza Strategy ogni aggiunta richiederebbe
modifiche ai service applicativi con blocchi if/elif crescenti. Con Strategy aggiungere
un nuovo formato è una semplice addizione: si scrive un nuovo adapter che implementa la
porta, senza toccare il codice esistente.

*Applicazione nel progetto*

Le porte `FileDeviceImporterPort`, `FileDeviceExporterPort` e `ReportGeneratorPort` sono
interfacce Strategy. Gli adapter concreti che le implementano ---
`CsvFileDeviceImporter`, `XmlFileDeviceImporter`, `JSONFileDeviceImporter` per l'import
e i corrispondenti exporter per l'export --- sono algoritmi intercambiabili.
`ImportDeviceService` e `ExportDeviceService` non contengono logica di parsing o
serializzazione: ricevono dalla rispettiva factory un oggetto che implementa la porta e
lo usano senza sapere quale formato si trova dietro. 

==== Template Method — FileDeviceExporter, FileDeviceImporter

*Introduzione*

Il Template Method è un pattern comportamentale che definisce lo scheletro di un
algoritmo in una classe astratta, delegando alle sottoclassi l'implementazione dei passi
specifici. La sequenza complessiva è fissa; ciò che cambia è il comportamento dei
singoli passi.

*Motivazioni dell'utilizzo*

Tutti i formati di export condividono la stessa sequenza operativa: preparare la
struttura, scrivere i dati, finalizzare l'output. Senza Template Method questa sequenza
dovrebbe essere replicata in ogni exporter concreto, introducendo duplicazione e rischio
di inconsistenze. Il Template Method consente di scrivere la sequenza una sola volta
nella classe astratta, lasciando alle sottoclassi solo i dettagli specifici del formato.

*Applicazione nel progetto*

La classe astratta `FileDeviceExporter` definisce il metodo pubblico
`generate_device_file(dto)` come sequenza fissa di tre passi: `prepare_structure()`,
`write_data(dto)` e `finalize_output()`. Ogni exporter concreto ---
`CsvFileDeviceExporter`, `XmlFileDeviceExporter`, `JSONFileDeviceExporter` --- eredita
la sequenza e implementa solo i tre passi specifici del proprio formato.
`ExportDeviceService` chiama unicamente `generate_device_file(dto)` attraverso la porta
`FileDeviceExporterPort`, senza conoscere né la sequenza interna né il formato prodotto.
Lo stesso schema si applica simmetricamente agli importer tramite la classe astratta
`FileDeviceImporter`.

==== Repository

*Introduzione*

Il Repository è un pattern comportamentale che astrae il sistema di persistenza dietro
un'interfaccia che simula una collezione in memoria. Chi usa il Repository non conosce i
dettagli del database sottostante --- interagisce solo con metodi semantici come
`findById()`, `save()`, `findAll()`.

*Motivazioni dell'utilizzo*

Senza Repository la logica di business sarebbe mescolata con le query MongoDB. I test
unitari richiederebbero un database attivo per funzionare. Con Repository il dominio e i
service applicativi dipendono solo dall'interfaccia --- nei test si sostituisce
l'implementazione MongoDB con una in memoria, rendendo i test veloci e privi di
dipendenze esterne.

*Applicazione nel progetto*

`InterfaceDispositivoRepository`, `InterfaceAssetRepository` e
`InterfaceValutazioneRepository` sono porte Repository implementate rispettivamente da
`MongoDispositivoAdapter`, `MongoAssetAdapter` e `MongoValutazioneAdapter`.
`DispositivoService`, `AssetService` e `ValutazioneService` ricevono queste porte per
dependency injection nel costruttore e non conoscono mai l'implementazione concreta.
`MongoAssetAdapter` non gestisce una collection indipendente ma opera sull'array
`lista_asset` annidato nel documento `Dispositivo`; analogamente
`MongoValutazioneAdapter` opera sull'array `lista_valutazioni` annidato nel
sub-documento `lista_asset`, coerentemente con la struttura documentale di MongoDB
descritta nella sezione 3.6.

==== Unit of Work — ciclo di sessione

*Introduzione*

La Unit of Work è un pattern comportamentale che traccia tutte le modifiche effettuate
durante un'operazione e le applica al sistema di persistenza in modo atomico. Se
qualcosa va storto durante la scrittura, nessuna modifica parziale viene persistita.

*Motivazioni dell'utilizzo*

Una sessione di valutazione può coinvolgere decine di modifiche --- risposte ai nodi dei
decision tree, aggiornamenti di stato, giustificazioni. Scrivere ogni modifica
immediatamente su MongoDB esporrebbe il sistema a stati inconsistenti se l'utente
abbandona la sessione a metà. La Unit of Work garantisce che il documento persistito sia
sempre in uno stato coerente.

*Applicazione nel progetto*

Il ciclo di sessione implementa questo pattern attraverso il flusso visibile nel
diagramma di sequenza UC26/UC27. `ValutazioneService` aggiorna lo stato della
valutazione in memoria e persiste il risultato solo al termine del flusso tramite
`InterfaceValutazioneRepository`. Il documento su MongoDB non viene mai toccato durante
la navigazione dei nodi intermedi --- viene scritto una sola volta, in modo atomico,
quando la risposta porta a una foglia dell'albero decisionale o quando il progresso
intermedio viene confermato.

==== Dependency Injection

*Introduzione*

La Dependency Injection è un pattern comportamentale che consiste nel fornire a un
oggetto le proprie dipendenze dall'esterno invece di lasciare che le costruisca
internamente. Un oggetto non crea le proprie dipendenze --- le riceve come parametri,
tipicamente nel costruttore.

*Motivazioni dell'utilizzo*

Senza Dependency Injection ogni service applicativo dovrebbe istanziare direttamente le
proprie dipendenze concrete --- `MongoDispositivoAdapter()`, `CsvFileDeviceImporter()`
--- accoppiandosi alle implementazioni specifiche. Questo rende impossibile sostituire
le implementazioni nei test. Con Dependency Injection il service dipende solo
dall'interfaccia della porta.

*Applicazione nel progetto*

`DispositivoService` riceve `InterfaceDispositivoRepository` nel costruttore.
`AssetService` riceve `InterfaceAssetRepository`. `ValutazioneService` riceve
`InterfaceValutazioneRepository`, `InterfaceDispositivoRepository` e
`InterfaceModelloRepository`. `ImportDeviceService` riceve `FileDeviceImporterFactoryPort`
e `DeviceRepositoryPort`. `ExportDeviceService` riceve `FileDeviceExporterFactoryPort` e
`DeviceRepositoryPort`. In nessun caso le dipendenze vengono istanziate internamente al
service. La Composition Root `create_app()` è l'unico punto che conosce le
implementazioni concrete e le inietta nei service prima di registrare i Blueprint Flask.
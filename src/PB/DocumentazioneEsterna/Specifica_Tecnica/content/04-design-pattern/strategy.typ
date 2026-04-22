#import "/src/TypstTemplate/specificaTecnica/design-pattern-presenter.typ": design-pattern-presenter

#let pattern=(
  pattern-name:"Strategy",
  descrizione:[Lo Strategy è un pattern comportamentale che definisce una famiglia di algoritmi
intercambiabili, incapsulandoli in classi separate che condividono la stessa interfaccia.
Il chiamante seleziona quale algoritmo usare a runtime senza modificare il proprio codice.],
  motivazione:[
    Il sistema deve supportare più formati di import ed export --- JSON, CSV, XML --- e
potenzialmente nuovi formati in futuro. 
Con Strategy supportare un nuovo formato consiste nel creare una nuova classe che implementa lo strategy pattern senza modificare il codice già esistente.
  ],
  utilizzo:[
    Viene utilizzato nel processo di  importazione del file
  ],
)

#design-pattern-presenter(
  ..pattern
)
// ==== Strategy 

// *Introduzione*

// Lo Strategy è un pattern comportamentale che definisce una famiglia di algoritmi
// intercambiabili, incapsulandoli in classi separate che condividono la stessa interfaccia.
// Il chiamante seleziona quale algoritmo usare a runtime senza modificare il proprio codice.

// *Motivazioni dell'utilizzo*

// Il sistema deve supportare più formati di import ed export --- JSON, CSV, XML --- e
// potenzialmente nuovi formati in futuro. 
// Con Strategy supportare un nuovo formato consiste nel creare una nuova classe che implementa lo strategy pattern senza modificare il codice già esistente.

// *Applicazione nel progetto*

// Le porte `FileDeviceImporterPort`, `FileDeviceExporterPort` e `ReportGeneratorPort` sono
// interfacce Strategy. Gli adapter concreti che le implementano ---
// `CsvFileDeviceImporter`, `XmlFileDeviceImporter`, `JSONFileDeviceImporter` per l'import
// e i corrispondenti exporter per l'export --- sono algoritmi intercambiabili.
// `ImportDeviceService` e `ExportDeviceService` non contengono logica di parsing o
// serializzazione: ricevono dalla rispettiva factory un oggetto che implementa la porta e
// lo usano senza sapere quale formato si trova dietro. 